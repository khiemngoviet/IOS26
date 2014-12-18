//
//  SumbyCategoryVC.swift
//  CodeCamp.MoneyKeeper
//
//  Created by Khiem Ngo Viet on 12/6/14.
//  Copyright (c) 2014 Khiem Ngo Viet. All rights reserved.
//

import UIKit

class SumbyCategoryVC: UITableViewController {
    
    @IBOutlet var headerView: UIView!
    @IBOutlet var sumExpenseLB: UILabel!
    
    @IBOutlet var segment: UISegmentedControl!
    var sumbyCategories: [NSDictionary]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        self.loadData()
        self.computeSum()
    }
    
    func loadData(){
        if segment.selectedSegmentIndex == 0{
            self.sumbyCategories = Item.sumAmountByExpenseCategory() as [NSDictionary]
        }
        else{
            self.sumbyCategories = Item.sumAmountByIncomeCategory() as [NSDictionary]
        }
        self.tableView.reloadData()
    }
    
    
    @IBAction func onSegmentValueChanged(sender: UISegmentedControl) {
        self.loadData()
        self.computeSum()
    }
    
    func computeSum(){
        var sum:NSDecimalNumber = 0
        let accounts = Account.all() as [Account]
        for account in accounts{
            sum = sum.decimalNumberByAdding(account.currentAmount)
        }
        
        if segment.selectedSegmentIndex == 0{
            let sumOfExpense = Item.SumOfExpense()
            if sumOfExpense != nil{
                let sumValue: AnyObject? = (sumOfExpense as [NSDictionary])[0].objectForKey("total")
                self.sumExpenseLB.text = NSNumberFormatter.stringFromCurrency((sumValue as NSString).doubleValue)
            }
        }
        else{
            let sumOfIncome = Item.SumOfIncome()
            if sumOfIncome != nil{
                let sumValue: AnyObject? = (sumOfIncome as [NSDictionary])[0].objectForKey("total")
                self.sumExpenseLB.text = NSNumberFormatter.stringFromCurrency((sumValue as NSString).doubleValue)
            }
        }
        
        
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sumbyCategories.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell
        if let dequeCell = tableView.dequeueReusableCellWithIdentifier("#") as? UITableViewCell {
            cell = dequeCell
        } else {
            cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "#")
            
        }
        let item = self.sumbyCategories[indexPath.row] as NSDictionary
        let name: AnyObject = item.objectForKey("category.name")!
        var value: AnyObject =  item.objectForKey("total")!
        value = NSNumberFormatter.stringFromCurrency((value as NSString).doubleValue)
        cell.textLabel.text = "\(name)"
        cell.detailTextLabel?.text = "\(value)"
        return cell
    }
    
    
    
    
}

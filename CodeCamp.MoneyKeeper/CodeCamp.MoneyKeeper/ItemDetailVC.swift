//
//  ItemDetailVC.swift
//  CodeCamp.MoneyKeeper
//
//  Created by Khiem Ngo Viet on 12/5/14.
//  Copyright (c) 2014 Khiem Ngo Viet. All rights reserved.
//

import UIKit

class ItemDetailVC: UITableViewController {
    
    
    @IBOutlet var amountTextField: TSCurrencyTextField!
    @IBOutlet var descriptions: CustomTextField!
    @IBOutlet var date: CustomTextField!
    @IBOutlet var category: UILabel!

    @IBOutlet var segment: UISegmentedControl!
    
    
    var editMode: EditMode!
    var item:Item!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        date.isDateField = true
        date.dateFormat = "dd/MM/yyyy"
        if editMode == EditMode.AddNew{
            
        }
        else{
            segment.selectedSegmentIndex = item.category.isIncome.boolValue ? 1 : 0
            self.fillForm()
        }
    }
    
    func fillForm(){
        amountTextField.amount = item.amount
        category.text = item.category.name
        descriptions.text = item.descriptions
        date.text = NSDate.convertToString(item.date)
        segment.selectedSegmentIndex = item.category.isIncome.boolValue ? 1 : 0
    }
    
    func collectData(){
        item.amount = NSDecimalNumber(double: amountTextField.amount.doubleValue)
        item.descriptions = descriptions.text
        item.date = NSDate.convertFromString(date.text)
        //item.category
    }
    
    @IBAction func onSave(sender: UIBarButtonItem) {
        self.collectData()
        DataManager.singleton.saveContext()
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    @IBAction func onCancel(sender: UIBarButtonItem) {
        //DataManager.singleton.managedObjectContext!.rollback()
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let categoryVC = self.storyboard?.instantiateViewControllerWithIdentifier("CategoryList") as CategoryVC
        if indexPath.row == 0{
            categoryVC.categoryType = segment.selectedSegmentIndex == 0 ? CategoryType.Expense : CategoryType.Income
            if self.editMode == EditMode.Edit{
                categoryVC.category = item.category
            }
            self.navigationController?.pushViewController(categoryVC, animated: true)
        }
        if indexPath.row == 1{
            println("ss")
        }
    }
    
}

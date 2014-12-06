//
//  ItemDetailVC.swift
//  CodeCamp.MoneyKeeper
//
//  Created by Khiem Ngo Viet on 12/5/14.
//  Copyright (c) 2014 Khiem Ngo Viet. All rights reserved.
//

import UIKit

class ItemDetailVC: UITableViewController, UIActionSheetDelegate, CategorySelectionDelegate {
    
    
    @IBOutlet var amountTextField: TSCurrencyTextField!
    @IBOutlet var descriptions: CustomTextField!
    @IBOutlet var date: CustomTextField!
    @IBOutlet var category: UILabel!
    @IBOutlet var accountLabel: UILabel!
    @IBOutlet var segment: UISegmentedControl!
    @IBOutlet var categoryTitle: UILabel!
    
    
    
    var editMode: EditMode!
    var item:Item!
    var selectedCategory: Category?
    var selectedAccount: Account?
    override func viewDidLoad() {
        super.viewDidLoad()
        date.isDateField = true
        date.dateFormat = "dd/MM/yyyy"
        if editMode == EditMode.AddNew{
            
        }
        else{
            segment.selectedSegmentIndex = item.category.isIncome.boolValue ? 1 : 0
            if segment.selectedSegmentIndex == 0{
                self.categoryTitle.text = "Mục chi"
            }
            else{
                self.categoryTitle.text = "Mục thu"
            }
            self.selectedCategory = item.category
            self.selectedAccount = item.account
            self.fillForm()
        }
    }
    
    func fillForm(){
        amountTextField.amount = item.amount
        category.text = item.category.name
        accountLabel.text = item.account.name
        descriptions.text = item.descriptions
        date.text = NSDate.convertToString(item.date)
        segment.selectedSegmentIndex = item.category.isIncome.boolValue ? 1 : 0
    }
    
    func collectData(){
        if self.editMode == EditMode.AddNew{
            item = Item.insert() as Item
        }
        item.amount = NSDecimalNumber(double: amountTextField.amount.doubleValue)
        item.descriptions = descriptions.text
        item.date = NSDate.convertFromString(date.text)
        item.category = self.selectedCategory!
        item.account = self.selectedAccount!
    }
    
    @IBAction func onSave(sender: UIBarButtonItem) {
        self.collectData()
        self.compute()
        DataManager.singleton.saveContext()
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    func compute(){
        let account = Account.query("name == '\(item.account.name)'", sortDescriptors: nil).0?.first as Account
        if self.item.category.isIncome.boolValue { //Thu
            account.currentAmount = account.currentAmount.decimalNumberByAdding(item.amount)
            DataManager.singleton.saveContext()
        }
        else{ //Chi
            account.currentAmount = account.currentAmount.decimalNumberBySubtracting(item.amount)
            DataManager.singleton.saveContext()
        }
    }
    
    @IBAction func onCancel(sender: UIBarButtonItem) {
        DataManager.singleton.managedObjectContext!.rollback()
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    @IBAction func onSegmentChanged(sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0{
            self.categoryTitle.text = "Mục chi"
        }
        else{
            self.categoryTitle.text = "Mục thu"
        }
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
            categoryVC.delegate = self
            
            self.navigationController?.pushViewController(categoryVC, animated: true)
        }
        if indexPath.row == 1{
            let actionSheet = UIActionSheet(title: nil, delegate: self, cancelButtonTitle: "Cancel", destructiveButtonTitle: nil, otherButtonTitles: "Ví", "ATM")
            actionSheet.showInView(self.view)
        }
    }
    
    func actionSheet(actionSheet: UIActionSheet!, clickedButtonAtIndex buttonIndex: Int)
    {
        switch buttonIndex{
        case 1:
            self.setAccount("Ví")
            break;
        case 2:
            self.setAccount("ATM")
            break;
        default:
            break;
        }
    }
    
    func setAccount(name:String){
        self.accountLabel.text = name
        let account = Account.query("name == '\(name)'", sortDescriptors: nil).0?.first as Account
        self.selectedAccount = account
    }
    
    func onSelectedCategory(category: Category) {
        self.selectedCategory = category
        self.category.text = category.name
    }
    
}

//
//  CategoryDetailVC.swift
//  CodeCamp.MoneyKeeper
//
//  Created by Khiem Ngo Viet on 12/6/14.
//  Copyright (c) 2014 Khiem Ngo Viet. All rights reserved.
//

import UIKit

class CategoryDetailVC: UITableViewController,UIActionSheetDelegate {
    
    @IBOutlet var categoryNameTF: UITextField!
    @IBOutlet var parentLB: UILabel!
    @IBOutlet var descriptionTF: UITextField!
    @IBOutlet var parentCell: UITableViewCell!
    
    var editMode: EditMode!
    var category:Category!
    var categoryType: CategoryType!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Huỷ", style: UIBarButtonItemStyle.Plain, target: self, action: "onCancel:")
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Lưu", style: UIBarButtonItemStyle.Plain, target: self, action: "onSave:")
        
        if editMode == EditMode.AddNew{
            category = Category.insert() as Category
            if categoryType == CategoryType.Income{
                category.isIncome = NSNumber(bool: true)
                self.parentCell.hidden = true
                self.parentCell.frame.size.height = 0.0
            }
        }
        else{
            self.fillForm()
        }
        
    }
    
    func fillForm(){
        categoryNameTF.text = self.category.name
        parentLB.text = self.category.parent
        descriptionTF.text = self.category.descriptions
    }
    
    func collectData(){
        category.name = self.categoryNameTF.text
        category.parent = categoryType == CategoryType.Expense ? self.parentLB.text! : ""
        category.descriptions = self.descriptionTF.text
    }
    
    func onSave(sender: UIBarButtonItem) {
        self.collectData()
        DataManager.singleton.saveContext()
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    
    func onCancel(sender: UIBarButtonItem) {
        DataManager.singleton.managedObjectContext?.rollback()
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 1{
            let actionSheet = UIActionSheet(title: nil, delegate: self, cancelButtonTitle: "Cancel", destructiveButtonTitle: nil, otherButtonTitles: "Ăn uống", "Đi lại", "Mua sắm", "Dịch vụ sinh hoạt")
            actionSheet.showInView(self.view)
        }
    }
    
    func actionSheet(actionSheet: UIActionSheet!, clickedButtonAtIndex buttonIndex: Int)
    {
        if actionSheet.buttonTitleAtIndex(buttonIndex) != "Cancel" {
            self.setParentCategory(actionSheet.buttonTitleAtIndex(buttonIndex))
        }
    }
    
    func setParentCategory(parent:String){
        self.parentLB.text = parent
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if self.categoryType == CategoryType.Income && indexPath.row == 1{
            return 0.1
        }
        return 50
    }
    
}

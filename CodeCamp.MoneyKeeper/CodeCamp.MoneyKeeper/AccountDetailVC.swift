//
//  AccountDetailVC.swift
//  CodeCamp.MoneyKeeper
//
//  Created by Khiem Ngo Viet on 12/6/14.
//  Copyright (c) 2014 Khiem Ngo Viet. All rights reserved.
//

import UIKit

class AccountDetailVC: UIViewController {

    @IBOutlet var originAmountTextF: TSCurrencyTextField!
    @IBOutlet var currentAmount: TSCurrencyTextField!
    
    var account: Account!
    
    override func viewDidLoad() {
        self.title = "Sửa Tài khoản"
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Huỷ", style: UIBarButtonItemStyle.Plain, target: self, action: "onCancel:")
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Lưu", style: UIBarButtonItemStyle.Plain, target: self, action: "onSave:")
        
        self.originAmountTextF.amount = NSDecimalNumber(double: account.originAmount.doubleValue)
        self.currentAmount.amount = NSDecimalNumber(double: account.currentAmount.doubleValue)
    }

   
     func onSave(sender: UIBarButtonItem) {
        account.originAmount = NSDecimalNumber(double: originAmountTextF.amount.doubleValue)
        account.currentAmount = account.originAmount
        DataManager.singleton.saveContext()
        self.navigationController?.popViewControllerAnimated(true)
    }

    
     func onCancel(sender: UIBarButtonItem) {
        DataManager.singleton.managedObjectContext?.rollback()
        self.navigationController?.popViewControllerAnimated(true)
    }

    
    @IBAction func onOriginAmountEditChanged(sender: AnyObject) {
        currentAmount.amount = originAmountTextF.amount
    }

}

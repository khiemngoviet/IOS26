//
//  Account.swift
//  CodeCamp.MoneyKeeper
//
//  Created by Khiem Ngo Viet on 12/5/14.
//  Copyright (c) 2014 Khiem Ngo Viet. All rights reserved.
//

import Foundation
import CoreData

@objc(Account)
class Account: NSManagedObject {

    @NSManaged var name: String
    @NSManaged var originAmount: NSDecimalNumber
    @NSManaged var currentAmount: NSDecimalNumber
    @NSManaged var items: NSSet

    class func add(name:String, originAmount: NSDecimalNumber, currentAmount: NSDecimalNumber) -> Account{
        let account = self.insert() as Account
        account.name = name
        account.originAmount = originAmount
        account.currentAmount = currentAmount
        return account
    }
    
}

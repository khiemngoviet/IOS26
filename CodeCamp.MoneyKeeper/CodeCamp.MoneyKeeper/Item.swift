//
//  Item.swift
//  CodeCamp.MoneyKeeper
//
//  Created by Khiem Ngo Viet on 12/5/14.
//  Copyright (c) 2014 Khiem Ngo Viet. All rights reserved.
//

import Foundation
import CoreData

@objc(Item)
class Item: NSManagedObject {

    @NSManaged var amount: NSDecimalNumber
    @NSManaged var descriptions: String
    @NSManaged var date: NSDate
    @NSManaged var category: Category
    @NSManaged var account: Account

    class func add(amount:NSDecimalNumber, description:String, date:NSDate, category: Category, account:Account) -> Item{
        let item = self.insert() as Item
        item.amount = amount
        item.descriptions = description
        item.date = date
        item.category = category
        item.account = account
        return item
    }
}

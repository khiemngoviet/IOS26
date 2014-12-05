//
//  Category.swift
//  CodeCamp.MoneyKeeper
//
//  Created by Khiem Ngo Viet on 12/5/14.
//  Copyright (c) 2014 Khiem Ngo Viet. All rights reserved.
//

import Foundation
import CoreData

@objc(Category)
class Category: NSManagedObject {

    @NSManaged var name: String
    @NSManaged var parent: String
    @NSManaged var descriptions: String
    @NSManaged var isIncome: NSNumber
    @NSManaged var items: NSSet

    class func add(name:String, parent:String, description:String, isIncome: Bool) -> Category{
        let category = self.insert() as Category
        category.name = name
        category.parent = parent
        category.descriptions = description
        category.isIncome = NSNumber(bool: isIncome)
        return category
    }
}

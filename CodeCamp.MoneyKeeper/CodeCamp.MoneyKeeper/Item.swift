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
    
    class func sumAmountByExpenseCategory() -> [AnyObject]? {
        let managedContext = DataManager.singleton.managedObjectContext!
        let entity = NSEntityDescription.entityForName(self.description(), inManagedObjectContext: managedContext)
        let keyPath = NSExpression(forKeyPath: "amount")
        let expression = NSExpression(forFunction: "sum:", arguments: [keyPath])
        let calc = NSExpressionDescription()
        calc.name = "total"
        calc.expression = expression
        
        
        let request = NSFetchRequest()
        request.entity = entity!
        request.predicate = NSPredicate(format: "category.isIncome == %@", NSNumber(bool: false))
        request.propertiesToGroupBy = ["category.name"]
        request.propertiesToFetch = ["category.name", calc]
        request.resultType = NSFetchRequestResultType.DictionaryResultType
        return managedContext.executeFetchRequest(request, error: nil)
    }
    
    class func sumAmountByIncomeCategory() -> [AnyObject]? {
        let managedContext = DataManager.singleton.managedObjectContext!
        let entity = NSEntityDescription.entityForName(self.description(), inManagedObjectContext: managedContext)
        let keyPath = NSExpression(forKeyPath: "amount")
        let expression = NSExpression(forFunction: "sum:", arguments: [keyPath])
        let calc = NSExpressionDescription()
        calc.name = "total"
        calc.expression = expression
        
        let request = NSFetchRequest()
        request.entity = entity!
        request.predicate = NSPredicate(format: "category.isIncome == %@", NSNumber(bool: true))
        request.propertiesToGroupBy = ["category.name"]
        request.propertiesToFetch = ["category.name", calc]
        request.resultType = NSFetchRequestResultType.DictionaryResultType
        return managedContext.executeFetchRequest(request, error: nil)
    }
    
    class func SumOfExpense() -> [AnyObject]?{
        let managedContext = DataManager.singleton.managedObjectContext!
        let entity = NSEntityDescription.entityForName(self.description(), inManagedObjectContext: managedContext)
        let keyPath = NSExpression(forKeyPath: "amount")
        let expression = NSExpression(forFunction: "sum:", arguments: [keyPath])
        let calc = NSExpressionDescription()
        calc.name = "total"
        calc.expression = expression
        
        let request = NSFetchRequest()
        request.entity = entity!
        request.propertiesToFetch = [calc]
        request.predicate = NSPredicate(format: "category.isIncome == %@", NSNumber(bool: false))
        request.resultType = NSFetchRequestResultType.DictionaryResultType
        return managedContext.executeFetchRequest(request, error: nil)
    }
    
    class func SumOfIncome() -> [AnyObject]?{
        let managedContext = DataManager.singleton.managedObjectContext!
        let entity = NSEntityDescription.entityForName(self.description(), inManagedObjectContext: managedContext)
        let keyPath = NSExpression(forKeyPath: "amount")
        let expression = NSExpression(forFunction: "sum:", arguments: [keyPath])
        let calc = NSExpressionDescription()
        calc.name = "total"
        calc.expression = expression
        
        let request = NSFetchRequest()
        request.entity = entity!
        request.propertiesToFetch = [calc]
        request.predicate = NSPredicate(format: "category.isIncome == %@", NSNumber(bool: true))
        request.resultType = NSFetchRequestResultType.DictionaryResultType
        return managedContext.executeFetchRequest(request, error: nil)
    }
}

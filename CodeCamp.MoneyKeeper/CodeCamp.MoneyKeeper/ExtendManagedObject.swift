//
//  ExtendManagedObject.swift
//  CoreDataSwift
//
//  Created by cuong minh on 12/3/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import Foundation
import CoreData

extension NSManagedObject {
    class func all() -> [AnyObject]? {
        let fetchRequest = NSFetchRequest()
        let managedContext = DataManager.singleton.managedObjectContext!
        let entityDes = NSEntityDescription.entityForName(self.description(), inManagedObjectContext: managedContext)
        fetchRequest.entity = entityDes
        
        return managedContext.executeFetchRequest(fetchRequest, error: nil)
    }
    
    class func request() -> NSFetchRequest {
        let fetchRequest = NSFetchRequest()
        let managedContext = DataManager.singleton.managedObjectContext!
        let entityDes = NSEntityDescription.entityForName(self.description(), inManagedObjectContext: managedContext)
        fetchRequest.entity = entityDes
        return fetchRequest
    }
    
    class func query(queryString: String, sortDescriptors: [NSSortDescriptor]?) -> ([AnyObject]?, error: NSError?){
        let fetchRequest = NSFetchRequest()
        let managedContext = DataManager.singleton.managedObjectContext!
        let entityDes = NSEntityDescription.entityForName(self.description(), inManagedObjectContext: managedContext)
        fetchRequest.entity = entityDes
        fetchRequest.predicate = NSPredicate(format: queryString)
        fetchRequest.sortDescriptors = sortDescriptors
        var error: NSError?
        let result = managedContext.executeFetchRequest(fetchRequest, error: &error)
        return (result, error)
    }
    
    class func execFetchTemplate(name: String) -> ([AnyObject]?, error: NSError?) {
        let managedContext = DataManager.singleton.managedObjectContext!
        if let fetchRequest = DataManager.singleton.managedObjectModel.fetchRequestTemplateForName(name) {
            var error: NSError?
            let result = managedContext.executeFetchRequest(fetchRequest, error: &error)
            return (result, error)
        } else {
            let userInfo = [NSLocalizedDescriptionKey: "Fetch request template is not found"]
            return (nil, NSError(domain: "CoreData", code: 1, userInfo: userInfo))
        }
    }
    
    class func count() -> Int {
        var fetchError: NSError?
        let fetchRequest = NSFetchRequest()
        let managedContext = DataManager.singleton.managedObjectContext!
        let entityDes = NSEntityDescription.entityForName(self.description(), inManagedObjectContext: managedContext)
        fetchRequest.entity = entityDes
        
        let result = managedContext.executeFetchRequest(fetchRequest, error: nil)
        return result!.count
    }
    
    class func insert() -> NSManagedObject {
        return NSEntityDescription.insertNewObjectForEntityForName(self.description(), inManagedObjectContext: DataManager.singleton.managedObjectContext!) as NSManagedObject
    }
    
    class func createFetchResultsController(sortDescriptors: [NSSortDescriptor]?, sectionKey: String?, queryString:String?) -> NSFetchedResultsController {
        
        let managedContext = DataManager.singleton.managedObjectContext!
        let fetchRequest = NSFetchRequest()
        let entityDes = NSEntityDescription.entityForName(self.description(), inManagedObjectContext: managedContext)
        fetchRequest.entity = entityDes
        fetchRequest.fetchBatchSize = 20
        if queryString != nil{
            fetchRequest.predicate = NSPredicate(format: queryString!)
        }
        fetchRequest.sortDescriptors = sortDescriptors
        
        return NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: managedContext, sectionNameKeyPath: sectionKey, cacheName: "root")
        
    }
    
    
    
    class func createFetchResultsController(sortDescriptors: [NSSortDescriptor]?, sectionKey: String?, predicate:NSPredicate?) -> NSFetchedResultsController {
        
        let managedContext = DataManager.singleton.managedObjectContext!
        let fetchRequest = NSFetchRequest()
        let entityDes = NSEntityDescription.entityForName(self.description(), inManagedObjectContext: managedContext)
        fetchRequest.entity = entityDes
        fetchRequest.fetchBatchSize = 20
        if predicate != nil{
            fetchRequest.predicate = predicate
        }
        fetchRequest.sortDescriptors = sortDescriptors
        
        return NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: managedContext, sectionNameKeyPath: sectionKey, cacheName: "root")
        
    }
}
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
   class func all(error: NSErrorPointer) -> [AnyObject]? {
        let fetchRequest = NSFetchRequest()
        let managedContext = DataManager.singleton.managedObjectContext!
        let entityDes = NSEntityDescription.entityForName(self.description(), inManagedObjectContext: managedContext)
        fetchRequest.entity = entityDes
        
        return managedContext.executeFetchRequest(fetchRequest, error: error)
    }
    
    class func request() -> NSFetchRequest {
        let fetchRequest = NSFetchRequest()
        let managedContext = DataManager.singleton.managedObjectContext!
        let entityDes = NSEntityDescription.entityForName(self.description(), inManagedObjectContext: managedContext)
        fetchRequest.entity = entityDes
        return fetchRequest
    }
    /*
    sorts: ["columA", "!columnB"] --> Sort columnA A-Z, then columnB Z-A
    */
    class func query(queryString: String?, sortTerms: [String]?) -> ([AnyObject]?, error: NSError?){
        let fetchRequest = NSFetchRequest()
        let managedContext = DataManager.singleton.managedObjectContext!
        let entityDes = NSEntityDescription.entityForName(self.description(), inManagedObjectContext: managedContext)
        fetchRequest.entity = entityDes
        if queryString != nil {
            fetchRequest.predicate = NSPredicate(format: queryString!)
        }
        
        if sortTerms != nil {
            var sortDescriptors = [NSSortDescriptor]()
            for item in sortTerms! {
                if item.hasPrefix("!") {
                    sortDescriptors.append(NSSortDescriptor(key: item[advance(item.startIndex,1)..<item.endIndex], ascending: false))
                } else {
                    sortDescriptors.append(NSSortDescriptor(key: item, ascending: true))
                }
            }
            fetchRequest.sortDescriptors = sortDescriptors
        }
        var error: NSError?
        
        let result = managedContext.executeFetchRequest(fetchRequest, error: &error)
        return (result, error)
        
    }
    
    class func execFetchTemplate(name: String) -> ([AnyObject]?, error: NSError?) {
        if let fetchRequest = DataManager.singleton.managedObjectModel.fetchRequestTemplateForName(name) {
            var error: NSError?
            let managedContext = DataManager.singleton.managedObjectContext!
            let result = managedContext.executeFetchRequest(fetchRequest, error: &error)
            return (result, error)
        } else {
            let userInfo = [NSLocalizedDescriptionKey: "Fetch request template is not found"]
            return (nil, NSError(domain: "CoreData", code: 1, userInfo: userInfo))
        }
    }
    //http://stackoverflow.com/questions/1134289/cocoa-core-data-efficient-way-to-count-entities
    class func count() -> (Int, NSError?) {

        var fetchError: NSError?
        let fetchRequest = NSFetchRequest()
        let managedContext = DataManager.singleton.managedObjectContext!
        let entityDes = NSEntityDescription.entityForName(self.description(), inManagedObjectContext: managedContext)
        fetchRequest.entity = entityDes
        fetchRequest.includesSubentities = false
        return (managedContext.countForFetchRequest(fetchRequest, error: &fetchError), fetchError)        
    }
    
    class func fetchPage(var request: NSFetchRequest, pageIndex: Int, pageSize: Int) -> ([AnyObject]?, error: NSError?) {
        let (count, error) = self.count()
        let offset = pageSize * pageIndex
        if pageSize * pageIndex < count {
            request.fetchLimit = pageSize
            request.fetchOffset = offset
            let managedContext = DataManager.singleton.managedObjectContext!
            var error: NSError?
            return (managedContext.executeFetchRequest(request, error: &error), error)
        } else {
            let userInfo = [NSLocalizedDescriptionKey: "Fetch over max records"]
            return (nil, NSError(domain: "CoreData", code: 1, userInfo: userInfo))

        }
        
    }
    
    class func insert() -> NSManagedObject {
        return NSEntityDescription.insertNewObjectForEntityForName(self.description(), inManagedObjectContext: DataManager.singleton.managedObjectContext!) as NSManagedObject
    }
    
    class func createFetchResultsController(sortDescriptors: [NSSortDescriptor]?, sectionKey: String?) -> NSFetchedResultsController {
        
        let managedContext = DataManager.singleton.managedObjectContext!
        let fetchRequest = NSFetchRequest()
        let entityDes = NSEntityDescription.entityForName(self.description(), inManagedObjectContext: managedContext)
        fetchRequest.entity = entityDes
        fetchRequest.fetchBatchSize = 20
        fetchRequest.sortDescriptors = sortDescriptors
        
        return NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: managedContext, sectionNameKeyPath: sectionKey, cacheName: "root")
 
    }
}
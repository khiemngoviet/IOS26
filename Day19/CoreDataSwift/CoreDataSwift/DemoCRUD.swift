//
//  DemoCRUD.swift
//  CoreDataSwift
//
//  Created by cuong minh on 12/3/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit
import CoreData
class DemoCRUD: ConsoleScreen {
//http://en.wikipedia.org/wiki/List_of_cat_breeds
    //Check this article http://stackoverflow.com/questions/26613971/swift-coredata-warning-unable-to-load-class-named
    override func viewDidLoad() {
        super.viewDidLoad()
        let managedContext = DataManager.singleton.managedObjectContext!
   
        let entityName = "CatBreed"
               
        let abyssinian = NSEntityDescription.insertNewObjectForEntityForName(entityName, inManagedObjectContext: managedContext) as CatBreed
        abyssinian.breed = "Abyssinian"
        abyssinian.originCountry = "Egypt"

       let aegean = NSEntityDescription.insertNewObjectForEntityForName(entityName, inManagedObjectContext: managedContext) as CatBreed

        aegean.breed = "Aegean"
        aegean.originCountry = "Greece"
        
        let savannah = NSEntityDescription.insertNewObjectForEntityForName(entityName, inManagedObjectContext: managedContext) as CatBreed
        savannah.breed = "Savannah"
        savannah.originCountry = "United States"
        
        var error: NSError?
        if !managedContext.save(&error) {
            self.writeln("\(error?.description)  - \(error?.debugDescription)")
        } else {
            self.writeln("Save data successfully")
        }
        
        var fetchError: NSError?
        let fetchRequest = NSFetchRequest()
        let entityDes = NSEntityDescription.entityForName(entityName, inManagedObjectContext: managedContext)
        fetchRequest.entity = entityDes
        
        let catBreeds = managedContext.executeFetchRequest(fetchRequest, error: &fetchError)
        if let error = fetchError {
            self.writeln("\(error.description)  - \(error.debugDescription)")
        } else {
            for item in catBreeds! {
                let breed = item as CatBreed
                self.writeln("\(breed.breed) - \(breed.originCountry)")
            }
        }
        
        
    }

}

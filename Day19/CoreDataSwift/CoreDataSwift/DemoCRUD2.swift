//
//  DemoCRUD2.swift
//  CoreDataSwift
//
//  Created by cuong minh on 12/3/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit
import CoreData
class DemoCRUD2: ConsoleScreen {

    override func viewDidLoad() {
        super.viewDidLoad()
        let managedContext = DataManager.singleton.managedObjectContext!
        CatBreed.add("Abyssinian", originCountry: "Egypt")
        CatBreed.add("Aegean", originCountry: "Greece")
        CatBreed.add("American Curl", originCountry: "United States")
        CatBreed.add("American Bobtail", originCountry: "United States")
        CatBreed.add("Bengal", originCountry: "United States")
        CatBreed.add("Savannah", originCountry: "United States")
        CatBreed.add("Brazilian Shorthair", originCountry: "Brazil")
        CatBreed.add("Chartreux", originCountry: "France")
        CatBreed.add("Khao Manee", originCountry: "Thailand")
        CatBreed.add("Korat", originCountry: "Thailand")        
        var saveError: NSError?
        if !managedContext.save(&saveError) {
            self.writeln("\(saveError?.description)  - \(saveError?.debugDescription)")
        } else {
            self.writeln("Save successfully")
        }
        
        var fetchError: NSError?
        if let catBreeds = CatBreed.all(&fetchError) {
            /*for item in catBreeds {
                let breed = item as CatBreed
                self.writeln("\(breed.breed) - \(breed.originCountry)")
            }*/
            
            for breed in catBreeds as [CatBreed] {
                self.writeln("\(breed.breed) - \(breed.originCountry)")
            }
        }
    }
    
}

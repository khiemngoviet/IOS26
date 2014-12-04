//
//  PredicateFetch.swift
//  CoreDataSwift
//
//  Created by techmaster on 12/4/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class PredicateFetch: ConsoleScreen {

    override func viewDidLoad() {
        super.viewDidLoad()
        let sortNameAZ = NSSortDescriptor(key: "breed", ascending: true)
        let (results, error) = CatBreed.query("breed beginswith 'A'", sortDescriptors: [sortNameAZ])
        if let breedsWithA = results {
            for breed in breedsWithA as [CatBreed] {
                self.writeln("\(breed.breed) - \(breed.originCountry)")
            }
        }
    }

    
}

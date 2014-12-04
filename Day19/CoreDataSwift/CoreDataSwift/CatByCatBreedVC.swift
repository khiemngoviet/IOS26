//
//  CatByCatBreedVC.swift
//  CoreDataSwift
//
//  Created by techmaster on 12/4/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class CatByCatBreedVC: ConsoleScreen {
    
    override func viewDidLoad() {
        let managedContext = DataManager.singleton.managedObjectContext!
        
        
        let (results, error) = CatBreed.query("breed == 'Bengal'", sortDescriptors: nil)
        if results?.count > 0{
            let belgal = results?.first as CatBreed
            for cat in belgal.cats{
                //self.writeln((cat as Cat).nick)
                println((cat as Cat).nick)
            }
        }
    }
    
}

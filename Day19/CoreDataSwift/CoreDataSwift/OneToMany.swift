//
//  OneToMany.swift
//  CoreDataSwift
//
//  Created by techmaster on 12/4/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class OneToMany: ConsoleScreen {
    override func viewDidLoad() {
        let managedContext = DataManager.singleton.managedObjectContext!
        let americanBobtail = CatBreed.add("American Bobtail", originCountry: "United States")
        let bengal = CatBreed.add("Bengal", originCountry: "United States")
        
        let bobtailA = Cat.add("Tom", gender: true, dob: NSDate.convertFromString("2012-11-02"), photo: UIImage(named: "bobtail.jpg"), breed: americanBobtail)
        
        let bengalA = Cat.add("Cyndia", gender: false, dob: NSDate.convertFromString("2013-12-25"), photo: UIImage(named: "Bengal.jpg"), breed: bengal)
        
        let bengalB = Cat.add("Janais", gender: true, dob: NSDate.convertFromString("2014-1-25"), photo: UIImage(named: "spangle.jpg"), breed: bengal)
        
        var saveError: NSError?
        if !managedContext.save(&saveError) {
            println("\(saveError?.description)  - \(saveError?.debugDescription)")
        } else {
            println("Save successfully")
        }
    }
}

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
        super.viewDidLoad()
        let managedContext = DataManager.singleton.managedObjectContext!
        let americanBobtail = CatBreed.add("American Bobtail", originCountry: "United States")
        let bengal = CatBreed.add("Bengal", originCountry: "United States")
        
        let bobtailA = Cat.add("Tom", gender: true, dob: NSDate.convertFromString("2012-11-02"), photo: UIImage(named: "bobtail.jpg"), breed: americanBobtail)
        
        let bengalA = Cat.add("Cyndia", gender: false, dob: NSDate.convertFromString("2013-12-25"), photo: UIImage(named: "Bengal.jpg"), breed: bengal)
        
        let bengalB = Cat.add("Janais", gender: true, dob: NSDate.convertFromString("2014-1-25"), photo: UIImage(named: "spangle.jpg"), breed: bengal)
        
        var saveError: NSError?
        if !managedContext.save(&saveError) {
            self.writeln("\(saveError?.description)  - \(saveError?.debugDescription)")
            return //if fails then quite here
        } else {
            self.writeln("Save successfully\n")
        }
        //
        let (bengals, error) = CatBreed.query("breed == 'Bengal'", sortTerms: nil)
        if bengals?.count > 0 {
            let bengalBreed = (bengals as [CatBreed]).first
            for item in bengalBreed!.cats{
                let cat = item as Cat
                self.writeln("\(cat.nick) - \(cat.dob) - \((cat.breed as CatBreed).breed)")
            }
        }
    }
}

//
//  NSCodingDemo.swift
//  CoreDataSwift
//
//  Created by techmaster on 12/1/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class NSCodingDemo: ConsoleScreen {

    override func viewDidLoad() {
        super.viewDidLoad()
        let car = Car(model: "Audi Cool", make: "Audi", year: 2014)
        
        let documentsPath : AnyObject = NSSearchPathForDirectoriesInDomains(.DocumentDirectory,.UserDomainMask,true)[0]
        let destinationPath:NSString = documentsPath.stringByAppendingString("car.dat")
        
        NSKeyedArchiver.archiveRootObject(car, toFile: destinationPath)
        let unarchivedCar = NSKeyedUnarchiver.unarchiveObjectWithFile(destinationPath) as Car
        self.writeln("\(unarchivedCar.model) - \(unarchivedCar.make) - \(unarchivedCar.year)")
    }
}

class Bike{
    
}
/*
func encodeWithCoder(aCoder: NSCoder)
init(coder aDecoder: NSCoder) // NS_DESIGNATED_INITIALIZER
*/
class Car : NSObject, NSCoding {
    var year: Int = 0
    var make: String = ""
    var model: String = ""
    init (model: String, make: String, year: Int) {
        self.model = model
        self.make = make
        self.year = year
        super.init()
    }
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeInteger(year, forKey:"year")
        aCoder.encodeObject(model, forKey:"make")
        aCoder.encodeObject(make, forKey:"model")
    }
    //Encode kiểu gì thì phải decode ở kiểu đó
    required init(coder aDecoder: NSCoder) {
        year = aDecoder.decodeIntegerForKey("year")
        make = aDecoder.decodeObjectForKey("make") as String
        model = aDecoder.decodeObjectForKey("model") as String
        super.init()
    }
}

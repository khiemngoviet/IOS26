//
//  ClassFromString.swift
//  DemoClass
//
//  Created by Trinh Minh Cuong on 10/16/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class ClassFromString: ConsoleScreen {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mainBundle = NSBundle.mainBundle()
        let info =  mainBundle.infoDictionary as NSDictionary?
        let appName = info!.objectForKey("CFBundleName") as NSString
        // Retrospection programming - Reflection programming
        if let animalType = NSClassFromString("\(appName).Dog") as? Animal.Type {
            let animal = animalType() as Animal
            self.writeln(animal.sound())
        }

    }



}

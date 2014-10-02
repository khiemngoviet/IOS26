//
//  DemoAnimal.swift
//  DemoClass
//
//  Created by ios26 on 10/2/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class DemoAnimal: ConsoleScreen {

    override func viewDidLoad() {
        super.viewDidLoad()

      self.demoAnimal()
    }

    func demoAnimal(){
        var arrInherited = [Cat(),Dog(),Pig()]
        for animal:Animal in arrInherited {
            self.writeln(animal.doNoise())
        }
        
    }

}

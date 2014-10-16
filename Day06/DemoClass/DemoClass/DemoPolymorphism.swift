//
//  DemoPolymorphism.swift
//  DemoClass
//
//  Created by techmaster on 8/22/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class DemoPolymorphism: ConsoleScreen {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.demoPoly()
       
    }
    
    func demoPoly() {
        let rec = Rectangle(width: 10, height: 20)
        let square = Square(width: 5)
        let cir = Circle(radius: 6)
        let tri = Triangle(a: 10, b: 12, c: 13.5)
        
        let shapes = [rec, square, cir, tri]
        for shape in shapes {
            self.writeln("\(shape.name) has area = \(shape.area()) and perimeter = \(shape.perimeter())\n")
        }
        
    }
    
}

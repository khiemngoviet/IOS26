//
//  DemoClass.swift
//  SwiftDemo
//
//  Created by Trinh Minh Cuong on 9/25/14.
//  Copyright (c) 2014 Techmaster Vietnam. All rights reserved.
//

import UIKit
import VisualLib

class DemoClass: ConsoleScreen {

    override func viewDidLoad() {
        super.viewDidLoad()
        demoShape()
        
        let num = 3.14156
        self.writeln(String(format: "%10.3f", 3.14156))
        self.writeln(String(format: "%10.3f",123123.3))
        let orange:Orange = Orange()
        orange.makeSweet()
    }
    
    func demoShape() {
        let shape = Shape(numberOfSides: 5, name: "Pentagon")
        shape.printDescription()
        self.writeln("name = \(shape.name)")
        
        let square = Square(width: 10)
        square.printDescription()
        self.writeln("Square's perimeter = \(square.perimeter())")
        self.writeln("Square's area = \(square.area())")
        
    }

}

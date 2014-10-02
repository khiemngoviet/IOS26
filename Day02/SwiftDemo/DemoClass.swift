//
//  DemoClass.swift
//  SwiftDemo
//
//  Created by ios26 on 9/25/14.
//  Copyright (c) 2014 khiemnv. All rights reserved.
//

import UIKit

class DemoClass: ConsoleScreen {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.demoShape()
    }
    
    func demoShape(){
        self.writeln("Shape --------")
        let shape = Shape(numOfSide: 6, name: "Hexagon")
        shape.printName()
        self.writeln("Square")
        let square = Square(width: 10)
        square.printName()
        self.writeln(square.printName())
        self.writeln("Pentagon --------")
        let pentagon = Pentagon(width1: 2.2, width2: 4, width3: 5, width4: 5.6, width5: 8)
        self.writeln(pentagon.printName())
        
        self.writeln("\(pentagon.perimeter())")
    }
  

}

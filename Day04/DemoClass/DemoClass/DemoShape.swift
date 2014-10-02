//
//  DemoShape.swift
//  DemoClass
//
//  Created by techmaster on 8/22/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class DemoShape: ConsoleScreen {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.demoShape()
        self.demoRectangle()
        self.demoSquare()
        self.demoTriangle()
        self.demoIdenticalOperator()
    }

    func demoShape() {
        let shape = Shape(numberOfSides: 3, name: "Triangle")
        self.writeln("\(shape.name) has \(shape.numberOfSides) sides")
        
        shape.printDescription()
        
        self.writeln("\(shape.description)")
    }
    
    func demoRectangle() {
        let rec = Rectangle(width: 10, height: 15)
        self.writeln("\(rec.name) has area = \(rec.area()) and perimeter = \(rec.perimeter())")
    }
    
    func demoSquare() {
        let square = Square(width: 15)
        self.writeln("\(square.name) has area = \(square.area()) and perimeter = \(square.perimeter())")
    }
    
    func demoTriangle() {
        let tri = Triangle(a: 10, b: 12, c: 14)
        self.writeln("\(tri.name) has area = \(tri.area()) and perimeter = \(tri.perimeter())")
        
        let tri2 = Triangle(a: 10.0000000001, b: 12, c: 14)
        if (tri == tri2) {
            self.writeln("tri == tri2")
        }
    }
    
    func demoIdenticalOperator() {
        var tri1 = Triangle(a: 10, b: 12, c: 14)
        var tri2 = tri1
        var tri3 = Triangle(a: 10, b: 12, c: 14)
        //So sánh identical chỉ áp dụng cho Class không áp dụng cho Struct
        if tri1 === tri2 {
            self.writeln("tri1 === tri2")
        }
        
        if tri1 === tri3 {
            self.writeln("tri1 === tri3")
        } else {
            self.writeln("tri1 !=== tri3")
        }
    }
}

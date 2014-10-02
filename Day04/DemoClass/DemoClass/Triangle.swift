//
//  Triangle.swift
//  DemoClass
//
//  Created by techmaster on 8/22/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import Foundation
//Xem thêm ở đây http://nshipster.com/swift-operators/


infix operator == {}
//Equal operator
func == (t1: Triangle, t2: Triangle) -> Bool {
    if (t1.a ~~ t2.a) && (t1.b ~~ t2.b) && (t1.c ~~ t2.c) {
        return true
    } else {
        return false
    }
}
class Triangle : Shape {
    var a, b, c: Double
    init (a: Double, b: Double, c: Double) {
        self.a = a
        self.b = b
        self.c = c
        super.init(numberOfSides: 3, name: "Triangle")
    }
    
    override func perimeter() -> Double {
        return a + b + c
    }
    
    override func area() -> Double {
        let s = 0.5 * self.perimeter()
        return sqrt(s * (s - a) * (s - b) * (s - c))
    }    
    
}
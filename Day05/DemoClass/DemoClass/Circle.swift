//
//  Circle.swift
//  DemoClass
//
//  Created by techmaster on 8/22/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import Foundation
class Circle : Shape {
    var radius: Double
    init(radius: Double) {
        self.radius = radius
        super.init(numberOfSides: 0, name: "Circle")
    }
    
    override func perimeter() -> Double {
        return 2 * M_PI * self.radius
    }
    
    override func area() -> Double {
        return self.radius * self.radius * M_PI
    }
}
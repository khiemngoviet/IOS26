//
//  Rectangle.swift
//  DemoClass
//
//  Created by techmaster on 8/22/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import Foundation
class Rectangle: Shape {
    var width, height: Double
    
    init (width: Double, height: Double) {
        self.width = width
        self.height = height
        super.init(numberOfSides: 4, name: "Rectangle")
    }
    
    override func perimeter() -> Double {
        return (self.width + self.height) * 2
    }
    
    override func area() -> Double {
        return self.width * self.height
    }
}

class SuperRectangle: Rectangle {
    
}
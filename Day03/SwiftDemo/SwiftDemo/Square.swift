//
//  Square.swift
//  SwiftDemo
//
//  Created by Trinh Minh Cuong on 9/25/14.
//  Copyright (c) 2014 Techmaster Vietnam. All rights reserved.
//

import Foundation
class Square: Shape {
    var width: Double
    init(width: Double) {
        self.width = width
        super.init(numberOfSides: 4, name: "Square")
    }
    override func perimeter() -> Double {
        return 4 * width
    }
    
    override func area() -> Double {
        return width * width
    }
}
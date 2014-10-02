//
//  Square.swift
//  DemoClass
//
//  Created by techmaster on 8/22/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import Foundation
class Square : Shape {
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
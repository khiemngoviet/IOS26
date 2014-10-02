//
//  Square.swift
//  SwiftDemo
//
//  Created by ios26 on 9/25/14.
//  Copyright (c) 2014 khiemnv. All rights reserved.
//

import Foundation
class Square: Shape {
    var width: Double
    
    init(width: Double){
        self.width = width
        super.init(numOfSide: 4, name: "Square")
    }
    
    override func area() -> Double? {
        return width * width
    }
    
    override func perimeter() -> Double? {
        return 4 * width
    }
    
    
    
}
//
//  Pentagon.swift
//  SwiftDemo
//
//  Created by ios26 on 9/25/14.
//  Copyright (c) 2014 khiemnv. All rights reserved.
//

import Foundation
class Pentagon: Shape{
    
    var width1: Double
    var width2: Double
    var width3: Double
    var width4: Double
    var width5: Double
    
    init(width1: Double, width2: Double, width3: Double, width4: Double, width5: Double){
        self.width1 = width1
        self.width2 = width2
        self.width3 = width3
        self.width4 = width4
        self.width5 = width5
        super.init(numOfSide: 5, name: "Pentagon")
    }
    
    override func perimeter() -> Double {
       return width1 + width2 + width3 + width4 + width5
    }
}
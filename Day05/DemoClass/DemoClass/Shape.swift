//
//  Shape.swift
//  DemoClass
//
//  Created by techmaster on 8/22/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import Foundation
//Định nghĩa class của Swift không cần file header *.h
class Shape {
    var numberOfSides: Int
    var name: String
    init (numberOfSides: Int, name: String) {
        self.numberOfSides = numberOfSides
        self.name = name
    }
    
    func printDescription() {
        println("\(self.name) has \(self.numberOfSides) sides")
    }
    
    var description: String {
        return "\(self.name) has \(self.numberOfSides) sides"
    }
    
    func perimeter() -> Double {
        return 0.0
    }
    
    func area() -> Double {
        return 0.0
    }
}
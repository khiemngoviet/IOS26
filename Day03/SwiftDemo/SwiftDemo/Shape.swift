//
//  Shape.swift
//  SwiftDemo
//
//  Created by Trinh Minh Cuong on 9/25/14.
//  Copyright (c) 2014 Techmaster Vietnam. All rights reserved.
//

import Foundation
class Shape {
    var numberOfSides: Int
    var name: String
    init (numberOfSides: Int, name: String) {
        self.numberOfSides = numberOfSides
        self.name = name
    }
    
    func printDescription() {
        println("\(name)")
    }
    
    func perimeter() -> Double {
        return 0
    }
    
    func area() -> Double {
        return 0
    }
}

/*
Cú pháp của Objective-C
@interface Shape: NSObject
@property(nonatomic, assign) NSInteger numberOfSide;
@property(nonatomic, strong) NSString* name;
@end
*/

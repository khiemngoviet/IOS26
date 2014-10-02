//
//  Shape.swift
//  SwiftDemo
//
//  Created by ios26 on 9/25/14.
//  Copyright (c) 2014 khiemnv. All rights reserved.
//

import Foundation

class Shape {
    
    var numberOfSide:Int = 0
    var nameOfShape: String = ""
    init(){
        
    }
    
    init(numOfSide: Int, name: String){
        numberOfSide = numOfSide
        nameOfShape = name
    }    
    
    
    func printName() -> String{
        return nameOfShape
    }
    
    func perimeter() -> Double? {
        return nil
    }
    
    func area() -> Double? {
        return nil
    }
}
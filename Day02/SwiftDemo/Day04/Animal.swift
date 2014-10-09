//
//  Animal.swift
//  SwiftDemo
//
//  Created by Khiem Ngo Viet on 10/9/14.
//  Copyright (c) 2014 khiemnv. All rights reserved.
//

import Foundation
class Animal {
    var sex: Sex
    var adulAge: Int
    var deadAge: Int
    init(sex: Sex, adulAge: Int, deadAge: Int){
        self.sex = sex
        self.adulAge = adulAge
        self.deadAge = deadAge
    }
    
    func makeLove(){
        
    }
    
    func birth(){
        
    }
    
}

enum Sex{
  case  male, female
}
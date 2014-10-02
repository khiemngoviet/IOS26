//
//  Animal.swift
//  DemoClass
//
//  Created by ios26 on 10/2/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import Foundation
class Animal {
    
    
    func doNoise() -> String {
        return ""
    }
    
}

class Cat: Animal{
    override func doNoise() -> String {
        return "MeoMeo"
    }
}

class Dog:Animal{
    override func doNoise() -> String {
        return "GoGo"
    }
}

class Pig: Animal {
    override func doNoise() -> String {
        return "OinOin"
    }
}
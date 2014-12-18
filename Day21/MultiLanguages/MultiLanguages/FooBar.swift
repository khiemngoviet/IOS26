//
//  Foo.swift
//  SwiftPerformance
//
//  Created by cuong minh on 12/8/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import Foundation
@objc(Base) class Base : NSObject {
    override var description : String {return "I am a Base"}
    func say() {
        println("Say base...")
    }
}
@objc(Foo) class Foo : Base {
    override var description : String {return "I am a Foo"}
    override func say() {
        println("Say foo...")
    }
}
@objc(Bar) class Bar : Base {
    override var description : String {return "I am a Bar"}
    override func say() {
        println("Say bar...")
    }
}

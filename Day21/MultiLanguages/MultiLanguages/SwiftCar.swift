//
//  SwiftCar.swift
//  MultiLanguages
//
//  Created by cuong minh on 12/16/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import Foundation
class SwiftCar: Car, Fly, Swim, Jump {
    func flapWing(timesPerSecond: Int32) {
        println("Swift car flap \(timesPerSecond) times per second")
    }
    func land() {
        println("Swift car is landing now")
    }
    
    func jumpOff(timesPerSec: Int32) {
        println("Swift car jumps off \(timesPerSec) times per second")
    }
}
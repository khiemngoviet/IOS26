//
//  ConditionClause.swift
//  SwiftDemo
//
//  Created by ios26 on 9/25/14.
//  Copyright (c) 2014 khiemnv. All rights reserved.
//

import UIKit

class ConditionClause: ConsoleScreen {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.demoCondition()
        self.switchCondition()
    }
    
    func demoCondition(){
        var tempArr = [10,14,21,25,30,33,35]
        let random = arc4random_uniform(UInt32(tempArr.count))
        let temp = tempArr[Int(random)]
        if temp >= 10 && temp <= 20 {
            self.writeln("Ao bong")
        }
        else if  temp <= 30 {
            self.writeln("Ao dai")
        }
        else {
            self.writeln("Mac j cung ok")
        }
        //
    }
    
    func switchCondition(){
        var tempArr = [10,14,21,25,30,33,35]
        let random = arc4random_uniform(UInt32(tempArr.count))
        let temp = tempArr[Int(random)]
        switch temp {
        case 0..<20:
            self.writeln("Ao bong")
        case 20..<30:
            self.writeln("Ao dai")
        default:
            self.writeln("Mac j cung dc")
        }
        
    }
    
    
}

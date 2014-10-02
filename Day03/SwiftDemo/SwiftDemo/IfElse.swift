//
//  IfElse.swift
//  SwiftDemo
//
//  Created by Trinh Minh Cuong on 9/25/14.
//  Copyright (c) 2014 Techmaster Vietnam. All rights reserved.
//

import UIKit

class IfElse: ConsoleScreen {

    override func viewDidLoad() {
        super.viewDidLoad()
        demoIfElse(9)
        demoSwitch(9)
    }
    
    //Khai báo phương thức
    func demoIfElse(temperature: Int) {
        //var temperature = 40
        if temperature < 10 {
            self.writeln("Mặc áo bông")
        } else if temperature < 20 {
            self.writeln("Mặc áo len")
        } else if temperature < 30 {
            self.writeln("Mặc áo dài tay")
        } else if temperature < 35 {
            self.writeln("Cởi trần")
        } else {
            self.writeln("Đi bơi")
        }
    }
    
    func demoSwitch(temperature: Int) {
        switch temperature {
        case 0..<10:
            self.writeln("Mặc áo bông")
        case 10..<20:
            self.writeln("Mặc áo len")
        case 20..<30:
            self.writeln("Mặc áo dài tay")
        case 30..<35:
            self.writeln("Cởi trần")
        default:
            self.writeln("Đi bơi")
        }
        
    }
}

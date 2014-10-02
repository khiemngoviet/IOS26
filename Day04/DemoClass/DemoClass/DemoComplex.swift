//
//  DemoComplex.swift
//  DemoClass
//
//  Created by techmaster on 8/22/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class DemoComplex: ConsoleScreen {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.demoComplex()
    }
    
    func demoComplex() {
        let c1 = Complex(real: 1, imagine: 2)
        let c2 = Complex(real: 3, imagine: 5)
        let c3 = c1 + c2
        let c4 = c1 - c2
        let c5 = c1 ** c2
        self.writeln("\(c1.description)\n")
        self.writeln("\(c2.description)\n")
        
        self.writeln("\(c3.description)\n")
        self.writeln("\(c4.description)\n")
        self.writeln("\(c5.description)\n")

    
    }

    
}

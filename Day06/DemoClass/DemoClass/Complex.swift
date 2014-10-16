//
//  Complex.swift
//  DemoClass
//
//  Created by techmaster on 8/22/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import Foundation
//infix operator + {}
infix operator - {}
infix operator ** {}

func + (c1: Complex, c2: Complex) -> Complex {
    return Complex(real: c1.real + c2.real, imagine: c1.imagine + c2.imagine)
}

func - (c1: Complex, c2: Complex) -> Complex {
    return Complex(real: c1.real - c2.real, imagine: c1.imagine - c2.imagine)
}

func ** (c1: Complex, c2: Complex) -> Complex {
    return Complex(real: c1.real * c2.real - c1.imagine * c2.imagine, imagine: c1.real * c2.imagine + c1.imagine * c2.real)
}

class Complex {
    var real: Double
    var imagine: Double
    init (real: Double, imagine: Double) {
        self.real = real
        self.imagine = imagine
    }
    
    var description: String {
        return "\(self.real) + i * \(self.imagine)"
    }
}
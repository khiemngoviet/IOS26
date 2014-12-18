//
//  BooFar.swift
//  SwiftPerformance
//
//  Created by cuong minh on 12/9/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import Foundation
class Besa: NSObject {
    func say() {
        println("Say base...")
    }
}

class Boo: Besa {
    override func say() {
        println("Say boo...")
    }
}

class Far: Besa {
    override func say() {
        println("Say far...")
    }
}
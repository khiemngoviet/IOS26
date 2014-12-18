//
//  CallCPP.swift
//  MultiLanguages
//
//  Created by cuong minh on 12/10/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class CallCPP: ConsoleScreen {

    override func viewDidLoad() {
        super.viewDidLoad()
        let fedWrapper = FedWrapper()
        self.writeln("Area of rectangle = \(fedWrapper.areaOfRect(10, 20))")
        
        let objVecA = ObjVector.init(10, andY: 20)
        let objVecB = ObjVector.init(1, andY: 2)
        let objVecC = objVecA.add(objVecB)
        self.writeln("\(objVecC)")
    }

}

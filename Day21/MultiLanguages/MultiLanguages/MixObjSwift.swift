//
//  MixObjSwift.swift
//  MultiLanguages
//
//  Created by cuong minh on 12/16/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

    
class MixObjSwift: ConsoleScreen {

    override func viewWillAppear(animated: Bool) {
        let swiftCar = SwiftCar()
        swiftCar.flapWing(100)        
        swiftCar.jumpOff(10)
        swiftCar.land()
        
        //let objCar = ObjCar()
    }

}

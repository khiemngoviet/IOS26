//
//  AccessLevel.swift
//  DemoClass
//
//  Created by techmaster on 9/14/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit
import ShareUILib  //Sử dụng thư viện ShareUILib
import CoolLib
class AccessLevel: ConsoleScreen {

    override func viewDidLoad() {
        super.viewDidLoad()
        var banana = Banana()
        self.writeln(banana.makeBananaLonger())
        
        var orange = Orange()
        self.write(orange.makeSweet())
        
    }
}

//
//  SingleTable.swift
//  CoreDataSwift
//
//  Created by cuong minh on 12/1/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class CheckSingleton: ConsoleScreen {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dataManager = DataManager.singleton
        let dataManager2 = DataManager.singleton
        
        if dataManager === dataManager2 {
            self.writeln("Two are same")
        }
        self.writeln("\(dataManager.modelName)")

    }


}

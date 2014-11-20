//
//  DataManager.swift
//  DemoTable
//
//  Created by cuong minh on 11/19/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import Foundation
class DataManager {
    class var singleton : DataManager {
        struct Static {
            static let instance : DataManager = DataManager()
        }
        return Static.instance
    }
    
    var students : NSMutableArray
    init() {
        students = NSMutableArray(capacity: 20)
    }
    
}
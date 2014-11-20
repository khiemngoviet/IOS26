//
//  DataItem.swift
//  DemoTable
//
//  Created by cuong minh on 11/4/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import Foundation
class DataItem {
    var title: String = ""
    var data: Array<String> = []
    
    
    init (title: String, data: Array<String>) {
        self.title = title
        self.data = data    
    }
}
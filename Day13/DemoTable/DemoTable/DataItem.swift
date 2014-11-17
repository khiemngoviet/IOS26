//
//  DataItem.swift
//  DemoTable
//
//  Created by cuong minh on 11/4/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import Foundation
import UIKit
class DataItem {
    var title: String = ""
    var data: Array<String> = []
    var image: UIImage
    
    
    init (title: String, data: Array<String>, image: String) {
        self.title = title
        self.data = data
        self.image = UIImage(named: image)!
    }
}
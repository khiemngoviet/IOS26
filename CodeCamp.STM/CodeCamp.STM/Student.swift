//
//  Student.swift
//  DemoTable
//
//  Created by cuong minh on 11/18/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import Foundation
import UIKit

class Student: NSObject {
    var fullName: String
    var photo:UIImage
    var score: Double

    init (name: String,photo:String, score: Double = 0.0) {
        fullName = name
        self.score = score
        self.photo = UIImage(named: photo)!
    }
}


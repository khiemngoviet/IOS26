//
//  VitoriaModel.swift
//  DemoTable
//
//  Created by cuong minh on 11/4/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import Foundation
import UIKit
class VictoriaModel {    
    var name: String = ""
    
    private var thumbPhoto: UIImage?
    var thumb: UIImage {
        get {
          return thumbPhoto!
        }
    }
    
    init (name: String, thumbStr: String) {
        self.name = name
        self.thumbPhoto = UIImage(named: thumbStr)
    }
    
    
}
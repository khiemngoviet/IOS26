//
//  SettingEntry.swift
//  DemoTable
//
//  Created by cuong minh on 11/9/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import Foundation
import UIKit
class SettingEntry {
    var checked: Bool = false
    var noncheckImage: UIImage
    var checkImage: UIImage
    var noncheckTitle: String
    var checkTitle: String
    
    init (noncheck: UIImage, check: UIImage, noncheckTitle: String, checkTitle: String) {
        noncheckImage = noncheck
        checkImage = check
        self.noncheckTitle = noncheckTitle
        self.checkTitle = checkTitle
    }
}
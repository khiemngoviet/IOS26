//
//  UIColorExtend.swift
//  UIViewControls
//
//  Created by Trinh Minh Cuong on 9/23/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import Foundation
extension UIColor {
    
    //Convenience init
    convenience init (hex: String, alpha: Float) {
        var alphaVal: CGFloat = 1
        if alpha >= 0 && alpha < 1 {
            alphaVal = CGFloat(alpha)
        }
        if !hex.isEmpty {
            let hexChars = "abcdefABCDEF0123456789"
            var filteredHex = ""

            var count = 0
            for var i = 0; i < countElements(hex) && count < 6; i++ {
                let char = hex[i]  //Must use StringExtend.swift
                if hexChars.rangeOfString(char, options: NSStringCompareOptions.CaseInsensitiveSearch, range: nil, locale: nil) != nil {
                    filteredHex.append(Character(char))
                    count++
                }
            }

            if count == 6 {
                var baseColor: UInt64 = 0
                let scanner = NSScanner(string: filteredHex)
                scanner.scanHexLongLong(&baseColor)
                let red   = CGFloat((baseColor & 0xFF0000) >> 16) / 255.0
                let green = CGFloat((baseColor & 0x00FF00) >>  8) / 255.0
                let blue  = CGFloat(baseColor & 0x0000FF) / 255.0
            
                self.init(red: red, green: green, blue: blue, alpha: 1.0)
                return
            }
            
        }
        self.init(red: 0, green:0, blue: 0, alpha:alphaVal)
    }

}
//
//  TMColor.swift
//  ScrollInSwift
//
//  Created by Trung on 8/25/14.
//  Copyright (c) 2014 vn.Techmsater. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    class func initByHexString(hex: NSString, alpha: CGFloat) -> UIColor{
        var trimedHexString: NSString!
        var range = hex.rangeOfString("#", options: NSStringCompareOptions.CaseInsensitiveSearch)
        if range.location != Foundation.NSNotFound {
            trimedHexString = hex .substringFromIndex(range.location + range.length)
            
        }else {
            range = hex.rangeOfString("0x", options: NSStringCompareOptions.CaseInsensitiveSearch)
            if range.location != Foundation.NSNotFound {
                trimedHexString = hex .substringFromIndex(range.location + range.length)
            }
        }
        var scanner = NSScanner(string: trimedHexString)
        scanner.charactersToBeSkipped = NSCharacterSet.symbolCharacterSet()
        var baseColor: UInt64 = 0
        scanner.scanHexLongLong(&baseColor)
        var red:CGFloat = CGFloat((baseColor & 0xFF0000) >> 16) / 255.0
        var green:CGFloat = CGFloat((baseColor & 0x00FF00) >> 16) / 255.0
        var blue:CGFloat = CGFloat((baseColor & 0x0000FF) >> 16) / 255.0
    
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }

    convenience init(rgba: NSString) {
        var red: CGFloat   = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat  = 0.0
        var alpha: CGFloat = 1.0
        
        if rgba.hasPrefix("#") {
            let hex = rgba.substringFromIndex(1)
            let scanner = NSScanner(string: hex)
            var hexValue: CUnsignedLongLong = 0
            if scanner.scanHexLongLong(&hexValue) {
                if hex.utf16Count == 6 {
                    red   = CGFloat((hexValue & 0xFF0000) >> 16) / 255.0
                    green = CGFloat((hexValue & 0x00FF00) >> 8)  / 255.0
                    blue  = CGFloat(hexValue & 0x0000FF) / 255.0
                } else if hex.utf16Count == 8 {
                    red   = CGFloat((hexValue & 0xFF000000) >> 24) / 255.0
                    green = CGFloat((hexValue & 0x00FF0000) >> 16) / 255.0
                    blue  = CGFloat((hexValue & 0x0000FF00) >> 8)  / 255.0
                    alpha = CGFloat(hexValue & 0x000000FF)         / 255.0
                } else {
                    print("invalid rgb string, length should be 7 or 9")
                }
            } else {
                println("scan hex error")
            }
        } else {
            print("invalid rgb string, missing '#' as prefix")
        }
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
}
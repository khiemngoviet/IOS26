//
//  NSNumberFormatterExtend.swift
//  CodeCamp.MoneyKeeper
//
//  Created by Khiem Ngo Viet on 12/6/14.
//  Copyright (c) 2014 Khiem Ngo Viet. All rights reserved.
//

import Foundation
extension NSNumberFormatter{
    
    class func stringFromCurrency(number: NSDecimalNumber) -> String{
        let nsnumf = NSNumberFormatter()
        nsnumf.numberStyle = NSNumberFormatterStyle.CurrencyStyle
        nsnumf.locale = NSLocale(localeIdentifier: "vi-VN")
        return (nsnumf.stringFromNumber(number)!)
    }
    
    class func stringFromCurrency(number: NSNumber) -> String{
        let nsnumf = NSNumberFormatter()
        nsnumf.numberStyle = NSNumberFormatterStyle.CurrencyStyle
        nsnumf.locale = NSLocale(localeIdentifier: "vi-VN")
        return (nsnumf.stringFromNumber(number)!)
    }
    
}
//
//  DateExtend.swift
//  CoreDataSwift
//
//  Created by techmaster on 12/4/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import Foundation
extension NSDate {
    class func convertFromString(dateStr: String) -> NSDate {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.dateFromString(dateStr)!
    }
}
/*
NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
[dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss zzz"];
[dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"ja_JP"]];
NSDate *capturedStartDate = [dateFormatter dateFromString: @"2012-09-16 23:59:59 JST"];
NSLog(@"Captured Date %@", [capturedStartDate description]);
*/
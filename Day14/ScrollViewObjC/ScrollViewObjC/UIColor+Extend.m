//
//  UIColor+Extend.m
//  TMCoreGraphics
//
//  Created by techmaster on 2/8/13.
//  Copyright (c) 2013 TechMaster. All rights reserved.
//

#import "UIColor+Extend.h"

@implementation UIColor (Extend)
+ (UIColor *)initByHexString: (NSString *) hexString alpha:(CGFloat)alpha
{
    NSString *trimedHexString;
    NSRange range = [hexString rangeOfString:@"#" options:NSCaseInsensitiveSearch];
    if (range.location != NSNotFound)
    {
        trimedHexString = [hexString substringFromIndex:range.location + range.length];
    } else {
        range = [hexString rangeOfString:@"0x" options:NSCaseInsensitiveSearch];
        if (range.location != NSNotFound)
        {
            trimedHexString = [hexString substringFromIndex:range.location + range.length];
        }
    }
    NSScanner *scanner2 = [NSScanner scannerWithString:trimedHexString];
    [scanner2 setCharactersToBeSkipped:[NSCharacterSet symbolCharacterSet]];
    unsigned long long baseColor1;

    [scanner2 scanHexLongLong:&baseColor1];
    
    CGFloat red   = ((baseColor1 & 0xFF0000) >> 16) / 255.0f;
    CGFloat green = ((baseColor1 & 0x00FF00) >>  8) / 255.0f;
    CGFloat blue  =  (baseColor1 & 0x0000FF) / 255.0f;
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}
@end

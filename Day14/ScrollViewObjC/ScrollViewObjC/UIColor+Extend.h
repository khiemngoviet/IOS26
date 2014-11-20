//
//  UIColor+Extend.h
//  TMCoreGraphics
//
//  Created by techmaster on 2/8/13.
//  Copyright (c) 2013 TechMaster. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Extend)
/*
 + (UIColor *)colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;
*/
//Input HexString format #712704
+ (UIColor *)initByHexString: (NSString *) hexString alpha:(CGFloat)alpha;
@end

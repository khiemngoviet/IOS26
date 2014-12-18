//
//  ObjCar.m
//  MultiLanguages
//
//  Created by cuong minh on 12/16/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

#import "ObjCar.h"

@implementation ObjCar
- (void) flapWing:(int)timesPerSecond {
    NSLog(@"Objective-C car flap %d times per second", timesPerSecond);
}

- (void) land {
    NSLog(@"Objective-C car is landing now");
}

- (void) jumpOff:(int32_t)timesPerSec {
    NSLog(@"Objective-C car is jump %d times per second", timesPerSec);
}

- (void) dive {
    NSLog(@"Objective-C car can dive");
}
@end

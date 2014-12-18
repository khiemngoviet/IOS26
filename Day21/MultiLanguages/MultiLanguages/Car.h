//
//  Car.h
//  MultiLanguages
//
//  Created by cuong minh on 12/16/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Car : NSObject

@end
@protocol Fly
- (void) flapWing: (int) timesPerSecond;
- (void) land;
@end

@protocol Swim
@optional
- (void) dive;
@end
//
//  ObjCar.h
//  MultiLanguages
//
//  Created by cuong minh on 12/16/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

#import "Car.h"
#import "MultiLanguages-Swift.h"  //Very important. Without this, import Swift protocol will not work
@interface ObjCar : Car<Swim, Fly>

@end

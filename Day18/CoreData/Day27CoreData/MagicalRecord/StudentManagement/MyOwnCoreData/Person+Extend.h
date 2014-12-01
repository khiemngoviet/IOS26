//
//  Person+Extend.h
//  MyOwnCoreData
//
//  Created by techmaster on 5/4/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

#import "Person.h"
typedef enum : NSUInteger {
    GENDER_FEMALE = 0,
    GENDER_MALE = 1,
    GENDER_OTHER = 2,
} GENDER;

@interface Person (Extend)
- (void) genRandomData;
@end

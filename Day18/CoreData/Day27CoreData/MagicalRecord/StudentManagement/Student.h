//
//  Student.h
//  MyOwnCoreData
//
//  Created by techmaster on 5/7/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Person.h"

@class University;

@interface Student : Person

@property (nonatomic, retain) University *university;

@end

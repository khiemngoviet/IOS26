//
//  Student.h
//  CoreDataObjC
//
//  Created by Trinh Minh Cuong on 10/21/14.
//  Copyright (c) 2014 Techmaster Vietnam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Person.h"

@class University;

@interface Student : Person

@property (nonatomic, retain) NSString * notes;
@property (nonatomic, retain) University *university;

@end

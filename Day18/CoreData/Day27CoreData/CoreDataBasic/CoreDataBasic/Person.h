//
//  Person.h
//  CoreDataBasic
//
//  Created by Trinh Minh Cuong on 10/21/14.
//  Copyright (c) 2014 Techmaster Vietnam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class University;

@interface Person : NSManagedObject

@property (nonatomic, retain) NSDate * dob;
@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) id photo;
@property (nonatomic, retain) University *university;

@end

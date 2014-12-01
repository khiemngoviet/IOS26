//
//  Person.h
//  MyOwnCoreData
//
//  Created by techmaster on 5/7/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Person : NSManagedObject

@property (nonatomic) NSTimeInterval dob;
@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSString * fullName;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) id photo;
@property (nonatomic) int16_t gender;

@end

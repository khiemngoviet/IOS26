//
//  Teacher.h
//  CoreDataObjC
//
//  Created by Trinh Minh Cuong on 10/21/14.
//  Copyright (c) 2014 Techmaster Vietnam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Person.h"


@interface Teacher : Person

@property (nonatomic, retain) NSString * course;
@property (nonatomic) float salary;

@end

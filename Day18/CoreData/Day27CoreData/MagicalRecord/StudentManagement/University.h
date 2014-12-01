//
//  University.h
//  MyOwnCoreData
//
//  Created by techmaster on 5/7/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface University : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *student;
@end

@interface University (CoreDataGeneratedAccessors)

- (void)addStudentObject:(NSManagedObject *)value;
- (void)removeStudentObject:(NSManagedObject *)value;
- (void)addStudent:(NSSet *)values;
- (void)removeStudent:(NSSet *)values;

@end

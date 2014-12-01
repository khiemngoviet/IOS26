//
//  Student.h
//  BasicCoreData
//
//  Created by cuong minh on 8/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Person.h"


@interface Student : Person

@property (nonatomic, retain) NSNumber * score;

@end

//
//  NSDate+Util.h
//  CoreDataObjC
//
//  Created by Trinh Minh Cuong on 10/21/14.
//  Copyright (c) 2014 Techmaster Vietnam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Util)
+ (instancetype) fromString: (NSString*) string
                  andFormat: (NSString*) format;
- (NSString*) toString: (NSString*) format;
@end

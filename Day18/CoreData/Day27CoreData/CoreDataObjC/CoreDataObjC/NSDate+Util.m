//
//  NSDate+Util.m
//  CoreDataObjC
//
//  Created by Trinh Minh Cuong on 10/21/14.
//  Copyright (c) 2014 Techmaster Vietnam. All rights reserved.
//  I copied from this http://stackoverflow.com/questions/3917250/converting-nsstring-to-nsdate-and-back-again

#import "NSDate+Util.h"

@implementation NSDate (Util)
+ (instancetype) fromString: (NSString*) string
                  andFormat: (NSString*) format {
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateFormat:format];
    return [dateFormatter dateFromString:string];
}

- (NSString*) toString: (NSString*) format {
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateFormat:format];
    return [dateFormatter stringFromDate:self];
}
@end

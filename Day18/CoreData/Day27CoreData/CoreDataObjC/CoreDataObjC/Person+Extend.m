//
//  Person+Extend.m
//  SimpleCoreData
//
//  Created by techmaster on 6/9/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

#import "Person+Extend.h"
#import "NSDate+Util.h"
@implementation Person (Extend)
static NSArray *firstNames;
static NSArray *lastNames;

- (void) randomize
{
    static dispatch_once_t dispatchOnce;
    dispatch_once(&dispatchOnce, ^{
        firstNames = @[@"Nguyễn", @"Phùng", @"Đào", @"Lê", @"Trịnh", @"Phạm"];
        lastNames = @[@"Dũng", @"Lan", @"Lâm", @"Lê", @"Long", @"Vân", @"Hương", @"Dũng"];
    });
    
    
    self.firstName = firstNames[arc4random()% [firstNames count]];
    self.lastName = lastNames[arc4random()% [lastNames count]];
    
    self.dob = [NSDate fromString:@"1975-11-27" andFormat:@"yyyy-MM-dd"];

}
@end

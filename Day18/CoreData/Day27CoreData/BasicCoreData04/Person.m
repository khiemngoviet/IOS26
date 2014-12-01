//
//  Person.m
//  BasicCoreData
//
//  Created by cuong minh on 3/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Person.h"
#import "Department.h"


@implementation Person

@dynamic dateOfBirth;
@dynamic firstName;
@dynamic fullName;
@dynamic lastName;
@dynamic salary;
@dynamic memberOf;

- (void)awakeFromFetch
{
    [super awakeFromFetch];
    NSMutableString * tmpString = [[NSMutableString alloc] initWithFormat: @"%@ %@", self.firstName, self.lastName];
    self.fullName = [[NSString alloc] initWithString: tmpString];
}
@end

//
//  Person+Extend.m
//  MyOwnCoreData
//
//  Created by techmaster on 5/4/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

#import "Person+Extend.h"
static NSArray *firstNames;
static NSArray *lastNames;
@implementation Person (Extend)
- (void) genRandomData {
    static dispatch_once_t dispatch_Once;
    dispatch_once (&dispatch_Once, ^ {
        firstNames = @[@"Adams", @"John", @"Blake", @"Jack", @"Anna", @"Marry", @"Mariana", @"Henry", @"Madonna", @"Elvis", @"Jacko", @"Kenedy"];
        lastNames = @[@"Tale", @"Johnson", @"Nickson", @"Ducati", @"Monster", @"Vancuver", @"Montoya", @"Garcia", @"Malinois", @"Francesco", @"Cudicini", @"Philips", @"Mecina"];
    });
   
    self.firstName = firstNames[arc4random()%[firstNames count]];
    self.lastName = lastNames[arc4random()%[lastNames count]];
    
    // Convert string to date object
    
    NSDate *today = [NSDate date];
    int r = arc4random_uniform(10000) + 1;
    
    NSCalendar *calendar = [NSCalendar currentCalendar];

    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setDay:-r];

    NSDate *birthDate = [calendar dateByAddingComponents:components toDate:today options:0];
    self.dob = [birthDate timeIntervalSince1970];
    
    
    int index =  arc4random()%10;
    NSString* photoName = [NSString stringWithFormat:@"%d.jpg", index];
    self.photo = [UIImage imageNamed: photoName];
    
    int ranNum = arc4random()% 100;
    if (ranNum > 97) {
        self.gender = 2; //Pede
    } else if (ranNum < 58) {
        self.gender = 0; //Female
    } else {
        self.gender = 1; //Male
    }
    

}

- (void) awakeFromFetch {
    [super awakeFromFetch];
    self.fullName = [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
}

- (void)didSave;
{
    [super didSave];
    self.fullName = [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
}

- (NSString*) description
{
    return [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
}
@end

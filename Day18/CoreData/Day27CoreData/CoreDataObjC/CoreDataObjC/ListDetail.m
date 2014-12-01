//
//  ListDetail.m
//  CoreDataObjC
//
//  Created by Trinh Minh Cuong on 10/21/14.
//  Copyright (c) 2014 Techmaster Vietnam. All rights reserved.
//

#import "ListDetail.h"
#import "DataManager.h"
#import "Person+Extend.h"
#import "Teacher.h"
#import "University.h"
@interface ListDetail ()
{
    NSManagedObjectContext *_managedObjectContext;    
}
@end

@implementation ListDetail

- (void)viewDidLoad {
    [super viewDidLoad];
    //Lấy managed Object Context từ singleton
    _managedObjectContext = [DataManager sharedInstance].mainObjectContext;
    [self listAll];
}

- (void)listAll {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:NSStringFromClass([Person class])];
    NSError *error;
    NSArray* result = [_managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (error) {
        [self writeln:[NSString stringWithFormat:@"List error: %@", error.description]];
    } else {
        for (Person* person in result) {
            [self writeln:[NSString stringWithFormat:@"%@", person.objectID.URIRepresentation]];            
   
        }
    }
}



@end

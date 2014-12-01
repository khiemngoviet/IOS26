//
//  CourseVC.m
//  MyOwnCoreData
//
//  Created by techmaster on 5/7/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

#import "CourseVC.h"
#import "DataManager.h"

@interface CourseVC ()
{
    NSArray* _result;
    NSManagedObjectContext* _managedObjectContext;
    NSManagedObjectModel* _managedObjectModel;

}
@end

@implementation CourseVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    _managedObjectContext = [DataManager sharedInstance].mainObjectContext;
    _managedObjectModel = [DataManager sharedInstance].objectModel;

}
- (void) fetchRecords
{
    // Define our table/entity to use
	NSEntityDescription *entity = [NSEntityDescription entityForName:@"Course" inManagedObjectContext:_managedObjectContext];
	
	// Setup the fetch request
	NSFetchRequest *request = [NSFetchRequest new];
	[request setEntity:entity];
	
	// Define how we will sort the records
	NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
	NSArray *sortDescriptors = @[sortDescriptor];
	
	[request setSortDescriptors:sortDescriptors];
    
	// Fetch the records and handle an error
	NSError *error;
	_result = [_managedObjectContext executeFetchRequest:request
                                                   error:&error];
    
    if (error) {
        //Nho Alert ra nhe
    } else {
        [self.tableView reloadData];
    }

    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return [_result count];
}
/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}*/

@end

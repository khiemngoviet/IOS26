//
//  MainScreenVC.m
//  MyOwnCoreData
//
//  Created by techmaster on 5/4/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

#import "MainScreenVC.h"
#import "DataManager.h"
#import "Person+Extend.h"


@interface MainScreenVC () <NSFetchedResultsControllerDelegate, UIActionSheetDelegate>

{
    NSManagedObjectContext* _managedObjectContext;
    NSManagedObjectModel* _managedObjectModel;
    NSArray * _result;
    NSDateFormatter *_dateFormatter;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@end

static NSString* tableName;

@implementation MainScreenVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    tableName = @"Person";
    
    _dateFormatter = [NSDateFormatter new];
    [_dateFormatter setDateFormat:@"yyyy-MM-dd"];

    _managedObjectContext = [DataManager sharedInstance].mainObjectContext;
    _managedObjectModel = [DataManager sharedInstance].objectModel;
    [self initFetchResultController:0];
}

- (IBAction)addNewRecord:(id)sender {
    
    Person *person = (Person *)[NSEntityDescription insertNewObjectForEntityForName:@"Person"
                                                             inManagedObjectContext:_managedObjectContext];
    if (!person) return;

    [person genRandomData];
    NSError *savingError = nil;
    if ([_managedObjectContext save:&savingError]){
        NSLog(@"Successfully saved the context.");

    } else {
        NSLog(@"Failed to save the context. Error = %@", savingError);
    }
}

- (IBAction)displayFilterActionSheet:(id)sender {
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle: @"Filter"
                                                             delegate: self
                                                    cancelButtonTitle: @"Cancel"
                                               destructiveButtonTitle: @"List All"
                                                    otherButtonTitles: @"Male Only", @"Female Only", @"Undefined Gender", nil];
    [actionSheet showInView:self.view];
}

#pragma mark - UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex;
{
  [self initFetchResultController:buttonIndex];
}

- (void) initFetchResultController: (NSInteger) filterType
{
    NSFetchRequest *fetchRequest;
    
    switch (filterType) {
        case 0:  // List all records in Person table
        {// Edit the entity name as appropriate.
            NSEntityDescription *entity = [NSEntityDescription entityForName:tableName inManagedObjectContext:_managedObjectContext];
            fetchRequest = [NSFetchRequest new];
            [fetchRequest setEntity:entity];
            
            break;
        }
        case 1: //List only male
        {
            fetchRequest = [[_managedObjectModel fetchRequestTemplateForName: @"ListOnlyMale"] copy];
            break;
        }
            
        case 2: //List only femmale
        {
            fetchRequest = [[_managedObjectModel fetchRequestTemplateForName: @"ListOnlyFemale"] copy];
            break;
        }
        
        case 3: //List only pede
        {
            fetchRequest = [[_managedObjectModel fetchRequestTemplateForName: @"ListUndefinedGender"] copy];
            break;
        }
        default:
            return;
    }
   
    // Edit the sort key as appropriate.
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"firstName" ascending:NO];
    NSArray *sortDescriptors = @[sortDescriptor];
    [fetchRequest setSortDescriptors:sortDescriptors];
    // Set the batch size to a suitable number.
    [fetchRequest setFetchBatchSize:20];
    
    // Edit the section name key path and cache name if appropriate.
    // nil for section name key path means "no sections".
    
    [NSFetchedResultsController deleteCacheWithName:@"Master"];
    
    NSFetchedResultsController *aFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:_managedObjectContext sectionNameKeyPath:nil cacheName:@"Master"];
    
    aFetchedResultsController.delegate = self;
    self.fetchedResultsController = aFetchedResultsController;
    
	NSError *error = nil;
	if (![self.fetchedResultsController performFetch:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
	    NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
	    abort();
	} else {
        [self.tableView reloadData];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [[self.fetchedResultsController sections] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    id <NSFetchedResultsSectionInfo> sectionInfo = [self.fetchedResultsController sections][section];
    return [sectionInfo numberOfObjects];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    [self configureCell:cell atIndexPath:indexPath];
    return cell;
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    Person *person = (Person*) [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    cell.textLabel.text = [person description];
    
    //NSDate *date = [NSDate dateWithTimeIntervalSince1970:person.dob];
    
    //cell.detailTextLabel.text = [_dateFormatter stringFromDate:date];
    
    switch (person.gender) {
        case 0:
            cell.detailTextLabel.text = @"Female";
            break;
        case 1:
            cell.detailTextLabel.text = @"Male";
            break;
        case 2:
            cell.detailTextLabel.text = @"Pede";
            break;
        default:
            break;
    }
    
    
    cell.imageView.image = (UIImage*) person.photo;
}

#pragma mark - UITableViewDelegate
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        NSManagedObject* object =  [self.fetchedResultsController objectAtIndexPath:indexPath];
        [_managedObjectContext deleteObject:object];
        
        NSError *savingError = nil;
        if ([_managedObjectContext save:&savingError]){
            NSLog(@"Successfully saved the context.");
            
        } else {
            NSLog(@"Failed to save the context. Error = %@", savingError);
        }
    }
}


#pragma mark - Fetched results controller

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView beginUpdates];
}

- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id <NSFetchedResultsSectionInfo>)sectionInfo
           atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type
{
    switch(type) {
        case NSFetchedResultsChangeInsert:
            [self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject
       atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type
      newIndexPath:(NSIndexPath *)newIndexPath
{
    UITableView *tableView = self.tableView;
    
    switch(type) {
        case NSFetchedResultsChangeInsert:
            [tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeUpdate:
            [self configureCell:[tableView cellForRowAtIndexPath:indexPath] atIndexPath:indexPath];
            break;
            
        case NSFetchedResultsChangeMove:
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView endUpdates];
}

@end

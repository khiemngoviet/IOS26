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


@interface MainScreenVC () <UIActionSheetDelegate>

{
    NSArray * _result;
    NSDateFormatter *_dateFormatter;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

static NSString* tableName;

@implementation MainScreenVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    tableName = @"Person";
    
    _dateFormatter = [NSDateFormatter new];
    [_dateFormatter setDateFormat:@"yyyy-MM-dd"];


    [self initFetchRequest:0];
}

- (IBAction)addNewRecord:(id)sender {
    
    Person *person = [Person MR_createEntity];
    if (!person) return;
    [person genRandomData];
    
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
    
    [self initFetchRequest:0];
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
  [self initFetchRequest:buttonIndex];
}

- (void) initFetchRequest: (NSInteger) filterType
{
    
    switch (filterType) {
        case 0:  // List all records in Person table
        {// Edit the entity name as appropriate.
            _result = [Person MR_findAllSortedBy:@"lastName,firstName" ascending:YES];
            break;
        }
        case 1: //List only male
        {
            NSPredicate* filterMale = [NSPredicate predicateWithFormat:@"gender==%d", GENDER_MALE];
            _result = [Person MR_findAllWithPredicate:filterMale];
            break;
        }
            
        case 2: //List only femmale
        {
            NSPredicate* filterFemale = [NSPredicate predicateWithFormat:@"gender==%d", GENDER_FEMALE];
            _result = [Person MR_findAllWithPredicate:filterFemale];

            break;
        }
        
        case 3: //List only pede
        {
            NSPredicate* filterOther = [NSPredicate predicateWithFormat:@"gender==%d", GENDER_OTHER];
            _result = [Person MR_findAllWithPredicate:filterOther];
            break;
        }
        default:
            return;
    }
    [self.tableView reloadData];
   
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_result count];
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
    Person *person = (Person*) _result[indexPath.row];
    
    cell.textLabel.text = [person description];
    
    //NSDate *date = [NSDate dateWithTimeIntervalSince1970:person.dob];
    
    //cell.detailTextLabel.text = [_dateFormatter stringFromDate:date];
    
    switch (person.gender) {
        case GENDER_FEMALE:
            cell.detailTextLabel.text = @"Female";
            break;
        case GENDER_MALE:
            cell.detailTextLabel.text = @"Male";
            break;
        case GENDER_OTHER:
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
        Person *person = (Person *)_result[indexPath.row];
        [person MR_deleteEntity];
        [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];        
        [self initFetchRequest:0];
        //[tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
     
    }
}
@end

//
//  FirstViewController.m
//  BasicCoreData
//
//  Created by cuong minh on 3/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.

#import "FirstViewController.h"
#import "AppDelegate.h"
@implementation FirstViewController
@synthesize managedObjectContext;
@synthesize managedObjectModel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
       
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    AppDelegate *appDelegate = (AppDelegate*) [[UIApplication sharedApplication] delegate];
    self.managedObjectContext = appDelegate.managedObjectContext;
    self.managedObjectModel = appDelegate.managedObjectModel;
    //self.persistentStoreCoordinator = appDelegate.persistentStoreCoordinator;
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    self.managedObjectContext = nil;
    self.managedObjectModel = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
#pragma mark - CRUD Department model
- (void) createDepartmentWithName: (NSString *) name 
{
    Department *department = (Department *) [NSEntityDescription insertNewObjectForEntityForName:@"Department" 
                                                                          inManagedObjectContext:self.managedObjectContext];
    if (department) {
        [department setName:name];
        NSError *savingError = nil;
        if (![self.managedObjectContext save:&savingError]){           
            NSLog(@"Failed to save the context. Error = %@", savingError);
        }
    } else {    
        NSLog(@"Failed to create the new person.");
    }
    
}
#pragma mark - CRUD Person model
- (void) createPersonwithFirstName: (NSString *) firstName 
                          lastName: (NSString *) lastName 
                               DOB: (NSString *) DOBString 
                         andSalary: (double) salary
{
    Person *person = (Person *)[NSEntityDescription insertNewObjectForEntityForName:@"Person" 
                                                             inManagedObjectContext:self.managedObjectContext];
	if (person) {
        [person setFirstName:firstName];
        [person setLastName:lastName];
        [person setSalary:salary];
        NSString *dateStr = DOBString;
        
        // Convert string to date object
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"yyyyMMdd"];
        NSDate *dob = [dateFormat dateFromString:dateStr];
        
        [person setDateOfBirth: dob];
        NSError *savingError = nil;
        if (![self.managedObjectContext save:&savingError]){           
            NSLog(@"Failed to save the context. Error = %@", savingError);
        }
    } else {    
        NSLog(@"Failed to create the new person.");
    }
    
}
#pragma mark - CRUD Student model
- (void) createStudentwithFirstName: (NSString *) firstName 
                          lastName: (NSString *) lastName 
                               DOB: (NSString *) DOBString
                            Salary: (double) salary
                             Score:(float) score
    
{
    Student *student = (Student *)[NSEntityDescription insertNewObjectForEntityForName:@"Student" 
                                                             inManagedObjectContext:self.managedObjectContext];
	if (student) {
        [student setFirstName:firstName];
        [student setLastName:lastName];
        [student setSalary:salary];
        [student setScore:[NSNumber numberWithFloat:score]];
        NSString *dateStr = DOBString;
        
        // Convert string to date object
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"yyyyMMdd"];
        NSDate *dob = [dateFormat dateFromString:dateStr];
        
        [student setDateOfBirth: dob];
        
        NSError *savingError = nil;
        if (![self.managedObjectContext save:&savingError]){           
            NSLog(@"Failed to save the context. Error = %@", savingError);
        }
    } else {    
        NSLog(@"Failed to create the new student.");
    }
    
}
#pragma mark - Fetch Query
- (void)fetchRecords {
	
	// Define our table/entity to use
	NSEntityDescription *entity = [NSEntityDescription entityForName:@"Person" inManagedObjectContext:managedObjectContext];
	
	// Setup the fetch request
	NSFetchRequest *request = [[NSFetchRequest alloc] init];
	[request setEntity:entity];
	
	// Define how we will sort the records
	NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"firstName" ascending:NO];
	NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
	
	[request setSortDescriptors:sortDescriptors];
    
	// Fetch the records and handle an error
	NSError *error;
	NSMutableArray *mutableFetchResults = [[managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
	
	if (!mutableFetchResults) {
		NSLog(@"Error when fetch data %@", error);
	} else {
        for (Person *person in mutableFetchResults) {
            NSLog(@"%@ %@", person.fullName, person.dateOfBirth);
            
        }
    }
    
}
- (IBAction)fetchDefinedRequest:(id)sender {
   
    NSFetchRequest *request = [self.managedObjectModel fetchRequestTemplateForName: @"personWithHighSalary"];
    if (!request) return;
    
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"firstName" ascending:NO];
    NSArray *sortDescriptors = @[sortDescriptor];
    [request setSortDescriptors:sortDescriptors];
    // Set the batch size to a suitable number.
    [request setFetchBatchSize:20];

    // Fetch the records and handle an error
	NSError *error;
	NSMutableArray *mutableFetchResults = [[managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
	
	if (!mutableFetchResults) {
		NSLog(@"Error when fetch data %@", error);
	} else {
        for (Person *person in mutableFetchResults) {
            NSLog(@"%@ %8.2f", person.fullName, person.salary);
            
        }
    }
}

- (NSMutableArray *) fetRecordsOfEntity : (NSString *)entityName withSortDescriptors: (NSArray *) sortDescriptors
{
    // Define our table/entity to use
	NSEntityDescription *entity = [NSEntityDescription entityForName:entityName inManagedObjectContext:managedObjectContext];
	
	// Setup the fetch request
	NSFetchRequest *request = [[NSFetchRequest alloc] init];
	[request setEntity:entity];	
	
    if (sortDescriptors) {
        [request setSortDescriptors:sortDescriptors];
    }
    
	// Fetch the records and handle an error
	NSError *error;
	NSMutableArray *mutableFetchResults = [[managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
	
    if (!mutableFetchResults) {
        NSLog(@"Error when fetch data %@", error);
    }
	return  mutableFetchResults;
}


- (void) deleteAllPepple {
    // Define our table/entity to use
	NSEntityDescription *entity = [NSEntityDescription entityForName:@"Person" inManagedObjectContext:managedObjectContext];
	
	// Setup the fetch request
	NSFetchRequest *request = [[NSFetchRequest alloc] init];
	[request setEntity:entity];
	
	// Fetch the records and handle an error
	NSError *error;
	NSMutableArray *mutableFetchResults = [[managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
	
	if (!mutableFetchResults) {
		// Handle the error.
		// This is a serious error and should advise the user to restart the application
	} else {
        for (Person *person in mutableFetchResults) {
           [self.managedObjectContext deleteObject:person];           
        }
    }

}
- (void) deleteAllRecordsOfEntity : (NSString *)entityName 
{
    // Define our table/entity to use
	/*NSEntityDescription *entity = [NSEntityDescription entityForName:entityName inManagedObjectContext:managedObjectContext];
	
	// Setup the fetch request
	NSFetchRequest *request = [[NSFetchRequest alloc] init];
	[request setEntity:entity];*/
    
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:entityName];
	
	// Fetch the records and handle an error
	NSError *error;
	NSMutableArray *mutableFetchResults = [[managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
	
	if (!mutableFetchResults) {
		// Handle the error.
		// This is a serious error and should advise the user to restart the application
	} else {
        for (id object in mutableFetchResults) {
            [self.managedObjectContext deleteObject:object];         
        }
    }

}

- (void) querywithPredicate
{
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Person"];
    /* Similar code     
     NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"Person" 
     inManagedObjectContext:managedObjectContext];
     [request setEntity:entityDescription];
     */
    //Search "Introduction to Predicates Programming Guide" for more !
    
    NSNumber *minimumSalary = [[NSNumber alloc] initWithDouble:700];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:
                              @"(lastName LIKE 'L*') AND (salary > %@)", minimumSalary];
    [request setPredicate:predicate];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc]
                                        initWithKey:@"firstName" ascending:YES];
    [request setSortDescriptors:[NSArray arrayWithObject:sortDescriptor]];
    
    
    NSError *error = nil;
    NSArray *array = [managedObjectContext executeFetchRequest:request error:&error];
    for (Person *person in array) {
        NSLog(@"%@ %f", person.fullName, person.salary);
    }
}
- (void) demoObjectID
{
  	NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Person"];
    
	// Fetch the records and handle an error
	NSError *error;
	NSMutableArray *mutableFetchResults = [[managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
	
	if (!mutableFetchResults) {
		NSLog(@"Error when fetch data %@", error);
	} else {
        for (Person *person in mutableFetchResults) {
            NSURL *url = person.objectID.URIRepresentation;            
            NSLog(@"%@", url);
            //NSLog(@"%@", [url lastPathComponent]);
            
        }
    }

}

- (Department *) queryDepartmentByName: (NSString *) name 
{
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Department"];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name LIKE %@", name];
    [request setPredicate:predicate];    

    
    NSError *error = nil;
    NSArray *array = [managedObjectContext executeFetchRequest:request error:&error];
    
    if (array) {
        return  (Department *) [array lastObject];
    } else {
        return nil;
    }
}

- (Person *) queryPersonByFirstName: (NSString *) firstName andLastName: (NSString *) lastName
{
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Person"];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(firstName LIKE %@) AND (lastName LIKE %@)", firstName, lastName];
    [request setPredicate:predicate];    
    
    
    NSError *error = nil;
    NSArray *array = [managedObjectContext executeFetchRequest:request error:&error];
    if (array) {
        return  (Person *) [array lastObject];
    } else {
        return nil;
    }

}

- (void) addMemberToDepartment 
{
    Department *departmentIT = [self queryDepartmentByName: @"IT"];
    
    if (departmentIT) {
        Person *aPerson = [self queryPersonByFirstName: @"Tuan" andLastName: @"Le"];
        if (aPerson) {
            [departmentIT addMembersObject:aPerson];
        }
        
        aPerson = [self queryPersonByFirstName: @"Duong" andLastName: @"Tran"];
        if (aPerson) {
           [departmentIT addMembersObject:aPerson]; 
        }
       
        
        NSError *savingError = nil;
        if (![self.managedObjectContext save:&savingError]){            
            NSLog(@"Failed to save the context. Error = %@", savingError);
        }
        

        for (Person *person in departmentIT.members) {
            NSLog(@"%@ is member of %@", person.fullName, person.memberOf.name);
        }
    }
}
#pragma mark - Handle Button Events


- (IBAction)createData:(id)sender {
    
    [self createDepartmentWithName: @"IT"];
    [self createDepartmentWithName: @"Sales"];
    [self createDepartmentWithName: @"HR"];
    
    [self createPersonwithFirstName:@"Cuong" lastName:@"Trinh" DOB:@"19751127" andSalary: 900];
    [self createPersonwithFirstName:@"Tuan" lastName:@"Le" DOB:@"19811022" andSalary: 800];
    [self createPersonwithFirstName:@"Duong" lastName:@"Tran" DOB:@"19820530" andSalary: 450];
    [self createPersonwithFirstName:@"Lan" lastName:@"Dao" DOB:@"19730530" andSalary:650];
    [self createPersonwithFirstName:@"Anh" lastName:@"Do" DOB:@"19900520" andSalary: 755];
    [self createPersonwithFirstName:@"Long" lastName:@"Pham" DOB:@"1980720" andSalary: 650];
    [self createPersonwithFirstName:@"Vo" lastName:@"Lai" DOB:@"19800720" andSalary:923];
    [self createPersonwithFirstName:@"Chau" lastName:@"Bui" DOB:@"19820721" andSalary:1200];
    ///
    [self createStudentwithFirstName:@"Bill" lastName:@"Gates" DOB:@"19670802" Salary:1222 Score:7.5];
    [self createStudentwithFirstName:@"Paul" lastName:@"Alen" DOB:@"19650802" Salary:200 Score:8.5];
}

- (IBAction)deleteAllPeople:(id)sender { 
    [self deleteAllRecordsOfEntity:@"Person"];
    [self deleteAllRecordsOfEntity:@"Department"];
}

- (IBAction)fetchData:(id)sender {
    // Define how we will sort the records
	NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"salary" ascending:YES];
	NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    
    NSMutableArray *fetchedPeople =[self fetRecordsOfEntity:@"Person" withSortDescriptors:sortDescriptors];
    for (Person *person in fetchedPeople)
    {
        NSLog(@"%@ %f %@", person.fullName, person.salary, [[person.objectID URIRepresentation] lastPathComponent]);
        
    }
    
    NSMutableArray *fetchedStudent =[self fetRecordsOfEntity:@"Student" withSortDescriptors:nil];
    for (Student *student in fetchedStudent)
    {
        NSLog(@"%@ %2.1f", student.fullName, [student.score floatValue]);        
    }
    
    NSMutableArray *fetchedDepartments = [self fetRecordsOfEntity:@"Department" withSortDescriptors:nil];
    for (Department *department in fetchedDepartments)
    {
        NSLog(@"%@", department.name);
    }
    
}

- (IBAction)queryWithPredicate:(id)sender {
                                                            
    [self querywithPredicate];
}

- (IBAction)demoObjectID:(id)sender {
    [self demoObjectID];
}
- (IBAction)addMemberToDepartment:(id)sender {
    [self addMemberToDepartment];
}
- (IBAction)undoChanges:(id)sender {
    //See this http://www.ioslearner.com/undo-redo-support-core-data-nsundomanager/#more-304
    
}


@end

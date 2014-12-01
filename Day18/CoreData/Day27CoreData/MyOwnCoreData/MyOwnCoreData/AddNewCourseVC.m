//
//  AddNewCourseVC.m
//  MyOwnCoreData
//
//  Created by techmaster on 5/18/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

#import "AddNewCourseVC.h"
#import "DataManager.h"
#import "Course.h"
@interface AddNewCourseVC ()
{
   NSManagedObjectContext* _managedObjectContext;
   NSManagedObjectModel* _managedObjectModel;
    __weak IBOutlet UITextField *inputName;
    __weak IBOutlet UITextView *inputNotes;
}
@end

@implementation AddNewCourseVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    _managedObjectContext = [DataManager sharedInstance].mainObjectContext;
    _managedObjectModel = [DataManager sharedInstance].objectModel;
}
- (IBAction)onDone:(id)sender {
    NSString* name = [inputName.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    if ([name length] ==0) {
        [inputName becomeFirstResponder];
        inputName.placeholder = @"Course name is required";
        inputName.backgroundColor = [UIColor colorWithRed:0.925 green:0.816 blue:0.471 alpha:1]; /*#ecd078*/
        return;
    }
    Course *course = (Course *)[NSEntityDescription insertNewObjectForEntityForName:@"Course"
                                                             inManagedObjectContext:_managedObjectContext];
    if (!course) return;
    course.name = name;
    course.notes = inputNotes.text;
    

    NSError *savingError = nil;
    if ([_managedObjectContext save:&savingError]){
        [self dismissViewControllerAnimated:YES completion:nil];
        
    } else {
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Failed to save new course"
                                                         message:savingError.localizedDescription
                                                        delegate:self
                                               cancelButtonTitle:@"Cancel"
                                               otherButtonTitles:nil, nil];
        [alert show];
        
    }

}

@end

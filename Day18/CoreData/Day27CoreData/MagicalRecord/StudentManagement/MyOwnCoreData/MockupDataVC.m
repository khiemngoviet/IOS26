//
//  MockupDataVC.m
//  MyOwnCoreData
//
//  Created by techmaster on 5/18/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

#import "MockupDataVC.h"
#import "University.h"
#import "Course.h"
#import "Student.h"
#import "Person+Extend.h"
@interface MockupDataVC ()

@end

@implementation MockupDataVC

- (IBAction)deleteAllData:(id)sender {
    [Student MR_truncateAll];
    [Person MR_truncateAll];
    [Course MR_truncateAll];
    [University MR_truncateAll];
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
}
- (IBAction)setupData:(id)sender {
    
    NSArray *universities = @[@"Hanoi University of Technology", @"Hanoi Foreign Language", @"Thang Long University", @"Harvard University", @"MIT"];
    
    for (NSString* uniName in universities) {
        University * university = [University MR_createEntity];
        university.name = uniName;
    }
    
    
    for (int i= 0; i < 10; i++) {
        Person * person = [Person MR_createEntity];
        [person genRandomData];
    }

   // [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
    // Chú có thấy anh gõ code không?
    // Chú có thấy anh gõ nhanh không man.
    //Kiểm5 gõ xem có nhanh không'
   ///Cho ca Hai va mot so anh em khac
    
    
    NSLog(@"name like '%@'", @"Thang Long");
    NSPredicate* findThangLong = [NSPredicate predicateWithFormat:@"name like %@",@"Thang Long*"];
    University *thangLongUniv = [University MR_findFirstWithPredicate:findThangLong];
    

    NSPredicate* findMIT = [NSPredicate predicateWithFormat:@"name like %@",@"MIT*"];
    University *MITUniv = [University MR_findFirstWithPredicate:findMIT];
    
    for (int i= 0; i < 5; i++) {
        Student *studentThangLong = [Student MR_createEntity];
        [studentThangLong genRandomData];
        studentThangLong.university = thangLongUniv;
    }
    
    for (int j=0; j < 7; j++) {
        Student *studentMIT = [Student MR_createEntity];
        [studentMIT genRandomData];
        studentMIT.university = MITUniv;

    }
    
    
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
}
- (IBAction)QueryData:(id)sender {
    NSArray *unis = [University MR_findAll];
    for (University *uni in unis) {
        NSLog(@"%@", uni.name);
    }
    
   /* NSArray*people = [Person MR_findAll];
    for (Person *person in people) {
        NSLog(@"%@", person);
    }*/
    
   /* NSArray *studentArray = [Student MR_findAll];
    for(Student *student in studentArray) {
        if([student.university.name isEqualToString:@"Thang Long University"]) {
            NSLog(@"%@ - %@", student.fullName, student.university.name);
        }
    }*/
    
    NSPredicate* findThangLong = [NSPredicate predicateWithFormat:@"name like %@",@"Thang Long*"];
    University *thangLongUniv = [University MR_findFirstWithPredicate:findThangLong];
    
    for (Student* student in thangLongUniv.student) {
        NSLog(@"%@ studies at %@", student, student.university.name);
    }
    
}


@end

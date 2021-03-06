//
//  InsertARecord.m
//  CoreDataObjC
//
//  Created by Trinh Minh Cuong on 10/21/14.
//  Copyright (c) 2014 Techmaster Vietnam. All rights reserved.
//

#import "InsertARecord.h"
#import "DataManager.h"
#import "Person+Extend.h"
#import "Teacher.h"
#import "University.h"
#import "NSDate+Util.h"
@interface InsertARecord ()
{
    NSManagedObjectContext *_managedObjectContext;

}
@end

@implementation InsertARecord

- (void)viewDidLoad {
    [super viewDidLoad];
    //Lấy managed Object Context từ singleton
    _managedObjectContext = [DataManager sharedInstance].mainObjectContext;
    [self insertNewPerson];
    [self insertNewTeacher];
    [self insertNewUniversity:@"Standford"];
    [self insertNewUniversity:@"MIT"];
    [self insertNewUniversity:@"DH BK HN"];
    [self listAll];
}

- (void) insertNewPerson {
    NSEntityDescription *entityDescription =
    [NSEntityDescription entityForName:NSStringFromClass([Person class])
                inManagedObjectContext:_managedObjectContext];
    
    Person *person = [[Person alloc] initWithEntity: entityDescription
                     insertIntoManagedObjectContext:_managedObjectContext];
    
    [person randomize];
    person.photo = [UIImage imageNamed:@"Teo.png"];
    
    NSError *error; //con trỏ này đang trỏ vào vùng nhớ 0, nó chưa được khởi tạo
    [_managedObjectContext save:&error];  //Ta truyền vào địa chỉ vật lý của chính con trỏ để nếu có lỗi
    //CoreData sẽ khởi tạo con trỏ cho ta, còn nếu thành công thì con trỏ vẫn trỏ vào 0.
    if (error) {
        [self writeln:[NSString stringWithFormat:@"saving error: %@", error.description]];
    } else {
        [self writeln:@"Save success"];
    }
}

- (void) insertNewTeacher {
    NSEntityDescription *entityDescription =
    [NSEntityDescription entityForName:NSStringFromClass([Teacher class])
                inManagedObjectContext:_managedObjectContext];
    
    Teacher *teacher = [[Teacher alloc] initWithEntity: entityDescription
                     insertIntoManagedObjectContext:_managedObjectContext];
    
    [teacher randomize];
    teacher.course = @"Math";
    teacher.salary = 1000;
    teacher.photo = [UIImage imageNamed:@"Teo.png"];
    
    NSError *error; //con trỏ này đang trỏ vào vùng nhớ 0, nó chưa được khởi tạo
    [_managedObjectContext save:&error];  //Ta truyền vào địa chỉ vật lý của chính con trỏ để nếu có lỗi
    //CoreData sẽ khởi tạo con trỏ cho ta, còn nếu thành công thì con trỏ vẫn trỏ vào 0.
    if (error) {
        [self writeln:[NSString stringWithFormat:@"saving error: %@", error.description]];
    } else {
        [self writeln:@"Save success"];
    }
}
- (void) insertNewUniversity: (NSString*) name  {
    NSEntityDescription *entityDescription =
    [NSEntityDescription entityForName:NSStringFromClass([University class])
                inManagedObjectContext:_managedObjectContext];
    
    University *university = [[University alloc] initWithEntity: entityDescription
                        insertIntoManagedObjectContext:_managedObjectContext];
    
    university.name = name;
   
    
    NSError *error; //con trỏ này đang trỏ vào vùng nhớ 0, nó chưa được khởi tạo
    [_managedObjectContext save:&error];  //Ta truyền vào địa chỉ vật lý của chính con trỏ để nếu có lỗi
    //CoreData sẽ khởi tạo con trỏ cho ta, còn nếu thành công thì con trỏ vẫn trỏ vào 0.
    if (error) {
        [self writeln:[NSString stringWithFormat:@"saving error: %@", error.description]];
    } else {
        [self writeln:@"Save university success"];
    }
    
}
- (void) listAll {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:NSStringFromClass([Person class])];
    NSError *error;
    NSArray* result = [_managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (error) {
        [self writeln:[NSString stringWithFormat:@"List error: %@", error.description]];
    } else {
        for (Person* person in result) {
            [self writeln:[NSString stringWithFormat:@"%@ - %@ - %@", person.firstName, person.lastName, [person.dob toString:@"yyyy-MM-dd"]]];
            
            if ([person isMemberOfClass:[Teacher class]]) {
                Teacher* teacher = (Teacher*) person;
                [self writeln:[NSString stringWithFormat:@"%@ - %@ - %@", teacher.firstName, teacher.lastName, teacher.course]];
            }
        }
    }

}



@end

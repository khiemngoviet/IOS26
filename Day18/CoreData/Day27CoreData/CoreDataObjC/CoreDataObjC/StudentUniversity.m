//
//  StudentUniversity.m
//  CoreDataObjC
//
//  Created by Trinh Minh Cuong on 10/21/14.
//  Copyright (c) 2014 Techmaster Vietnam. All rights reserved.
//

#import "StudentUniversity.h"
#import "DataManager.h"
#import "Person+Extend.h"
#import "Teacher.h"
#import "University.h"
#import "NSDate+Util.h"
@interface StudentUniversity ()
{
    NSManagedObjectContext *_managedObjectContext;
    
}
@end

@implementation StudentUniversity

- (void)viewDidLoad {
    [super viewDidLoad];
     _managedObjectContext = [DataManager sharedInstance].mainObjectContext;
    University* standford = [self insertNewUniversity:@"Stanford"];
    University* mit = [self insertNewUniversity:@"MIT"];
}


- (University*) insertNewUniversity: (NSString*) name  {
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
        return nil;
    } else {
        [self writeln:@"Save university success"];
        return university;
    }
    
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




@end

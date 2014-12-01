//
//  AddPerson.m
//  CoreDataBasic
//
//  Created by Trinh Minh Cuong on 10/21/14.
//  Copyright (c) 2014 Techmaster Vietnam. All rights reserved.
//

#import "AddPerson.h"
#import "DataManager.h"
#import "Person+Extend.h"
#import "NSDate+Util.h"
#import "University.h"
@interface AddPerson ()
{
    NSManagedObjectContext* _managedObjectContext;
}
@end

@implementation AddPerson

- (void)viewDidLoad {
    [super viewDidLoad];
    _managedObjectContext = [DataManager sharedInstance].mainObjectContext;
    University* bk = [self findUniversityByName:@"Bach Khoa"];
    if (bk) {
        [self writeln:bk.name];
        
        for (Person* person in bk.students) {
            [self writeln:[NSString stringWithFormat:@"%@ - %@ - %@ -%@", person.firstName, person.lastName, [person.dob toString:@"yyyy-MM-dd"], person.university.name]];
        }
    }
    //[self listPerson];
    //[self insertUniversityAndPerson];
}


- (void) insertUniversityAndPerson {
    University* standford = [self insertNewUniversity:@"Standford"];
    University* mit = [self insertNewUniversity:@"MIT"];
    University* bachkhoa = [self insertNewUniversity:@"Bach Khoa"];

    Person *p1 = [self insertRandomPerson];
    p1.university = standford;
    
    Person *p2 = [self insertRandomPerson];
    p2.university = mit;
    
    
    for (int i = 0 ; i < 20; i ++) {
        Person* p = [self insertRandomPerson];
        p.university = bachkhoa;
    }
    
    NSError *error = nil;
    [_managedObjectContext save:&error];
    if (error) {
        [self writeln:[NSString stringWithFormat:@"Error when saving: %@", error.description]];
    } else {
        [self writeln: @"Save successfully"];
        for (Person* person in mit.students) {
            [self writeln:[NSString stringWithFormat:@"%@ - %@ - %@ -%@", person.firstName, person.lastName, [person.dob toString:@"yyyy-MM-dd"], person.university.name]];
        }
        
    }
    
}

- (University*) insertNewUniversity: (NSString*) name  {
    NSEntityDescription *entityDescription =
    [NSEntityDescription entityForName:@"University"
                inManagedObjectContext:_managedObjectContext];
    
    University *university = [[University alloc] initWithEntity: entityDescription
                                 insertIntoManagedObjectContext:_managedObjectContext];
    
    university.name = name;
    return university;
    /*
    NSError *error; //con trỏ này đang trỏ vào vùng nhớ 0, nó chưa được khởi tạo
    [_managedObjectContext save:&error];  //Ta truyền vào địa chỉ vật lý của chính con trỏ để nếu có lỗi
    //CoreData sẽ khởi tạo con trỏ cho ta, còn nếu thành công thì con trỏ vẫn trỏ vào 0.
    if (error) {
        [self writeln:[NSString stringWithFormat:@"saving error: %@", error.description]];
        return nil;
    } else {
        [self writeln:@"Save university success"];
        return university;
    }*/
    
}
- (void) insertPerson {
    NSEntityDescription *entityDescription =
    [NSEntityDescription entityForName:@"Person"
                inManagedObjectContext:_managedObjectContext];
    
    Person *person = [[Person alloc] initWithEntity: entityDescription
                     insertIntoManagedObjectContext:_managedObjectContext];
    person.firstName = @"John";
    person.lastName = @"Lenon";
    person.dob = [NSDate fromString:@"1940-10-09" andFormat:@"yyyy-MM-dd"];
    person.photo = [UIImage imageNamed:@"John_Lennon.png"] ;
    NSError *error = nil;
    [_managedObjectContext save:&error];
    if (error) {
        [self writeln:[NSString stringWithFormat:@"Error when saving: %@", error.description]];
    } else {
        [self writeln: @"Save successfully"];
    }
    
}

- (Person*) insertRandomPerson {
    NSEntityDescription *entityDescription =
    [NSEntityDescription entityForName:@"Person"
                inManagedObjectContext:_managedObjectContext];
    
    Person *person = [[Person alloc] initWithEntity: entityDescription
                     insertIntoManagedObjectContext:_managedObjectContext];
    [person randomize];
    return person;
    
    /*NSError *error = nil;
    [_managedObjectContext save:&error];
    if (error) {
        [self writeln:[NSString stringWithFormat:@"Error when saving: %@", error.description]];
        return nil;
    } else {
        [self writeln: @"Save successfully"];
        return person;
    }*/
    
}

- (void) listPerson {
    //Tương đương với SQL Query. Tuy nhiên nó trả về mảng các object
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Person"];
    NSError *error;
    NSArray* result = [_managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (error) {
        [self writeln:[NSString stringWithFormat:@"List error: %@", error.description]];
    } else {
        for (Person* person in result) {
            [self writeln:[NSString stringWithFormat:@"%@ - %@ - %@ - %@", person.firstName, person.lastName, [person.dob toString:@"yyyy-MM-dd"], person.objectID.URIRepresentation]];
            
            UIImage* photo = (UIImage*)person.photo;
            if (photo) {
                [self writeln:@"Get photo ok"];
            }
            
        }
    }
    
}

- (University*) findUniversityByName: (NSString*) name {
    //Tương đương với SQL Query. Tuy nhiên nó trả về mảng các object
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"University"];

    fetchRequest.predicate = [NSPredicate predicateWithFormat:@"name == %@", name];
    NSError *error;
    NSArray* result = [_managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (error) {
        [self writeln:[NSString stringWithFormat:@"List error: %@", error.description]];
        return nil;
    } else {
        return (University*)result[0];
    }

}

@end

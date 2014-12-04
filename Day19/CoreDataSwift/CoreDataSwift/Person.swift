//
//  Person.swift
//  CoreDataSwift
//
//  Created by cuong minh on 12/3/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import Foundation
import CoreData

class Person: NSManagedObject {

    @NSManaged var email: String
    @NSManaged var firstName: String
    @NSManaged var fullName: String
    @NSManaged var lastName: String
    @NSManaged var cats: NSSet

}

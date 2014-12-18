//
//  Cat.swift
//  CoreDataSwift
//
//  Created by cuong minh on 12/3/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import Foundation
import UIKit
import CoreData

@objc(Cat) //Phải bổ xung cái này để khi tạo FetchRequest, trình dịch không báo lỗi
class Cat: NSManagedObject {

    @NSManaged var dob: NSDate
    @NSManaged var gender: Bool
    @NSManaged var nick: String
    @NSManaged var photo: AnyObject
    @NSManaged var breed: CatBreed
    @NSManaged var owners: NSSet
    //factory method
    class func add(nick: String, gender: Bool, dob: NSDate, photo: UIImage?, breed: CatBreed?) -> Cat {
        let cat = Cat.insert() as Cat
        cat.nick = nick
        cat.gender = gender
        cat.dob = dob
        cat.photo = photo!
        cat.breed = breed!
    
        return cat
    }

}

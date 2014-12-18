//
//  CatBreed.swift
//  CoreDataSwift
//
//  Created by cuong minh on 12/3/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import Foundation
import CoreData
//http://stackoverflow.com/questions/26613971/swift-coredata-warning-unable-to-load-class-named
@objc(CatBreed) //Phải bổ xung cái này để khi tạo FetchRequest, trình dịch không báo lỗi
class CatBreed: NSManagedObject {

    @NSManaged var breed: String
    @NSManaged var originCountry: String
    @NSManaged var cats: NSSet
    //factory method
    class func add(breed: String, originCountry: String) -> CatBreed{
        let catBreed = CatBreed.insert() as CatBreed
        catBreed.breed = breed
        catBreed.originCountry = originCountry
        return catBreed        
    }
}

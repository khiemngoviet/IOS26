//
//  Student.swift
//  DemoTable
//
//  Created by cuong minh on 11/18/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import Foundation
import UIKit

class Student: NSObject {
    
    var firstName: String!
    var lastName: String!
    
    var fullName: String!{
        get{
            return self.firstName + " " + self.lastName
        }
    }
    var photo:UIImage!
    var score: Double
    var birthDate: String!
    var address:String!
    var email:String!
    var phone:String!
    

    init (firstName: String,lastName:String,photo:String, score: Double = 0.0) {
        self.firstName = firstName
        self.lastName = lastName
        self.score = score
        self.photo = UIImage(named: photo)!
    }
    
    
}


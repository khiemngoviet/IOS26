//
//  Item.swift
//  CuisineBook
//
//  Created by Khiem Ngo Viet on 11/17/14.
//  Copyright (c) 2014 Khiem Ngo Viet. All rights reserved.
//

import Foundation
class Item{
    var coverImage:String
    var profileImage:String
    var title:String
    var timeCook: String
    
    init(coverImage:String, profileImage:String, title:String, timeCook:String){
        self.coverImage = coverImage
        self.profileImage = profileImage
        self.title = title
        self.timeCook = timeCook
    }
}
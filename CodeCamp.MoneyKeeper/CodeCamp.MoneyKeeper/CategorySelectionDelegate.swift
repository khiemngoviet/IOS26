//
//  CategorySelectionDelegate.swift
//  CodeCamp.MoneyKeeper
//
//  Created by Khiem Ngo Viet on 12/6/14.
//  Copyright (c) 2014 Khiem Ngo Viet. All rights reserved.
//

import Foundation
@objc protocol CategorySelectionDelegate{
    func onSelectedCategory(category:Category)
}
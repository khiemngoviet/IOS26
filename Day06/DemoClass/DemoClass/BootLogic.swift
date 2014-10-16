//
//  BootLogic.swift
//  TechmasterSwiftApp
//
//  Created by Adam on 9/8/14.
//  Copyright (c) 2014 Adam. All rights reserved.
//  Techmaster Vietnam

import UIKit
let SECTION = "section"
let MENU = "menu"
let TITLE = "title"
let CLASS = "class"
class BootLogic: NSObject {
    
    var menu : NSArray!
    class func boot(window:UIWindow){
        let mainScreen = MainScreen(style: UITableViewStyle.Grouped)
        
        var basic = [SECTION: "Basic",MENU:[
            [TITLE: "Demo Shape",CLASS: "DemoShape"],
            [TITLE: "Access Level",CLASS: "AccessLevel"],
            [TITLE: "Polymorphism",CLASS: "DemoPolymorphism"],
            [TITLE: "Complex Number",CLASS: "DemoComplex"],
            [TITLE: "Struct",CLASS: "DemoStruct"],
            [TITLE: "Optional Unwrap",CLASS: "OptionalUnwrap"],
            [TITLE: "Protocol",CLASS: "ProtocolDemo"],
            [TITLE: "Word Counter",CLASS: "WordCounter"],
            [TITLE: "Word Counter Z-A",CLASS: "WordCounterZA"],
            [TITLE: "Word Counter by count",CLASS: "WordCounterWeigh"],
            [TITLE: "Class From String",CLASS: "ClassFromString"]
            ]
        ]
        var function = [SECTION: "Function",MENU: [
            [TITLE: "Tuple, Variadic, inout", CLASS: "DemoFunction"],
            [TITLE: "Closure", CLASS: "DemoClosure"]
            ]
        ]
        var collection = [SECTION: "Collection",MENU: [
            [TITLE: "Array",CLASS: "DemoArray"],
            [TITLE: "Dictionary",CLASS: "DemoDictionary"],
            [TITLE: "Manipulate Array",CLASS: "ManipulateArray"],
            [TITLE: "Sort Array",CLASS: "ManualSort"],
            [TITLE: "Filter, Map, Reduce",CLASS: "FilterMapReduce"]
            ]
        ]
        
        var advanced = [SECTION: "Advanced", MENU:[
            [TITLE: "Unit Test",CLASS:"UnitTest"]
            ]
        ]
        
        mainScreen!.menu = [basic, function, collection, advanced]
        mainScreen!.title = "IOS Swift"
        mainScreen!.about = "Đây là ứng dụng minh hoạ tính năng ngôn ngữ iOS Swift"
        
        let nav = UINavigationController(rootViewController: mainScreen!)
        
        window.rootViewController = nav        
      
    }   
}

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
    
    var menu : NSArray?
    class func boot(window:UIWindow){
        let mainScreen = MainScreen(style: UITableViewStyle.Grouped)
        var simpleIO = [SECTION: "Simple IO",MENU:[
            [TITLE: "Read from plist",CLASS: "ReadPlist"],
            [TITLE: "Write to plist",CLASS: "WritePlist"],
            [TITLE: "Read/Write NSUserDefaults",CLASS: "ReadWriteNSUserDefaults#Storyboard"],
            [TITLE: "NSCoding",CLASS: "NSCodingDemo"],
            [TITLE: "Key Value Observer (KVO)",CLASS: "KVODemo"],
            [TITLE: "Notification Center",CLASS: "NotificationDemo"]
            ]
        ] as NSDictionary  //Cuong: must explicitly declare as NSDictionary to speed up compiling

        var basic = [SECTION: "Basic",MENU:[
            [TITLE: "Check Singleton",CLASS: "CheckSingleton"],
            [TITLE: "CRUD",CLASS: "DemoCRUD"],
            [TITLE: "CRUD2",CLASS: "DemoCRUD2"],
            [TITLE: "NSFetchResultController",CLASS: "CRUDTable"],
            [TITLE: "Template Fetch Request",CLASS: "TemplateFetchRequest"],
            [TITLE: "Paging Fetch Request",CLASS: "PagingFetch"],
            [TITLE: "Predicate Fetch",CLASS: "PredicateFetch"],
            [TITLE: "Transient Property",CLASS: "TransientProperty"],
            [TITLE: "One to Many",CLASS: "OneToMany"],
            [TITLE: "Many to Many",CLASS: "ManyToMany"],
            [TITLE: "Inheritance",CLASS: "Inheritance"]
          ]
        ] as NSDictionary //Cuong: must explicitly declare as NSDictionary to speed up compiling
        
        var advanced = [SECTION: "Advanced",MENU:[
            [TITLE: "Schema Migration",CLASS: "SchemaMigration"],
            [TITLE: "Transient Property",CLASS: "TransientProperty"],
            ]
        ] as NSDictionary //Cuong: must explicitly declare as NSDictionary to speed up compiling
        
        mainScreen.menu = [simpleIO, basic] as NSArray
        mainScreen.title = "Core Data"
        mainScreen.about = "Đây là ứng dụng minh hoạ CoreData được viết bởi TechMaster"
        
        let nav = UINavigationController(rootViewController: mainScreen)
        
        window.rootViewController = nav        
      
    }   
}

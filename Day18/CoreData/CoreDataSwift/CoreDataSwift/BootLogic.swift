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
            [TITLE: "Notification Center",CLASS: "NotificationDemo"],
            ]
        ]

        var basic = [SECTION: "Basic",MENU:[
            [TITLE: "Single Table",CLASS: "SingleTable"],
            [TITLE: "Transient Property",CLASS: "TransientProperty"],
            [TITLE: "One to Many",CLASS: "OneToMany"],
            [TITLE: "Many to Many",CLASS: "ManyToMany"],
            [TITLE: "Inheritance",CLASS: "Inheritance"],
          ]
        ]
        
        var advanced = [SECTION: "Advanced",MENU:[
            [TITLE: "Schema Migration",CLASS: "SchemaMigration"],
            [TITLE: "Transient Property",CLASS: "TransientProperty"],
            ]
        ]
        
        mainScreen.menu = [simpleIO, basic, advanced]
        mainScreen.title = "Core Data"
        mainScreen.about = "Đây là ứng dụng minh hoạ CoreData được viết bởi TechMaster"
        
        let nav = UINavigationController(rootViewController: mainScreen)
        
        window.rootViewController = nav        
      
    }   
}

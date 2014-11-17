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
        
        var basic = [SECTION: "Basic",MENU:[
            [TITLE: "Plain Table",CLASS: "PlainTable"],
            [TITLE: "Raw Table",CLASS: "RawTableViewVC"],
            [TITLE: "2 Tables in VC",CLASS: "TwoTableViewsInVC"],
            [TITLE: "Group Table",CLASS: "GroupTable"],
            [TITLE: "Table + Photo",CLASS: "VictoriaSecret"],
            [TITLE: "Index Table",CLASS: "IndexTable"],
            [TITLE: "Table StoryBoard",CLASS: "TableStoryBoard#Storyboard"]
          ]
        ]
        
        var medium = [SECTION: "Intermediate",MENU:[
            [TITLE: "Accessory Table",CLASS: "AccessoryTable"],
            [TITLE: "Setting Table",CLASS: "SettingTable"],
            [TITLE: "Multi Seclection",CLASS: "MultiSelection"],
            [TITLE: "Custom Cell",CLASS: "CustomCellDemo"],
            [TITLE: "Default SelectionTableVC",CLASS: "DefaultSelectionTableVC"]
            
            ]
        ]
        mainScreen.menu = [basic, medium]
        mainScreen.title = "Table View"
        mainScreen.about = "Đây là ứng dụng minh hoạ TableView"
        
        let nav = UINavigationController(rootViewController: mainScreen)
        
        window.rootViewController = nav        
      
    }   
}

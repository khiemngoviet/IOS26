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
            [TITLE: "Basic Gesture",CLASS: "BasicGesture"],
            [TITLE: "Demo Console",CLASS: "DemoConsole"],
            [TITLE: "Demo Xib",CLASS: "DemoXib"],
            [TITLE: "Demo StoryBoard",CLASS: "DemoStoryBoard#StoryBoard"]
          ]
        ]
      
       
        
        mainScreen.menu = [basic]
        mainScreen.title = "HW:Trinh Minh Cuong:15"
        mainScreen.about = "UIGestureRecoginer"
        
        let nav = UINavigationController(rootViewController: mainScreen)
        
        window.rootViewController = nav        
      
    }   
}

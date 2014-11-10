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
            [TITLE: "View Controllers Events",CLASS: "DemoViewControllerEvents"],
            [TITLE: "Open StoryBoard",CLASS: "OpenStoryBoard"],
            [TITLE: "Open StoryBoard2",CLASS: "OpenStoryBoard2"],
            [TITLE: "StoryBoard Events",CLASS: "DemoStoryBoardEvents"],
            [TITLE: "Hide Status Bar",CLASS: "HideStatusBar"],
            [TITLE: "Alert & ActionSheet",CLASS: "Modal Dialog"],
            ]
        ]
        
        var intermediate = [SECTION: "intermediate",MENU:[
            [TITLE: "Child ViewControllers",CLASS: "ChildViewControllersDemo"],
            ]
        ]
      
       
        
        mainScreen.menu = [basic, intermediate]
        mainScreen.title = "ViewController"
        mainScreen.about = "Đây là ứng dụng minh hoạ UIViewController"
        
        let nav = UINavigationController(rootViewController: mainScreen)
        
        window.rootViewController = nav        
      
    }   
}

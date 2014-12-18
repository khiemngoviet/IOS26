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
            [TITLE: "Simple use Objective-C",CLASS: "SimpleUse"],
            [TITLE: "Use Objective-C Lib",CLASS: "UseObjcLib"],
            [TITLE: "Use Objective-C Lib",CLASS: "UseObjcLib"],
            [TITLE: "Load ObjC object dynamically",CLASS: "LoadDynamicObject"],
            [TITLE: "Call C",CLASS: "CallC"],
            [TITLE: "Call C++ Wrapper",CLASS: "CallCPP"],
            [TITLE: "Call JavaScript",CLASS: "CallJavaScript"],
            [TITLE: "Interact WKWebView",CLASS: "DemoWKWebView"]
          ]
        ]
      
        mainScreen.menu = [basic]
        mainScreen.title = "Objective-C, C, C++, JavaScript"
        mainScreen.about = "Viết bởi Cường"
        
        let nav = UINavigationController(rootViewController: mainScreen)
        
        window.rootViewController = nav        
      
    }   
}

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
            [TITLE: "Tap",CLASS: "DemoTap"],
            [TITLE: "Pan",CLASS: "DemoPan"],
            [TITLE: "Rotate",CLASS: "DemoRotate"],
            [TITLE: "Swipe",CLASS: "DemoSwipe"],
            [TITLE: "Pinch",CLASS: "DemoPinch"],
            [TITLE: "Pinch Rotate",CLASS: "DemoPinchRotate"],
            [TITLE: "Throw Ball",CLASS: "ThrowBall"]
            ]
        ]        
        mainScreen.menu = [basic]
        mainScreen.title = "Gesture Recognizer"
        mainScreen.about = "Gesture Recognizer iOS8"
        
        let nav = UINavigationController(rootViewController: mainScreen)
        
        window.rootViewController = nav        
      
    }   
}

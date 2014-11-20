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
            [TITLE: "Demo UIView",CLASS: "DemoUIView"],
            [TITLE: "Demo Control",CLASS: "DemoControl"],
            [TITLE: "Bon Fire",CLASS: "BonFire"],
            [TITLE: "Flying Bird",CLASS: "FlyingBird"],
            [TITLE: "Demo Color",CLASS: "DemoColor"]
            ]
        ]
        
        var animation = [SECTION: "Animation",MENU:[
            [TITLE: "Earth around Sun",CLASS: "EarthAroundSun"],
            [TITLE: "Star Field",CLASS: "StarField"],
            [TITLE: "Rolling Ball",CLASS: "RollingBall"],
            [TITLE: "Trailing Stars",CLASS: "TrailingStars"],
            [TITLE: "Drop Ball",CLASS: "DropBall"],
            [TITLE: "Ball on Table",CLASS: "BallOnTable"],
            [TITLE: "Mario",CLASS: "Mario"]
            ]
        ]
        
        var gesture = [SECTION: "Guesture",MENU:[
            [TITLE: "Star Field",CLASS: "StarField"]          
            ]
        ]

       
        
        mainScreen.menu = [basic, animation]
        mainScreen.title = "UIView - Controls"
        mainScreen.about = "Đây là ứng dụng minh hoạ UIView - Controls"
        
        let nav = UINavigationController(rootViewController: mainScreen)
        
        window.rootViewController = nav        
      
    }   
}

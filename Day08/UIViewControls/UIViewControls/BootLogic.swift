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
            [TITLE: "View Basic",CLASS: "ViewBasic"],
            [TITLE: "View Basic2",CLASS: "ViewBasic2"],
            [TITLE: "Demo Image",CLASS: "DemoImage"],
            [TITLE: "Events of ViewControllers",CLASS: "VCEvents"],
            [TITLE: "Demo UIView",CLASS: "DemoUIView"],
            [TITLE: "Demo Control",CLASS: "DemoControl"],
            [TITLE: "Bon Fire",CLASS: "BonFire"],
            [TITLE: "Flying Bird",CLASS: "FlyBird"],
            [TITLE: "Add Remove",CLASS: "AddRemoveVC"],
            [TITLE: "Tag Property",CLASS: "TagPropertyVC"],
            [TITLE: "Alpha Property",CLASS: "AlphaPropertyVC"],
            [TITLE: "AffineTransform",CLASS: "AffineTransformVC"],
            [TITLE: "Block Animation",CLASS: "BlockAnimationVC"],
            [TITLE: "View Transition",CLASS: "ViewTransitionVC"],
            [TITLE: "Rating",CLASS: "RatingVC"]
            ]
        ]
        
        
        mainScreen.menu = [basic]
        mainScreen.title = "UIView - Controls"
        mainScreen.about = "Đây là ứng dụng minh hoạ UIView - Controls"
        
        let nav = UINavigationController(rootViewController: mainScreen)
        
        window.rootViewController = nav
        
    }
}

//
//  AppDelegate.swift
//  DemoClass
//
//  Created by techmaster on 8/22/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
                            
    var window: UIWindow?


    func application(application: UIApplication!, didFinishLaunchingWithOptions launchOptions: NSDictionary!) -> Bool {
        
        //Thêm 3 dòng này để cấu hình BootLogic
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)

        BootLogic.boot(self.window!)
        // 
        DataManager.singleton.hardReset()
        self.window?.makeKeyAndVisible()
        
        
        return true
    }

}


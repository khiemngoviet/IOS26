//
//  HelloWorld.swift
//  DemoViewController
//
//  Created by cuong minh on 10/28/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class HelloWorld: UIViewController {

    @IBAction func swipeLeftToClose(sender: UISwipeGestureRecognizer) {
        self.dismissViewControllerAnimated(true) { () -> Void in
            println("Done")
        }
    }


}

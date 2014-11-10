//
//  CustomSegue.swift
//  DemoViewController
//
//  Created by cuong minh on 10/31/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class CustomSegue: UIStoryboardSegue {
    override func perform() {    
       println("Do some thing cool here")
       self.sourceViewController.presentViewController(self.destinationViewController as UIViewController, animated: true, completion: nil)
    
    }
}

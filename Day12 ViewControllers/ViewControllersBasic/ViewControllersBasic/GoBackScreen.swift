//
//  GoBackScreen.swift
//  ViewControllersBasic
//
//  Created by cuong minh on 11/10/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class GoBackScreen: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func onGoback(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
  

}

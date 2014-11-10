//
//  HideStatusBar.swift
//  DemoViewController
//
//  Created by cuong minh on 10/31/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class HideStatusBar: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }


}

//
//  PresentModallyVC.swift
//  DemoViewController
//
//  Created by cuong minh on 10/31/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class PresentModallyVC: UIViewController {

    @IBAction func onClose(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}

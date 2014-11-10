//
//  BikiniScreen.swift
//  ViewControllersBasic
//
//  Created by cuong minh on 11/10/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class BikiniScreen: UIViewController {

    @IBOutlet weak var bikiniPhoto: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
      //  bikiniPhoto.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "onTap:"))
        let swipe = UISwipeGestureRecognizer(target: self, action: "onSwipe:")
        swipe.direction = UISwipeGestureRecognizerDirection.Left
        bikiniPhoto.addGestureRecognizer(swipe)
    }
    
    func onTap(tap: UITapGestureRecognizer)
    {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    func onSwipe(swipe: UISwipeGestureRecognizer) {
        self.dismissViewControllerAnimated(true , completion: nil)
    }

    
}

//
//  AnimationByTimerVC.swift
//  UIViewControls
//
//  Created by Khiem Ngo Viet on 10/26/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class AnimationByTimerVC: UIViewController {

    var cat: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.cat = UIImageView(image: UIImage(named: "cat_grumpy.png"))
        self.cat.frame = CGRect(x: 10, y: 50, width: 100, height: 100)
        self.cat.contentMode = UIViewContentMode.ScaleAspectFit
        self.view.addSubview(cat)
        
        var animateButton: UIButton = UIButton.buttonWithType(UIButtonType.System) as UIButton
        animateButton.bounds = CGRect(x: 0, y: 0, width: 100, height: 30)
        animateButton.center = CGPoint(x: self.view.bounds.size.width * 0.5, y: self.view.bounds.size.height * 0.9)
        animateButton.setTitle("Animate!", forState: UIControlState.Normal)
        animateButton.addTarget(self, action: "onAnimateTouched", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(animateButton)
    }

   

}

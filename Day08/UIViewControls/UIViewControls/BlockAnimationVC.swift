//
//  BlockAnimationVC.swift
//  UIViewControls
//
//  Created by Khiem Ngo Viet on 10/26/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class BlockAnimationVC: UIViewController {

    var cat: UIImageView!
    var timer:NSTimer!
    var boundRect: CGRect!
    var vX: CGFloat!
    var vY: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        
        boundRect = self.view.bounds
        vX = 10
        vY = 10
        
        self.cat = UIImageView(image: UIImage(named: "cat_grumpy.png"))
        self.cat.frame = CGRect(x: 10, y: 50, width: 100, height: 100)
        self.cat.contentMode = UIViewContentMode.ScaleAspectFit
        self.view.addSubview(cat)
        
        var animateButton: UIButton = UIButton.buttonWithType(UIButtonType.System) as UIButton
        animateButton.bounds = CGRect(x: 0, y: 0, width: 100, height: 30)
        animateButton.center = CGPoint(x: self.view.bounds.size.width * 0.5, y: self.view.bounds.size.height * 0.9)
        animateButton.setTitle("Stop Animation", forState: UIControlState.Normal)
        animateButton.addTarget(self, action: "stopTimer", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(animateButton)
       
        self.startAnimation()
    }
    
    func startAnimation(){
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "animateCat:", userInfo: nil, repeats: true)
        timer.fire()
    }
    
    func animateCat(theTimer:NSTimer){
        let center = self.cat.center

        let size = self.cat.bounds.size
        
        var newX = center.x + vX
        var newY = center.y + vY
        
        if ((newX < size.width / 2) || (newX > self.view.bounds.size.width - size.width / 2)) {
            vX =  -vX
        }
        
        if ((newY < 40 + size.height / 2) || (newY > self.view.bounds.size.height - size.height / 2)) {
            vY = -vY
        }
        
        newX = center.x + vX
        newY = center.y + vY
        
        self.cat.center = CGPointMake(newX , newY)
    }

    func stopTimer(){
        if (timer != nil && timer.valid) {
            timer.invalidate()
            timer = nil;
        } else {
            self.startAnimation()
        }
    }


}

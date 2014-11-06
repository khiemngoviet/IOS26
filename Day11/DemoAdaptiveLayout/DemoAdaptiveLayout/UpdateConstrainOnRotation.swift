//
//  UpdateConstrainOnRotation.swift
//  DemoAdaptiveLayout
//
//  Created by Trinh Minh Cuong on 10/14/14.
//  Copyright (c) 2014 Techmaster Vietnam. All rights reserved.
//

import UIKit

class UpdateConstrainOnRotation: UIViewController {
    var blueRect: UILabel?
    var orangeRect: UILabel?
    //portrait
    var c1, c2, c3: [AnyObject]?
    var co1, co2: NSLayoutConstraint?
    
    //landscape
    var c_1, c_2, c_3: [AnyObject]?
    var co_1, co_2: NSLayoutConstraint?
    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = UIColor.whiteColor()
        self.edgesForExtendedLayout = UIRectEdge.None
        
        blueRect = UILabel()
        blueRect!.text = "A"
        blueRect!.textAlignment = NSTextAlignment.Center
        blueRect!.backgroundColor = UIColor.blueColor()
        self.view.addSubview(blueRect!)
        blueRect!.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        
        orangeRect = UILabel()
        orangeRect!.text = "B"
        orangeRect!.textAlignment = NSTextAlignment.Center
        orangeRect!.backgroundColor = UIColor.orangeColor()
        self.view.addSubview(orangeRect!)
        orangeRect!.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        portraitConstraint()
        landscapeConstraint()
        toggleConstraint(true)
    }
    
    func portraitConstraint() {
        let views = ["view": self.view, "blueRect": blueRect!, "orangeRect": orangeRect!]
        //Vertical space:
        c1 = NSLayoutConstraint.constraintsWithVisualFormat("V:|-40.0-[blueRect]-10.0-[orangeRect]-40.0-|", options: nil, metrics: nil, views: views)
        self.view.addConstraints(c1!)
        
        c2 = NSLayoutConstraint.constraintsWithVisualFormat("H:|-40.0-[blueRect]-40.0-|", options: nil, metrics: nil, views: views)
        self.view.addConstraints(c2!)
        
        c3 = NSLayoutConstraint.constraintsWithVisualFormat("H:|-40.0-[orangeRect]-40.0-|", options: nil, metrics: nil, views: views)
        self.view.addConstraints(c3!)
        
        co1 = NSLayoutConstraint(item: orangeRect!, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: blueRect!, attribute: NSLayoutAttribute.Height, multiplier: 2, constant: 0)
        
        self.view.addConstraint(co1!)
        
        co2 = NSLayoutConstraint(item: orangeRect!, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: blueRect!, attribute: NSLayoutAttribute.Width, multiplier: 1, constant: 0)
        self.view.addConstraint(co2!)
    }
    
    func toggleConstraint(portrait: Bool) {
        if portrait {
            //Always deactivate constraint first
            NSLayoutConstraint.deactivateConstraints(c_1!)
            NSLayoutConstraint.deactivateConstraints(c_2!)
            NSLayoutConstraint.deactivateConstraints(c_3!)
            
            co_1!.active = false
            co_2!.active = false

            //Then activate later
            NSLayoutConstraint.activateConstraints(c1!)
            NSLayoutConstraint.activateConstraints(c2!)
            NSLayoutConstraint.activateConstraints(c3!)
            
            co1!.active = true
            co2!.active = true
            
           
        } else {
            NSLayoutConstraint.deactivateConstraints(c1!)
            NSLayoutConstraint.deactivateConstraints(c2!)
            NSLayoutConstraint.deactivateConstraints(c3!)
        
            co1!.active = false
            co2!.active = false
            
            
            NSLayoutConstraint.activateConstraints(c_1!)
            NSLayoutConstraint.activateConstraints(c_2!)
            NSLayoutConstraint.activateConstraints(c_3!)
            
            co_1!.active = true
            co_2!.active = true
        }
    }
    
    func landscapeConstraint() {
        let views = ["view": self.view, "blueRect": blueRect!, "orangeRect": orangeRect!]
        //Horizonal space:
        c_1 = NSLayoutConstraint.constraintsWithVisualFormat("H:|-40.0-[blueRect]-10.0-[orangeRect]-40.0-|", options: nil, metrics: nil, views: views)
        self.view.addConstraints(c_1!)
        
        c_2 = NSLayoutConstraint.constraintsWithVisualFormat("V:|-40.0-[blueRect]-40.0-|", options: nil, metrics: nil, views: views)
        self.view.addConstraints(c_2!)
        
        c_3 = NSLayoutConstraint.constraintsWithVisualFormat("V:|-40.0-[orangeRect]-40.0-|", options: nil, metrics: nil, views: views)
        self.view.addConstraints(c_3!)
        
        
        co_1 = NSLayoutConstraint(item: orangeRect!, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: blueRect!, attribute: NSLayoutAttribute.Height, multiplier: 1, constant: 0)
        
        self.view.addConstraint(co_1!)
        
        co_2 = NSLayoutConstraint(item: orangeRect!, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: blueRect!, attribute: NSLayoutAttribute.Width, multiplier: 2, constant: 0)
        self.view.addConstraint(co_2!)
    }

    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        let size = self.view.bounds.size
        if size.width < size.height { //portrait
           toggleConstraint(true)            
        } else {
           toggleConstraint(false)
        }
        
    }

   
}

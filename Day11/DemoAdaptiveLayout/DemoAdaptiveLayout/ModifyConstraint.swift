//
//  ModifyConstraint.swift
//  DemoAdaptiveLayout
//
//  Created by Trinh Minh Cuong on 10/14/14.
//  Copyright (c) 2014 Techmaster Vietnam. All rights reserved.
//

import UIKit

class ModifyConstraint: UIViewController {
    var cs1, cs2: [AnyObject]?
    
    var cs_1, cs_2: [AnyObject]?
    
    var isTopLeft: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.edgesForExtendedLayout = UIRectEdge.None
        
        let label = UILabel()
        label.setTranslatesAutoresizingMaskIntoConstraints(false)
        label.text = "Crazy fox jumps over"
        label.backgroundColor = UIColor.grayColor()
        let sizeLabel = label.intrinsicContentSize()
        println("w = \(sizeLabel.width), h = \(sizeLabel.height)")
        
        self.view.addSubview(label)
        
        let views = ["view": self.view, "label": label]
        
        cs1 = NSLayoutConstraint.constraintsWithVisualFormat("V:|-10.0-[label]", options: nil, metrics: nil, views: views)
        self.view.addConstraints(cs1!)
        
        cs2 = NSLayoutConstraint.constraintsWithVisualFormat("H:|-10.0-[label]", options: nil, metrics: nil, views: views)
        self.view.addConstraints(cs2!)
        
        
        cs_1 = NSLayoutConstraint.constraintsWithVisualFormat("V:[label]-10.0-|", options: nil, metrics: nil, views: views)
       
        self.view.addConstraints(cs_1!)
        
        cs_2 = NSLayoutConstraint.constraintsWithVisualFormat("H:[label]-10.0-|", options: nil, metrics: nil, views: views)
        self.view.addConstraints(cs_2!)
        NSLayoutConstraint.deactivateConstraints(cs_1!)
        NSLayoutConstraint.deactivateConstraints(cs_2!)
        
        //Button
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 120, height: 40))
        button.setTitle("Have fun", forState: UIControlState.Normal)
        button.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        button.backgroundColor = UIColor.orangeColor()
        button.setTranslatesAutoresizingMaskIntoConstraints(false)
        button.addTarget(self, action: "flipLabel", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button)
        
        self.view.addConstraint(NSLayoutConstraint(item: button, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0))
        
        self.view.addConstraint(NSLayoutConstraint(item: button, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 0))
    }
    
    func flipLabel() {
        isTopLeft = !isTopLeft
        if isTopLeft {
            NSLayoutConstraint.deactivateConstraints(cs_1!)
            NSLayoutConstraint.deactivateConstraints(cs_2!)
            NSLayoutConstraint.activateConstraints(cs1!)
            NSLayoutConstraint.activateConstraints(cs2!)
        } else {
            NSLayoutConstraint.deactivateConstraints(cs1!)
            NSLayoutConstraint.deactivateConstraints(cs2!)
            NSLayoutConstraint.activateConstraints(cs_1!)
            NSLayoutConstraint.activateConstraints(cs_2!)
            
        }
    }
}

//
//  DemoMultipler.swift
//  DemoAdaptiveLayout
//
//  Created by Trinh Minh Cuong on 10/14/14.
//  Copyright (c) 2014 Techmaster Vietnam. All rights reserved.
//

import UIKit

class DemoMultipler: UIViewController {
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.edgesForExtendedLayout = UIRectEdge.None
        
        let blueRect = UIView()
        blueRect.backgroundColor = UIColor.blueColor()
        self.view.addSubview(blueRect)
        blueRect.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        
        let orangeRect = UIView()
        orangeRect.backgroundColor = UIColor.orangeColor()
        self.view.addSubview(orangeRect)
        orangeRect.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        let views = ["view": self.view, "blueRect": blueRect]
        //Vertical space: cách top 40 point, cao 100 point
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-40.0-[blueRect(100)]", options: nil, metrics: nil, views: views))
        //Ngang 100 point
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:[blueRect(100)]", options: nil, metrics: nil, views: views))
        //CenterX blue
        self.view.addConstraint(NSLayoutConstraint(item: blueRect, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0))
        
        let blueOrange = ["blueRect": blueRect, "orangeRect": orangeRect]
        //CenterX orange
        self.view.addConstraint(NSLayoutConstraint(item: orangeRect, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0))
       
        //Make orange.height = blue.height * 2
        self.view.addConstraint(NSLayoutConstraint(item: orangeRect, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: blueRect, attribute: NSLayoutAttribute.Height, multiplier: 2, constant: 0))
        
        //Make orange.width = blue.width * 2
        self.view.addConstraint(NSLayoutConstraint(item: orangeRect, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: blueRect, attribute: NSLayoutAttribute.Width, multiplier: 2, constant: 0))
        
        //Vertical space between blue and orange is 10. Try [blueRect][orangeRect]
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[blueRect]-10-[orangeRect]", options: nil, metrics: nil, views: blueOrange))
    }
}

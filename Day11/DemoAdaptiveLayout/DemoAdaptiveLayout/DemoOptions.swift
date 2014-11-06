//
//  DemoOptions.swift
//  DemoAdaptiveLayout
//
//  Created by Trinh Minh Cuong on 10/15/14.
//  Copyright (c) 2014 Techmaster Vietnam. All rights reserved.
//

import UIKit

class DemoOptions: UIViewController {
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
        
        
        let redRect = UIView()
        redRect.backgroundColor = UIColor.redColor()
        self.view.addSubview(redRect)
        redRect.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        let views = ["view": self.view, "blueRect": blueRect]
        //Vertical space: cách top 40 point, cao 100 point
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-40.0-[blueRect(100)]", options: nil, metrics: nil, views: views))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:[blueRect(100)]", options: nil, metrics: nil, views: views))
       
        self.view.addConstraint(NSLayoutConstraint(item: blueRect, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0))
        
        
        //ORANGE
        self.view.addConstraint(NSLayoutConstraint(item: orangeRect, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: blueRect, attribute: NSLayoutAttribute.Width, multiplier: 2.0, constant: 0))
        
        /* Thực hành thử thay đổi
            options: NSLayoutFormatOptions.AlignAllLeft
            options: NSLayoutFormatOptions.AlignAllLeading
        */

        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[blueRect]-20-[orangeRect(50)]", options: NSLayoutFormatOptions.AlignAllLeading, metrics: nil, views: ["blueRect": blueRect, "orangeRect": orangeRect]))
        
        //RED
        self.view.addConstraint(NSLayoutConstraint(item: orangeRect, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: redRect, attribute: NSLayoutAttribute.Width, multiplier: 2.0, constant: 0))
        //options: NSLayoutFormatOptions.AlignAllTrailing
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[orangeRect]-20-[redRect(50)]", options: NSLayoutFormatOptions.AlignAllTrailing, metrics: nil, views: ["orangeRect": orangeRect, "redRect": redRect]))
       
        
    }

}

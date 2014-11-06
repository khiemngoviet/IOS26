//
//  LayoutConstraint.swift
//  DemoAdaptiveLayout
//
//  Created by Trinh Minh Cuong on 10/14/14.
//  Copyright (c) 2014 Techmaster Vietnam. All rights reserved.
//

import UIKit

class CenterX: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.edgesForExtendedLayout = UIRectEdge.None
        let blueRect = UIView()
        blueRect.backgroundColor = UIColor.blueColor()
        self.view.addSubview(blueRect)
        blueRect.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        //http://stackoverflow.com/questions/12873372/centering-a-view-in-its-superview-using-visual-format-language
        //http://commandshift.co.uk/blog/2013/01/31/visual-format-language-for-autolayout/
        
        let views = ["view": self.view, "blueRect": blueRect]
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:[blueRect(100)]", options: NSLayoutFormatOptions.allZeros, metrics: nil, views: views))
        
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[blueRect(50)]", options: NSLayoutFormatOptions.allZeros, metrics: nil, views: views))
        
        self.view.addConstraint(NSLayoutConstraint(item: blueRect, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0))
        
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-40.0-[blueRect]", options: NSLayoutFormatOptions.allZeros, metrics: nil, views: views))

        
    }

}

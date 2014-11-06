//
//  FourSquares.swift
//  DemoAdaptiveLayout
//
//  Created by Trinh Minh Cuong on 10/14/14.
//  Copyright (c) 2014 Techmaster Vietnam. All rights reserved.
//

import UIKit

class FourSquares: UIViewController {
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
        
        let greenRect = UIView()
        greenRect.backgroundColor = UIColor.greenColor()
        self.view.addSubview(greenRect)
        greenRect.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        
        let grayRect = UIView()
        grayRect.backgroundColor = UIColor.grayColor()
        self.view.addSubview(grayRect)
        grayRect.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        //BlueRect
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-20.0-[blueRect(100)]", options: nil, metrics: nil, views: ["view": self.view, "blueRect": blueRect]))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-20.0-[blueRect(100)]", options: nil, metrics: nil, views: ["view": self.view, "blueRect": blueRect]))
        
        //OrangeRect
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-20.0-[orangeRect(100)]", options: nil, metrics: nil, views: ["view": self.view, "orangeRect": orangeRect]))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:[orangeRect(100)]-20.0-|", options: nil, metrics: nil, views: ["view": self.view, "orangeRect": orangeRect]))
        
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[greenRect(100)]-20.0-|", options: nil, metrics: nil, views: ["view": self.view, "greenRect": greenRect]))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:[greenRect(100)]-20.0-|", options: nil, metrics: nil, views: ["view": self.view, "greenRect": greenRect]))
        
        
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[grayRect(100)]-20.0-|", options: nil, metrics: nil, views: ["view": self.view, "grayRect": grayRect]))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-20.0-[grayRect(100)]", options: nil, metrics: nil, views: ["view": self.view, "grayRect": grayRect]))
        
    }
    override func updateViewConstraints(){
        super.updateViewConstraints()
        let size = self.view.bounds.size
        
        println("updateViewConstraints. width = \(size.width), height = \(size.height)")
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        println("viewWillLayoutSubviews")
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        println("viewDidLayoutSubviews")
    }

}

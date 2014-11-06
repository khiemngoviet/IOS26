//
//  DemoMetrics.swift
//  DemoAdaptiveLayout
//
//  Created by Trinh Minh Cuong on 10/14/14.
//  Copyright (c) 2014 Techmaster Vietnam. All rights reserved.
//

import UIKit

class DemoMetrics: UIViewController {
    override func loadView() {
        super.loadView()
        view.backgroundColor = UIColor.whiteColor()
        self.edgesForExtendedLayout = UIRectEdge.None
        let blueRect = UIView()
        blueRect.backgroundColor = UIColor.blueColor()
        
        self.view.addSubview(blueRect)
        blueRect.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        let views = ["view": self.view, "blueRect": blueRect]
        //Demo cách truyền metric vào constraint
        let metric = ["Vspace": 10, "Hspace": 80]
        
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-Vspace-[blueRect]-Vspace-|", options: nil, metrics: metric, views: views))
        

        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-Hspace-[blueRect]-Hspace-|", options: nil, metrics: metric, views: views))
    }
}

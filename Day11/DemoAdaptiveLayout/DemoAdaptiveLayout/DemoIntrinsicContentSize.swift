//
//  DemoIntrinsicContentSize.swift
//  DemoAdaptiveLayout
//
//  Created by Trinh Minh Cuong on 10/14/14.
//  Copyright (c) 2014 Techmaster Vietnam. All rights reserved.
//

import UIKit

class DemoIntrinsicContentSize: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.edgesForExtendedLayout = UIRectEdge.None
        
        let label = UILabel()
        label.setTranslatesAutoresizingMaskIntoConstraints(false)
        label.text = "Crazy fox jumps over the fence"
        label.backgroundColor = UIColor.grayColor()
        let sizeLabel = label.intrinsicContentSize()
        println("w = \(sizeLabel.width), h = \(sizeLabel.height)")
        
        self.view.addSubview(label)
        
        let views = ["view": self.view, "label": label]
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-10.0-[label]", options: nil, metrics: nil, views: views))

        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-10.0-[label]", options: nil, metrics: nil, views: views))
    }


}

//
//  ExtendBarButtonItem.swift
//  DemoTable
//
//  Created by cuong minh on 11/18/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit
extension UIBarButtonItem {

    convenience init (image: UIImage, target: AnyObject?, action: Selector) {
        let button = UIButton.buttonWithType(UIButtonType.Custom) as UIButton
        button.bounds = CGRect(origin: CGPoint.zeroPoint, size: image.size)
        button.setImage(image, forState: UIControlState.Normal)
        button.addTarget(target, action: action, forControlEvents: UIControlEvents.TouchUpInside)
        self.init(customView: button)
    }
}
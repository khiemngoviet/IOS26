//
//  ViewTransitionVC.swift
//  UIViewControls
//
//  Created by Khiem Ngo Viet on 10/27/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class ViewTransitionVC: UIViewController {

    var flipView:FlipView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        flipView = FlipView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.size.width * 0.8, height: self.view.bounds.size.height * 0.7))
        flipView.center = CGPoint(x: self.view.bounds.size.width * 0.5, y: self.view.bounds.size.height * 0.5)
        self.view.addSubview(flipView)
    }

   

}

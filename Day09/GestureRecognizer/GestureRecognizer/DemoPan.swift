//
//  DemoPan.swift
//  GestureRecognizer
//
//  Created by Trinh Minh Cuong on 10/3/14.
//  Copyright (c) 2014 Techmaster Vietnam. All rights reserved.
//

import UIKit

class DemoPan: UIViewController {
    var target: UIImageView?
    override func loadView() {
        super.loadView()
        self.edgesForExtendedLayout = UIRectEdge.None
        self.view.backgroundColor = UIColor.whiteColor()
   
        target = UIImageView(image: UIImage(named: "target.png"))
        let size = self.view.bounds.size
        target?.center = CGPoint(x: size.width * 0.5, y: (size.height - 60) * 0.5)
        self.view.addSubview(target!)
        
        target!.multipleTouchEnabled = true
        target!.userInteractionEnabled = true
        
        let pan = UIPanGestureRecognizer(target: self, action: "onPan:")
        target?.addGestureRecognizer(pan)
    }
    
    func onPan(pan: UIPanGestureRecognizer) {
        if (pan.state == UIGestureRecognizerState.Began || pan.state == UIGestureRecognizerState.Changed) {
            target!.center = pan.locationInView(self.view)
        }
        
    }
}

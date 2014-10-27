//
//  DemoPin.swift
//  GestureRecognizer
//
//  Created by Trinh Minh Cuong on 10/3/14.
//  Copyright (c) 2014 Techmaster Vietnam. All rights reserved.
//

import UIKit

class DemoPinch: UIViewController {
    var girl: UIImageView?
    override func loadView() {
        super.loadView()
        self.edgesForExtendedLayout = UIRectEdge.None
        self.view.backgroundColor = UIColor.whiteColor()
        girl = UIImageView(image: UIImage(named: "playboy.jpg"))
        
        let size = self.view.bounds.size
        girl?.center = CGPoint(x: size.width * 0.5, y: (size.height - 60) * 0.5)
        girl?.bounds = CGRect(x: 0, y: 0, width: size.width * 0.25, height: size.height * 0.25)
        girl?.contentMode = UIViewContentMode.ScaleAspectFit
        self.view.addSubview(girl!)
        girl!.multipleTouchEnabled = true
        girl!.userInteractionEnabled = true
        let pinch = UIPinchGestureRecognizer(target: self, action: "onPinch:")
        
        girl!.addGestureRecognizer(pinch)
    }
    
    func onPinch(pinch: UIPinchGestureRecognizer) {
        girl!.transform = CGAffineTransformMakeScale(pinch.scale, pinch.scale)
    }

}

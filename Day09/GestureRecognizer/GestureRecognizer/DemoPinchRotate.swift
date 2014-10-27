//
//  DemoPinchRotate.swift
//  GestureRecognizer
//
//  Created by Trinh Minh Cuong on 10/3/14.
//  Copyright (c) 2014 Techmaster Vietnam. All rights reserved.
//

import UIKit

class DemoPinchRotate: UIViewController {
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
        
        let rotate = UIRotationGestureRecognizer(target: self, action: "onRotate:")
        girl!.addGestureRecognizer(rotate)

    }
    
    func onPinch(pinch: UIPinchGestureRecognizer) {
        if (pinch.state == UIGestureRecognizerState.Began || pinch.state == UIGestureRecognizerState.Changed) {
        //girl!.transform = CGAffineTransformMakeScale(pinch.scale, pinch.scale)
            girl!.transform = CGAffineTransformScale(girl!.transform, pinch.scale, pinch.scale)
            pinch.scale = 1
        }
    }
    
    func onRotate(rotate: UIRotationGestureRecognizer) {
       // girl!.ad
        if (rotate.state == UIGestureRecognizerState.Began || rotate.state == UIGestureRecognizerState.Changed) {
            girl!.transform = CGAffineTransformRotate(girl!.transform, rotate.rotation)
            rotate.rotation = 0
        }
    }

}

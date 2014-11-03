//
//  UIImageViewExtension.swift
//  RandomPhoto
//
//  Created by Khiem Ngo Viet on 11/3/14.
//  Copyright (c) 2014 Khiem Ngo Viet. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView{
    
    func makeItCool(){
        self.layer.masksToBounds = false
        self.layer.borderWidth = 5.0
        self.layer.borderColor = UIColor.whiteColor().CGColor
        
        self.layer.shadowRadius = 5.0
        self.layer.shadowOpacity = 85.0
        self.layer.shadowOffset = CGSizeMake(1.0, 2.0)
        self.layer.shadowColor = UIColor.blackColor().CGColor
        self.layer.shouldRasterize = true
        self.layer.masksToBounds = false
        
        let transform = CGAffineTransformMakeRotation((CGFloat(rand()/RAND_MAX) - 0.5)*0.4)
        self.transform = transform
        
    }
    
    func addGestureRecognizer()
    {
        self.userInteractionEnabled = true  //Don't forget this line
        self.multipleTouchEnabled = true  //Don't forget this line
        let rotateRecognizer = UIRotationGestureRecognizer(target: self, action: "rotateMe:")
        self.addGestureRecognizer(rotateRecognizer)
        let pinchRecognizer = UIPinchGestureRecognizer(target: self, action: "pinchMe:")
        self.addGestureRecognizer(pinchRecognizer)
    }
    
    func rotateMe(rotateRecognizer: UIRotationGestureRecognizer )
    {
        let transform = CGAffineTransformMakeRotation (rotateRecognizer.rotation);
        self.transform = transform;
    }
    
    func pinchMe(pinchRecognizer:UIPinchGestureRecognizer)
    {
        let transform = CGAffineTransformMakeScale(pinchRecognizer.scale, pinchRecognizer.scale);
        self.transform = transform;
    }
    
}
//
//  LensZoom.swift
//  ScrollInSwift
//
//  Created by Trung on 8/25/14.
//  Copyright (c) 2014 vn.Techmsater. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore
class LensZoom: UIViewController, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    var circleRadius: CGFloat!
    var circleCenter: CGPoint!
    
    var currentRadius: CGFloat!
    
    weak var maskLayer: CAShapeLayer!
    weak var circleLayer: CAShapeLayer!
    
    weak var pinch: UIPinchGestureRecognizer!
    weak var pan: UIPanGestureRecognizer!
    
    override func viewDidLoad() {
        // create mask layer for the image 
        var maskLayer = CAShapeLayer()
        self.imageView.layer.mask = maskLayer
        self.maskLayer = maskLayer
        
        // create shape layer for circle we will draw on top of the image
        
        var circleLayer = CAShapeLayer()
        circleLayer.lineWidth = 3.0
        circleLayer.fillColor = UIColor.clearColor().CGColor
        circleLayer.strokeColor = UIColor.redColor().CGColor
        self.imageView.layer.addSublayer(circleLayer)
        self.circleLayer = circleLayer
        
        // create circle path
        self.updateCirclePathAtLocation(CGPointMake(self.view.bounds.size.width / 2 , self.view.bounds.size.height / 2), radius: self.view.bounds.size.width * 0.3)
        
        // create pan gesture 
        var pan = UIPanGestureRecognizer(target: self, action: "handlePan:")
        pan.delegate = self
        self.imageView.addGestureRecognizer(pan)
        self.imageView.userInteractionEnabled = true
        self.pan = pan
        
        // create pinch
        var pinch = UIPinchGestureRecognizer(target: self, action: "handlePinch:")
        pinch.delegate = self
        self.view.addGestureRecognizer(pinch)
        self.pinch = pinch
    }
    
    // Cap nhat vi tri cua lens zoom
    func updateCirclePathAtLocation(location: CGPoint, radius: CGFloat){
        println("\(radius)")
        self.circleCenter = location
        self.circleRadius = radius
        // Ve 1 duong tron
        var path = UIBezierPath()
        path.addArcWithCenter(self.circleCenter, radius: self.circleRadius, startAngle: 0.0, endAngle: CGFloat(M_PI  * 2.0), clockwise: true)
        
        // Thu comment 2 dong duoi de thay su thay doi
        self.maskLayer.path = path.CGPath
        self.circleLayer.path = path.CGPath
    }
    
    
    func handlePan(sender: UIPanGestureRecognizer){
        var translation = sender.locationInView(sender.view)
        var newCenter = CGPointMake( translation.x,  translation.y)
        self.updateCirclePathAtLocation(newCenter, radius: self.circleRadius)
     
    }
    
    func handlePinch(sender: UIPinchGestureRecognizer){
        var scale = sender.scale
        if sender.state == UIGestureRecognizerState.Began {
            self.currentRadius = self.circleRadius
        }
        var newRadius = self.currentRadius * scale
        
        self.updateCirclePathAtLocation(self.circleCenter, radius: newRadius)
    }
    
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer!, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer!) -> Bool {
        if gestureRecognizer == self.pan && otherGestureRecognizer == self.pinch || gestureRecognizer == self.pinch && otherGestureRecognizer == self.pan {
            return true
        }
        return false
    }
}
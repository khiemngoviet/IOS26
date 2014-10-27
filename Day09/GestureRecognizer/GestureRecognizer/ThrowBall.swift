//
//  ThrowBall.swift
//  GestureRecognizer
//
//  Created by Trinh Minh Cuong on 10/3/14.
//  Copyright (c) 2014 Techmaster Vietnam. All rights reserved.
//

import UIKit

class ThrowBall: UIViewController {
    var ball: UIImageView?
    var vX: Double = 0.0
    var vY: Double = 0.0
    var width: Double = 0.0
    var height: Double = 0.0
    var R = 32.0 //radius of ball
    var timer: NSTimer?
    override func loadView() {
        super.loadView()
        self.edgesForExtendedLayout = UIRectEdge.None
        self.view.backgroundColor = UIColor.whiteColor()
        let size = self.view.bounds.size
        width = Double(size.width)
        height = Double(size.height) - 60
        ball = UIImageView(image: UIImage(named: "football.png"))
        ball?.center = CGPoint(x: 32, y: 100)
        self.view.addSubview(ball!)
        ball!.multipleTouchEnabled = true
        ball!.userInteractionEnabled = true
        let pan = UIPanGestureRecognizer(target: self, action: "panIt:")
        ball?.addGestureRecognizer(pan)
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "loop:", userInfo: nil, repeats: true)
        timer?.fire()
    }
    
    func panIt(pan: UIPanGestureRecognizer) {
        if (pan.state == UIGestureRecognizerState.Began || pan.state == UIGestureRecognizerState.Changed) {
            let velocity = pan.velocityInView(self.view)
            vX += Double(velocity.x) * 5 / width
            vY += Double(velocity.y) * 5 / height
        }
    }
    
    func loop(timer: NSTimer) {
        var x1 = Double(ball!.center.x) + vX
        var y1 = Double(ball!.center.y) + vY
        
        if x1 < R {
            x1 = R
            vX = -vX
        }
        if x1 > width - R {
            x1 = width - R
            vX = -vX
        }
        
        if y1 < R {
            y1 = R
            vY = -vY
        }
        if y1 > height - R {
            y1 = height - R
            vY = -vY
        }
        ball!.center = CGPoint(x: x1, y: y1)
        
        
        //Add some friction
        vX = 0.9 * vX
        vY = 0.9 * vY
    }
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        timer?.invalidate()
        timer = nil
    }
}

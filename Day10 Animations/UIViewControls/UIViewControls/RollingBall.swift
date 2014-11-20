//
//  RollingBall.swift
//  UIViewControls
//
//  Created by Trinh Minh Cuong on 9/29/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class RollingBall: UIViewController {
    var center: CGPoint?
    var _timer: NSTimer?
    var _alpha: CGFloat = 0.0
    var _deltaAlpha: CGFloat = 0.1
    var _x: CGFloat = 0.0
    var _y: CGFloat = 0.0
    var ball: UIImageView?
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = UIColor.whiteColor()
        self.edgesForExtendedLayout = UIRectEdge.None
        
        let size: CGSize = self.view.bounds.size
        center = CGPointMake(size.width / 6.0, size.height / 2.0)
        
        ball = UIImageView(image: UIImage(named: "football.png"))
        ball?.center = center!
        
        let button = UIButton(frame: CGRect(x: 150, y: 0, width: 100, height: 40))
        button.backgroundColor = UIColor.grayColor()
        button.setTitle("Roll", forState: UIControlState.Normal)
        button.addTarget(self, action: "RollingBall:", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(ball!)
        self.view.addSubview(button)
    }
    func RollingBall(button: UIButton) {
        _x = self.ball!.center.x
        _y = self.ball!.center.y
        
        self._timer = NSTimer.scheduledTimerWithTimeInterval(0.05, target: self, selector: "animateBall:", userInfo: nil, repeats: true)
        self._timer?.fire()
        
    }
    
    func animateBall(timer: NSTimer) {
        _alpha += _deltaAlpha
        //Chuyển quay tròn quanh tâm
        self.ball?.transform = CGAffineTransformMakeRotation(_alpha)
        
        
        //Tính toán
        _x += 32 * _deltaAlpha //R * _deltaAlpha. R bán kính của bóng

        //Chuyển động tịnh tiến
        self.ball?.center = CGPoint(x:_x, y:_y)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        _timer?.invalidate()
        _timer = nil
    }
}

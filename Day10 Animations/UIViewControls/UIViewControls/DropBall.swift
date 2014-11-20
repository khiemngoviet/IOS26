//
//  DropBall.swift
//  UIViewControls
//
//  Created by Trinh Minh Cuong on 9/29/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class DropBall: UIViewController {
    var _timer: NSTimer?
    var ball: UIImageView?
    var x: Double = 0.0
    var y: Double = 0.0
    var velY: Double = 0.0
    var accY: Double = 4.0
    let R = 32.0
    var maxHeight: Double = 0.0
    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = UIColor.whiteColor()
        self.edgesForExtendedLayout = UIRectEdge.None
        x = Double(self.view.bounds.size.width) * 0.5
        y = R
        maxHeight = Double(self.view.bounds.size.height) - R - 60
        ball = UIImageView(image: UIImage(named: "football.png"))
        ball?.center = CGPoint(x: x, y: y)
        self.view.addSubview(ball!)
        self._timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "dropBall", userInfo: nil, repeats: true)
        self._timer?.fire()
    }
    
    func dropBall() {
        velY += accY  //vận tốc tại từng thời điểm = vận tốc trước đó + gia tốc
        y += velY     //toạ độ (quãng đường) được cộng thêm vận tốc
        if y > maxHeight {
            velY = -velY * 0.9
            y = maxHeight
        }
        ball?.center = CGPoint(x: x, y: y)
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        _timer?.invalidate()
        _timer = nil
    }

}

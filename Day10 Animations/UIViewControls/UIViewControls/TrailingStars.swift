//
//  TrailingStars.swift
//  UIViewControls
//
//  Created by Trinh Minh Cuong on 9/29/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class TrailingStars: UIViewController {
    var _timer: NSTimer?
    var _alpha: Double = 0.0
    var red, violet, brown, green: UIImageView?
    var x: Double = 0.0
    var x1: Double = 0.0
    var x2: Double = 0.0
    var x3: Double = 0.0
    var y: Double = 0.0
    var y1: Double = 0.0
    var y2: Double = 0.0
    var y3: Double = 0.0
    

    var step: Int = 0
    var max_height: Double = 0.0
 
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = UIColor.whiteColor()
        self.edgesForExtendedLayout = UIRectEdge.None
        
        red = UIImageView(image: UIImage(named: "red.png"))
        violet = UIImageView(image: UIImage(named: "violet.png"))
        brown = UIImageView(image: UIImage(named: "brown.png"))
        green = UIImageView(image: UIImage(named: "green.png"))
  
        max_height = Double(self.view.bounds.size.width) * 0.5;
        computePos()
        self.view.addSubview(red!)
        self.view.addSubview(violet!)
        self.view.addSubview(brown!)
        self.view.addSubview(green!)
        
        self._timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "animateStar:", userInfo: nil, repeats: true)
        self._timer?.fire()
    }
    
    func computePos() {
        x = self.scaleSin(y)
        self.red!.center = CGPoint(x: x, y: y)
        y += 4
        
        y1 = y - 20
        x1 = self.scaleSin(y1)
        self.green!.center = CGPoint(x: x1, y: y1)
        
        y2 = y1 - 20
        x2 = self.scaleSin(y2)
        self.violet!.center = CGPoint(x: x2, y: y2)
        
        y3 = y2 - 20
        x3 = self.scaleSin(y3)
        self.brown!.center = CGPoint(x: x3, y: y3)
    }
    func animateStar(timer: NSTimer) {
        computePos()
        if y3 > Double(self.view.bounds.size.height) {
            y = 0
        }
    }
    
    func scaleSin(input: Double) -> Double {
        return max_height + (max_height - 10) * sin(input * M_PI / max_height)
    }
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        _timer?.invalidate()
        _timer = nil
    }
    


}


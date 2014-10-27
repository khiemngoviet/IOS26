//
//  DemoTap.swift
//  GestureRecognizer
//
//  Created by Trinh Minh Cuong on 10/3/14.
//  Copyright (c) 2014 Techmaster Vietnam. All rights reserved.
//

import UIKit

class DemoTap: UIViewController {
    var grass: UIImageView?
    
    var timer:NSTimer!
    
    
    override func loadView() {
        super.loadView()
        self.edgesForExtendedLayout = UIRectEdge.None
        grass = UIImageView(frame: self.view.bounds)
        grass?.image = UIImage(named: "grass.png")
        self.view.addSubview(grass!)
        self.createAnt()
        timer = NSTimer.scheduledTimerWithTimeInterval(0.7, target: self, selector: "generateAnt:", userInfo: nil, repeats: true)
        timer.fire()
    }
    
    func createAnt(){
        let random = arc4random_uniform(20)
        let ratio = CGFloat(random) / 10
        var antView = UIImageView(image: UIImage(named: "free-ant-icon-download.png"))
        antView.bounds = CGRect(x: 0, y: 0, width: 50, height: 50)
        antView.center = CGPoint(x: self.view.bounds.size.width * ratio, y: self.view.bounds.size.height * ratio)
        antView.contentMode = UIViewContentMode.ScaleAspectFit
        antView.multipleTouchEnabled = true
        antView.userInteractionEnabled = true
        self.view.addSubview(antView)
        
        let tap = UITapGestureRecognizer(target: self, action: "onTap:")
        antView.addGestureRecognizer(tap)
        
        let pan = UIPanGestureRecognizer(target: self, action: "onPan:")
        antView.addGestureRecognizer(pan)
        
    }
    
    func generateAnt(sender: NSTimer){
        createAnt()
    }
    
    func onPan(pan: UIPanGestureRecognizer) {
        if (pan.state == UIGestureRecognizerState.Began || pan.state == UIGestureRecognizerState.Changed) {
            var antView = pan.view as UIImageView
            antView.center = pan.locationInView(self.view)
        }
    }
    
    
    func onTap (tap: UITapGestureRecognizer) {
        let point = tap.locationInView(self.view)
        var antView = tap.view as UIImageView
        antView.image = UIImage(named: "fireworks-red-icon.png")
    }
}

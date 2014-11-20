//
//  Mario.swift
//  UIViewControls
//
//  Created by Trinh Minh Cuong on 9/29/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class Mario: UIViewController {
    var mario: UIImageView?
    var city1, city2, city3, city4: UIImageView?
    var _timer: NSTimer?
    var viewHeight: Double = 0.0
    var moveX = 20
    let cityWidth: Double = 1498
    let cityHeight: Double = 400
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = UIColor.whiteColor()
        self.edgesForExtendedLayout = UIRectEdge.None
        let viewSize = self.view.bounds.size
        viewHeight = Double(viewSize.height) - 60
        
        
        city1 = UIImageView(frame: CGRect(x: 0, y: viewHeight - cityHeight, width: cityWidth, height: cityHeight))
        city1!.image = UIImage(named: "city1.png")
        self.view.addSubview(city1!)
       /*
        city2 = UIImageView(frame: CGRect(x: cityWidth, y: viewHeight - cityHeight, width: cityWidth, height: cityHeight))
        city2!.image = UIImage(named: "city2.png")
        self.view.addSubview(city2!)
        
        city3 = UIImageView(frame: CGRect(x: cityWidth * 2, y: viewHeight - cityHeight, width: cityWidth, height: cityHeight))
        city3!.image = UIImage(named: "city3.png")
        self.view.addSubview(city3!) */
        
        city4 = UIImageView(frame: CGRect(x: cityWidth, y: viewHeight - cityHeight, width: cityWidth, height: cityHeight))
        city4!.image = UIImage(named: "city1.png")
        self.view.addSubview(city4!)

        
        mario = UIImageView(frame: CGRect(x: 0, y: 0, width: 65, height: 102))
        mario?.center = CGPoint(x: viewSize.width * 0.5, y: CGFloat(viewHeight) - 10 - mario!.bounds.size.height * 0.5)
        mario!.userInteractionEnabled = true
        mario!.multipleTouchEnabled = true
        mario!.animationImages = [
            UIImage(named: "1.png")!,
            UIImage(named: "2.png")!,
            UIImage(named: "3.png")!,
            UIImage(named: "4.png")!,
            UIImage(named: "5.png")!,
            UIImage(named: "6.png")!,
            UIImage(named: "7.png")!,
            UIImage(named: "8.png")!
        ]

        mario!.animationDuration = 1.0
        self.view.addSubview(mario!)
        mario!.startAnimating()
        
        let tap = UITapGestureRecognizer(target: self, action: "tapOnMario")
        mario!.addGestureRecognizer(tap)
        
        self._timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "runCity", userInfo: nil, repeats: true)
        self._timer?.fire()
    }
    
    func runCity() {
        city1!.center = CGPoint(x: city1!.center.x - CGFloat(moveX), y: city1!.center.y)
       /* city2!.center = CGPoint(x: city2!.center.x - CGFloat(moveX), y: city2!.center.y)
        city3!.center = CGPoint(x: city3!.center.x - CGFloat(moveX), y: city3!.center.y) */
        city4!.center = CGPoint(x: city4!.center.x - CGFloat(moveX), y: city4!.center.y)
        
        if city1!.frame.origin.x + CGFloat(cityWidth) < 0 {
            city1!.frame = CGRect(x: Double(city4!.frame.origin.x) + cityWidth, y: Double(city1!.frame.origin.y), width: cityWidth, height: cityHeight)
            println("move 1")
        }
        if city4!.frame.origin.x + CGFloat(cityWidth) < 0 {
            city4!.frame = CGRect(x: Double(city1!.frame.origin.x) + cityWidth, y: Double(city1!.frame.origin.y), width: cityWidth, height: cityHeight)
            println("move 2")
        }
        
    }
    
    
    func tapOnSomething() {
        println("Viec lap trinh tro nen cool hon bao gio het")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        _timer?.invalidate()
        _timer = nil
    }
}

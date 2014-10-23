//
//  ViewBasic.swift
//  UIViewControls
//
//  Created by Trinh Minh Cuong on 10/20/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class ViewBasic: UIViewController {

    var redView : UIView?
    var sliderX: UISlider?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        //self.edgesForExtendedLayout = UIRectEdge.None //Nếu có lệnh này thì đẩy khung toạ độ (0,0) xuống dưới đáy của
        //navigation bar. Vấn đề đổi toạ độ gốc xuất hiện từ IOS 7
        //Nếu không có lệnh này thì với màn hình có status bar + navigation bar để y từ 64 thì sẽ không bị che lấp
        
        let bound = self.view.bounds
        println("x = \(bound.origin.x), y = \(bound.origin.y), width = \(bound.size.width), height = \(bound.size.height)")
        
        let frame = self.view.frame
        println("x = \(frame.origin.x), y = \(frame.origin.y), width = \(frame.size.width), height = \(frame.size.height)")
        
        redView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        redView!.backgroundColor = UIColor.redColor()
        redView!.center = CGPoint(x: 10, y: bound.size.height * 0.5)
        println("cx = \(redView!.center.x), cy = \(redView!.center.y)")
        redView!.layer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        self.view.addSubview(redView!)
        
        let bound2 = redView!.bounds
        println("x = \(bound2.origin.x), y = \(bound2.origin.y), width = \(bound2.size.width), height = \(bound2.size.height)")
        
        let frame2 = redView!.frame
        println("x = \(frame2.origin.x), y = \(frame2.origin.y), width = \(frame2.size.width), height = \(frame2.size.height)")
        println("cx = \(redView!.center.x), cy = \(redView!.center.y)")
        
        
        let slider = UISlider(frame: CGRect(x: 10, y: 100, width: 300, height: 40))
        slider.addTarget(self, action: "onSliderChange:", forControlEvents: UIControlEvents.ValueChanged)
        self.view.addSubview(slider)
        
    }
    func onSliderChange(slider: UISlider) {
        redView!.transform = CGAffineTransformMakeRotation(CGFloat(2.0 * M_PI * Double(slider.value)))
        println("cx = \(redView!.center.x), cy = \(redView!.center.y)")
        let frame = redView!.frame
        println("x = \(frame.origin.x), y = \(frame.origin.y), width = \(frame.size.width), height = \(frame.size.height)")

        
    }

}

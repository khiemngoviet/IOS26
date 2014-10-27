//
//  RatingVC.swift
//  UIViewControls
//
//  Created by Khiem Ngo Viet on 10/27/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class RatingVC: UIViewController {

    var ratingView: RatingView!
    var slider:UISlider!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        ratingView = RatingView(frame: CGRect(x: 99, y: 165, width: 50, height: 32))
        ratingView.contentMode = UIViewContentMode.Center
        ratingView.image = UIImage(named: "5star.png")
        self.view.addSubview(ratingView)
        
        slider = UISlider()
        slider.bounds = CGRect(x: 0, y: 0, width: self.view.bounds.size.width * 0.7, height: 30)
        slider.center = CGPoint(x: self.view.bounds.size.width * 0.5, y: self.view.bounds.size.height * 0.9)
        slider.minimumValue = 0
        slider.maximumValue = 5
        slider.value = 2.5
        slider.addTarget(self, action: "onSliderValueChanged:", forControlEvents: UIControlEvents.ValueChanged)
        self.view.addSubview(slider)
    }
    
    func onSliderValueChanged(sender :UISlider){
       ratingView.value = CGFloat(sender.value)
    }

    

}

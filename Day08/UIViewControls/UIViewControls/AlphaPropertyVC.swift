//
//  AlphaPropertyVC.swift
//  UIViewControls
//
//  Created by Khiem Ngo Viet on 10/26/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class AlphaPropertyVC: UIViewController {

    var coolGirl:UIImageView!
    var alphaSlider:UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.coolGirl = UIImageView(image: UIImage(named: "girlA.jpg"))
        self.coolGirl.bounds = CGRect(x: 0, y: 0, width: self.view.bounds.size.width - 40, height: self.view.bounds.size.height - 200)
        self.coolGirl.contentMode = UIViewContentMode.ScaleAspectFit
        self.coolGirl.center = CGPoint(x: self.view.bounds.size.width * 0.5, y: self.view.bounds.size.height * 0.5)
        self.view.addSubview(coolGirl)
        
        alphaSlider = UISlider()
        alphaSlider.bounds = CGRect(x: 0, y: 0, width: self.view.bounds.size.width * 0.7, height: 30)
        alphaSlider.center = CGPoint(x: self.view.bounds.size.width * 0.5, y: self.view.bounds.size.height * 0.9)
        alphaSlider.minimumValue = 0
        alphaSlider.maximumValue = 1.0
        alphaSlider.value = 1.0
        alphaSlider.addTarget(self, action: "onSliderValueChanged:", forControlEvents: UIControlEvents.ValueChanged)
        self.view.addSubview(alphaSlider)
    }

    func onSliderValueChanged(sender :UISlider){
        self.coolGirl.alpha = CGFloat(sender.value)
    }

}

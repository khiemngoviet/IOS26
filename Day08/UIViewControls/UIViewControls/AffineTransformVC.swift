//
//  AffineTransformVC.swift
//  UIViewControls
//
//  Created by Khiem Ngo Viet on 10/27/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class AffineTransformVC: UIViewController {

     var cat: UIImageView!
     var rorateSlider:UISlider!
     var scaleSlider:UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.cat = UIImageView(image: UIImage(named: "cat_grumpy.png"))
        self.cat.bounds = CGRect(x: 0, y: 0, width: self.view.bounds.size.width - 40, height: self.view.bounds.size.height - 200)
        self.cat.contentMode = UIViewContentMode.ScaleAspectFit
        self.cat.center = CGPoint(x: self.view.bounds.size.width * 0.5, y: self.view.bounds.size.height * 0.5)
        self.view.addSubview(cat)
        
        rorateSlider = UISlider()
        rorateSlider.bounds = CGRect(x: 0, y: 0, width: self.view.bounds.size.width * 0.7, height: 30)
        rorateSlider.center = CGPoint(x: self.view.bounds.size.width * 0.5, y: self.view.bounds.size.height * 0.8)
        rorateSlider.minimumValue = 0
        rorateSlider.maximumValue = 1.0
        rorateSlider.addTarget(self, action: "onRotateValueChanged:", forControlEvents: UIControlEvents.ValueChanged)
        self.view.addSubview(rorateSlider)
        
        scaleSlider = UISlider()
        scaleSlider.bounds = CGRect(x: 0, y: 0, width: self.view.bounds.size.width * 0.7, height: 30)
        scaleSlider.center = CGPoint(x: self.view.bounds.size.width * 0.5, y: self.view.bounds.size.height * 0.9)
        scaleSlider.minimumValue = 0
        scaleSlider.maximumValue = 1.0
        scaleSlider.value = 0.25
        scaleSlider.addTarget(self, action: "onScaleValueChanged:", forControlEvents: UIControlEvents.ValueChanged)
        self.view.addSubview(scaleSlider)
    }
    
    func onRotateValueChanged(sender :UISlider){
        self.rotateAndScale()
    }
    
    func onScaleValueChanged(sender :UISlider){
        self.rotateAndScale()
    }

    func rotateAndScale(){
        let scaleRatio = CGFloat( self.scaleSlider.value * 4)
        self.cat.transform = CGAffineTransformConcat(CGAffineTransformMakeRotation(CGFloat(M_PI) * CGFloat(self.rorateSlider.value)),
               CGAffineTransformMakeScale(scaleRatio, scaleRatio))
    }

}

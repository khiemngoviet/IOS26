//
//  ViewBasic2.swift
//  UIViewControls
//
//  Created by Trinh Minh Cuong on 10/23/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class ViewBasic2: UIViewController {

    var redView: UIView?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        redView = UIView(frame: CGRect(x: 10, y: 100, width: 150, height: 50))
        redView!.backgroundColor = UIColor.redColor()
        self.view.addSubview(redView!)
        
        let slider = UISlider(frame: CGRect(x: 10, y: 150, width: self.view.bounds.size.width - 20, height: 30))
        slider.addTarget(self, action: "onSliderChange:", forControlEvents: UIControlEvents.ValueChanged)
        slider.value = 0.5
        slider.minimumValue = 0.1
        slider.maximumValue = 1
        self.view.addSubview(slider)
        
    }
    
    func onSliderChange(sender: UISlider) {
        let size = redView!.bounds.size
        
        //Đổi được bounds
        redView!.bounds = CGRect(x: 0, y: 0, width: size.width * CGFloat(sender.value) * 2.0, height: size.height)
        //Bound đổi center không đổi, kích thước UIView đổi
        //Frame đổi, center đổi
        //UIView quay, bounds không đổi, center không đổi --> Frame thay đổi
        
        
    }


}

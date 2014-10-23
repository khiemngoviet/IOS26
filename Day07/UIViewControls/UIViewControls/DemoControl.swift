//
//  DemoControl.swift
//  UIViewControls
//
//  Created by techmaster on 9/19/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class DemoControl: UIViewController, UITextFieldDelegate {
    var label: UILabel?
    var girl: UIImageView?
    var slider: UISlider?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func loadView() {
        super.loadView()
        self.view.backgroundColor = UIColor.whiteColor()
        self.edgesForExtendedLayout = UIRectEdge.None
        label = UILabel(frame: CGRect(x: 10, y: 0, width: 100, height: 40))
        label!.text = "Hello World"
        label!.backgroundColor = UIColor.magentaColor()
        label!.textAlignment = NSTextAlignment.Center
        //label.transform = CGAffineTransformMakeScale(2, 2)
        self.view.addSubview(label!)
        
        let txtName = UITextField(frame: CGRect(x: 10, y: 60, width: 200, height: 40))
        txtName.placeholder = "Enter your name"
        txtName.borderStyle = UITextBorderStyle.Line
        txtName.delegate = self
        //txtName.keyboardType = UIKeyboardType.WebSearch
        self.view.addSubview(txtName)
        
        //Switch button
        let airplaneMode = UISwitch()
        airplaneMode.center = CGPoint(x: 150, y: 150)
        airplaneMode.addTarget(self, action: "airplaneModeChange:", forControlEvents: UIControlEvents.ValueChanged)
        self.view.addSubview(airplaneMode)
        
        //Slider 
        
        slider = UISlider(frame: CGRect(x: 10, y: 200, width: 200, height: 40))
        slider!.addTarget(self, action: "onSliderChange:", forControlEvents: UIControlEvents.ValueChanged)
        self.view.addSubview(slider!)
        
        //UIImageView
        girl = UIImageView(frame: CGRect(x: 10, y: 240, width: 200, height: 200))
        girl!.image = UIImage(named: "beauty.jpg")
        self.view.addSubview(girl!)
        slider!.value = Float(girl!.alpha)
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField.isFirstResponder() {
            textField.resignFirstResponder()
        }
        return true
    }
    
    func airplaneModeChange(switchButton: UISwitch) {
        if switchButton.on {
            label!.text = "On"
        } else {
            label!.text = "Off"
        }
    }
    
    func onSliderChange(slider: UISlider) {
        label?.text = String(format: "%1.2f", slider.value)
        girl!.alpha = CGFloat(slider.value)
    }
}

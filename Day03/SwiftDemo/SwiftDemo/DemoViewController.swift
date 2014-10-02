//
//  DemoViewController.swift
//  SwiftDemo
//
//  Created by ios26 on 9/29/14.
//  Copyright (c) 2014 Techmaster Vietnam. All rights reserved.
//

import UIKit

class DemoViewController: UIViewController {

    @IBOutlet weak var textInput: UITextField!
    var value:Int = 1
    
    @IBOutlet weak var sliderLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

   //5 = 1*2*3*4*5
    

    @IBAction func onCalculateTouched(sender: UIButton) {
        value = 1
        let input: Int = textInput.text.toInt()!
        calculateFactorial(input)
        let alert = UIAlertView(title: "", message: "\(value)", delegate: nil, cancelButtonTitle: "Ok")
        alert.show()
    }
    
    
    func calculateFactorial(input: Int) {
        if input != 1 {
            value = value * input
           let child = input - 1
            calculateFactorial(child)
        }
    }

    @IBAction func onSliderValueChanged(sender: UISlider) {
        let strValue = NSString(format: "%3.2f", sender.value)
        sliderLabel.text = "\(strValue)"
    }
    
}

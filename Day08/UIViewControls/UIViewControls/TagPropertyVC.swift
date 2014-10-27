//
//  TagPropertyVC.swift
//  UIViewControls
//
//  Created by Khiem Ngo Viet on 10/27/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class TagPropertyVC: UIViewController {
    
    var buttonWidth:CGFloat!
    var y: CGFloat = 130
    let buttonLabel = ["AC","+/-","%","/","7","8","9","X","4","5","6","-","1","2","3","+","0", "0",",","="]
    let buttons = [UIButton]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let maxWidth = self.view.bounds.size.width
        buttonWidth = (maxWidth - 15) / 4.0
        
        var resultLabel = UILabel(frame: CGRect(x: 0, y: 64, width: self.view.bounds.size.width, height: 60))
        resultLabel.text = "0"
        resultLabel.textAlignment = NSTextAlignment.Right
        resultLabel.font = UIFont(name: resultLabel.font.fontName, size: 50)
        resultLabel.textColor = UIColor.whiteColor()
        self.view.addSubview(resultLabel)
        
        let offset: CGFloat = 3
        for i in 0 ... 4 {
            for j in 0 ... 3{
                var button:UIButton!
                if i == 4 && j == 0{
                    button = UIButton(frame:  CGRect( x: buttonWidth * CGFloat(j) + offset*CGFloat((j+1)), y: y + offset*CGFloat((i)), width: buttonWidth*2 + offset, height: buttonWidth))
                    button.setTitle("0", forState: UIControlState.Normal)
                }
                else if i == 4 && j == 1{
                    continue
                }
                else{
                    button = UIButton(frame:  CGRect( x: buttonWidth * CGFloat(j) + offset*CGFloat((j+1)), y: y + offset*CGFloat((i)), width: buttonWidth, height: buttonWidth))
                    
                }
                if j == 3{
                    button.backgroundColor = UIColor.orangeColor()
                }
                else{
                    button.backgroundColor = UIColor.whiteColor()
                    button.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
                }
                button.setTitle(buttonLabel[i*4 + j], forState: UIControlState.Normal)
                button.tag = i*4 + j
                self.view.addSubview(button)
            }
            y  += buttonWidth
        }
        
        let buttonWithTag0 = self.view.viewWithTag(0)
        let buttonWithTag1 = self.view.viewWithTag(1)
    }
    
    
    
}

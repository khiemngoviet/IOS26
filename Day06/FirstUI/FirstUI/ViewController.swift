//
//  ViewController.swift
//  FirstUI
//
//  Created by Trinh Minh Cuong on 10/16/14.
//  Copyright (c) 2014 Techmaster Vietnam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var helloHell: UILabel!
    var button: UIButton?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.grayColor()
        let maxWidth = self.view.bounds.size.width
        let chessWidth: CGFloat = (maxWidth - 20.0) / 8.0
        
        var y: CGFloat = 20.0
        for k in 0...7 {
            for i in 0...7 {
                
                let square = UIView(frame: CGRect(x: chessWidth * CGFloat(i) + 10.0, y: y, width: chessWidth, height: chessWidth))
                
                if (i + k) % 2 == 0 {
                    square.backgroundColor = UIColor.whiteColor()
                } else {
                    square.backgroundColor = UIColor.blackColor()
                }
                self.view.addSubview(square)
            }
            y  += chessWidth
        }
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    /*func tapMe() {
    println("Cool")
    button!.removeFromSuperview()
    }*/
    
    
}


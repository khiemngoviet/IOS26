//
//  ViewController.swift
//  FirstUI
//
//  Created by Trinh Minh Cuong on 10/16/14.
//  Copyright (c) 2014 Techmaster Vietnam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var chessWidth: CGFloat!
    var timer:NSTimer?
    var index = 2
    var x:CGFloat = 10.0
    var y: CGFloat = 50.0
    var queenImageView:UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.grayColor()
        let maxWidth = self.view.bounds.size.width
        chessWidth = (maxWidth - 20.0) / 8.0
        
        for k in 0...7 {
            for i in 0...7 {
                
                let square = UIView(frame: CGRect(x: chessWidth * CGFloat(i) + x, y: y, width: chessWidth, height: chessWidth))
                
                if (i + k) % 2 == 0 {
                    square.backgroundColor = UIColor.whiteColor()
                } else {
                    square.backgroundColor = UIColor.blackColor()
                }
                self.view.addSubview(square)
            }
            y  += chessWidth
        }
        y = 50.0
        self.queenImageView = UIImageView(frame: CGRect(x: x, y: y, width: chessWidth, height: chessWidth))
        self.queenImageView.image = UIImage(named: "Queen.png")
        self.queenImageView.contentMode = UIViewContentMode.ScaleAspectFit
        self.view.addSubview(self.queenImageView)
    }
    
    func update(){
        if index <= 8 {
            y  += chessWidth
            var frame = self.queenImageView.frame
            frame.origin.x = chessWidth * CGFloat(index - 1) + 10.0
            frame.origin.y = CGFloat(y)
            self.queenImageView.frame = frame
            index++
        }
        else{
            index = 2
            y = 50.0
            timer?.invalidate()
        }
    }
    
    @IBAction func onStart(sender: UIButton) {
        self.queenImageView.frame = CGRect(x: x, y: y, width: chessWidth, height: chessWidth)
        timer = NSTimer.scheduledTimerWithTimeInterval(0.6, target: self, selector: "update", userInfo: nil, repeats: true)
    }
    
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    
    
}


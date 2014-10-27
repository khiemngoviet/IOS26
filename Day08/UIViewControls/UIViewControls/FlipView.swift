//
//  FlipView.swift
//  UIViewControls
//
//  Created by Khiem Ngo Viet on 10/27/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class FlipView: UIView {

    var frontView: UIImageView!
    var backView: UIImageView!
    var backupView: UIImageView!
    var isFrontFace: Bool!

    
    override init(frame: CGRect) {
        super.init(frame: frame)
 
        var tapA = UITapGestureRecognizer(target: self, action: "flip:")
        self.addGestureRecognizer(tapA)
        
        frontView = UIImageView(image: UIImage(named: "girlA.jpg"))
        frontView.frame = self.bounds
        self.addSubview(frontView)
        
        backView = UIImageView(image: UIImage(named: "girlB.jpg"))
        backView.frame = self.bounds;
        isFrontFace = true;
        
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    func flip(gesture:UITapGestureRecognizer){
        if isFrontFace == true {
            UIView.transitionWithView(self, duration: 1, options: UIViewAnimationOptions.TransitionFlipFromTop, animations: {
                self.addSubview(self.backView)
                self.backupView = self.frontView
                self.frontView.removeFromSuperview()
                }, completion: { (fininshed: Bool) -> () in
                    self.isFrontFace = false
            })
        } else {
            UIView.transitionWithView(self, duration: 1, options: UIViewAnimationOptions.TransitionCurlUp, animations: {
                self.addSubview(self.backupView)
                self.backupView = self.backView
                self.backView.removeFromSuperview()
                }, completion: { (fininshed: Bool) -> () in
                    self.isFrontFace = true
            })
        }
    }
    
}

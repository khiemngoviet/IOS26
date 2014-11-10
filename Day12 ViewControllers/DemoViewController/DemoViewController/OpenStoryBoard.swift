//
//  OpenStoryBoard.swift
//  DemoViewController
//
//  Created by cuong minh on 10/28/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class OpenStoryBoard: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        
        let button = UIButton()
        button.backgroundColor = UIColor.grayColor()
        button.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        self.view.addSubview(button)
        button.setTitle("Open Story Board", forState: UIControlState.Normal)
        button.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.view.addConstraint(NSLayoutConstraint(item: button, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0))
        
        //Căn giữa trục Y - trục tung
        self.view.addConstraint(NSLayoutConstraint(item: button, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 0))

        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[button(30)]", options: NSLayoutFormatOptions.allZeros, metrics: nil, views: ["button": button]))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:[button(160)]", options: NSLayoutFormatOptions.allZeros, metrics: nil, views: ["button": button]))
        
        button.addTarget(self, action: "onTap", forControlEvents: UIControlEvents.TouchUpInside)
        //Go thu cuc nhanh xem he thong co capture kong nhe.
        
        //Day la phan mem kha on minh da tung chung kien
        //Goerwrewrew
    }
    
    func onTap() {
        let storyBoard = UIStoryboard(name: "FunStoryBoard", bundle: nil)
        let helloWorldVC: AnyObject! = storyBoard.instantiateViewControllerWithIdentifier("HelloWorld")
       /* self.presentViewController(helloWorldVC as UIViewController, animated: true) { () -> Void in
            println("After present view controller successfully")
        }*/
        
        self.presentViewController(helloWorldVC as UIViewController, animated: true, completion: nil)
        
    }

    
}

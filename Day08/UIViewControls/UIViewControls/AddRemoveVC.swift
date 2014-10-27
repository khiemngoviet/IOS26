//
//  AddRemoveVC.swift
//  UIViewControls
//
//  Created by Khiem Ngo Viet on 10/26/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class AddRemoveVC: UIViewController {

    var currentTopView:UIView!
    var currentGrayColor:CGFloat = 1.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.currentTopView = self.view
        var addButton: UIButton = UIButton.buttonWithType(UIButtonType.System) as UIButton
        addButton.frame = CGRect(x: 10, y: self.view.bounds.size.height * 0.9, width: 100, height: 30)
        addButton.setTitle("Add View", forState: UIControlState.Normal)
        addButton.addTarget(self, action: "onAddViewTouched:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(addButton)
        
        var removeButton: UIButton = UIButton.buttonWithType(UIButtonType.System) as UIButton
        removeButton.frame = CGRect(x: self.view.bounds.size.width * 0.65, y: self.view.bounds.size.height * 0.9, width: 100, height: 30)
        removeButton.setTitle("Remove View", forState: UIControlState.Normal)
        removeButton.addTarget(self, action: "onRemoveViewTouched:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(removeButton)
    }
    
    func onAddViewTouched(sender:UIButton){
        if currentTopView.bounds.size.width < 40{
            return
        }
        let width = currentTopView.bounds.size.width - 20
        var childView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: width))
        childView.backgroundColor = UIColor(red: currentGrayColor, green: currentGrayColor, blue: currentGrayColor, alpha: 1.0)
        currentTopView.addSubview(childView)
        childView.center = CGPointMake(currentTopView.bounds.size.width * 0.5, currentTopView.bounds.size.height * 0.5)
        currentGrayColor -= 0.1
        currentTopView = childView
    }
    
    func onRemoveViewTouched(sender:UIButton){
        var tobeRemovedView = currentTopView
        if tobeRemovedView != self.view{
            currentTopView = currentTopView.superview
            tobeRemovedView.removeFromSuperview()
            currentGrayColor += 0.1
        }
    }


    

}

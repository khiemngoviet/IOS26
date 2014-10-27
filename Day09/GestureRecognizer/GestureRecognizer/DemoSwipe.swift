//
//  DemoSwipe.swift
//  GestureRecognizer
//
//  Created by Trinh Minh Cuong on 10/3/14.
//  Copyright (c) 2014 Techmaster Vietnam. All rights reserved.
//

import UIKit

class DemoSwipe: UIViewController {
    var door: UIImageView?
    override func loadView() {
        super.loadView()
        self.edgesForExtendedLayout = UIRectEdge.None
        self.view.backgroundColor = UIColor.whiteColor()
        door = UIImageView(image: UIImage(named: "exit.png"))
        
        let size = self.view.bounds.size
        door?.center = CGPoint(x: size.width * 0.5, y: (size.height - 60) * 0.5)
        self.view.addSubview(door!)
        door!.multipleTouchEnabled = true
        door!.userInteractionEnabled = true
        let swipeRight = UISwipeGestureRecognizer(target: self, action: "onSwipe:")
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        
        door!.addGestureRecognizer(swipeRight)
    }
    
    func onSwipe(swipe: UISwipeGestureRecognizer) {
       // if swipe.state == UIGestureRecognizerState.Began {
            UIView.animateWithDuration(0.5, animations: { () -> Void in
               self.door!.alpha = 0.0
            }, completion: nil)
      //  }
    }
   

}

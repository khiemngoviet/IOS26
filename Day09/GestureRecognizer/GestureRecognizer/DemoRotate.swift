//
//  DemoRotate.swift
//  GestureRecognizer
//
//  Created by Trinh Minh Cuong on 10/3/14.
//  Copyright (c) 2014 Techmaster Vietnam. All rights reserved.
//

import UIKit

class DemoRotate: UIViewController {
    var dial: UIImageView?
    override func loadView() {
        super.loadView()
        self.edgesForExtendedLayout = UIRectEdge.None
        self.view.backgroundColor = UIColor.whiteColor()
        dial = UIImageView(image: UIImage(named: "dial.png"))
        let size = self.view.bounds.size
        dial?.center = CGPoint(x: size.width * 0.5, y: (size.height - 60) * 0.5)

        self.view.addSubview(dial!)
        dial!.multipleTouchEnabled = true
        dial!.userInteractionEnabled = true
        let rotate = UIRotationGestureRecognizer(target: self, action: "onRotate:")
        dial?.addGestureRecognizer(rotate)
    }
    
    func onRotate(rotate: UIRotationGestureRecognizer) {
        dial?.transform = CGAffineTransformMakeRotation(rotate.rotation)
    }
}

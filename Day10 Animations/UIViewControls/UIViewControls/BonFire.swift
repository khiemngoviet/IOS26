//
//  BonFire.swift
//  UIViewControls
//
//  Created by techmaster on 9/19/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class BonFire: UIViewController {

    var fire : UIImageView?
    override func viewDidLoad() {
        super.viewDidLoad()
        fire!.startAnimating()
    }
    
    override func loadView() {
        super.loadView()
       self.view.backgroundColor = UIColor.blackColor()
       self.edgesForExtendedLayout = UIRectEdge.None
       fire = UIImageView(frame: CGRect(x: 0, y: 0, width: 320, height: 480))
        fire?.center = CGPoint(x: self.view.bounds.size.width * 0.5, y: self.view.bounds.size.height * 0.5)
        var images: [UIImage] = [UIImage]()
        for i in 1...17 {
            var fileName: String
            if i < 10 {
                fileName = "campFire0\(i).gif"
            } else {
                fileName = "campFire\(i).gif"
            }
            images.append(UIImage(named: fileName)!)
        }
        fire!.animationImages = images
        fire!.animationDuration = 1
        fire!.animationRepeatCount = 100
        self.view.addSubview(fire!)
    }


}

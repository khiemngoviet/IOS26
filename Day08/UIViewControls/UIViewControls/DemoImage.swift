//
//  DemoImage.swift
//  UIViewControls
//
//  Created by Trinh Minh Cuong on 10/23/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class DemoImage: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        let photoView = UIImageView(image: UIImage(named: "playboy.jpg"))
        photoView.frame = self.view.bounds
        photoView.contentMode = UIViewContentMode.ScaleToFill
        photoView.userInteractionEnabled = true //cho người dùng tương tác
        photoView.multipleTouchEnabled = true //giảm tốc độ, nhưng cho phép ảnh nhận tương tác đa chạm
        
        photoView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "onPhotoTapped:"))
        self.view.addSubview(photoView)
    }
    
    func onPhotoTapped(tap: UITapGestureRecognizer) {
        let tapAt = tap.locationInView(self.view)
        println("\(tapAt.x) - \(tapAt.y)")
    }

}

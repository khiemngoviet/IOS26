//
//  ColorView.swift
//  UIViewControls
//
//  Created by Trinh Minh Cuong on 9/23/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//http://swift-programming.co/subclassing-with-swift/

import UIKit
//Ví dụ tạo ra một custom UIView
class ColorView: UIView {
    init(frame: CGRect, hex: String, alpha: Float) {
        super.init(frame: frame)
        if frame.width > 150 && frame.height > 30 {
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: frame.width - 10, height: 30))
            label.center = CGPoint(x: frame.width * 0.5 , y: frame.height * 0.5)
            label.textAlignment = NSTextAlignment.Center
            self.addSubview(label)
            label.text = hex
        }
        self.backgroundColor = UIColor(hex: hex, alpha: alpha)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

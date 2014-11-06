//
//  UIViewLayout.swift
//  DemoAdaptiveLayout
//
//  Created by Trinh Minh Cuong on 10/13/14.
//  Copyright (c) 2014 Techmaster Vietnam. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func centerX() {
        let size = self.bounds.size
        let superSize = self.superview?.bounds.size
      
        self.frame = CGRect(x: (superSize!.width - size.width) * 0.5, y: self.frame.origin.y, width: size.width, height: size.height)
    }
    
    func centerY() {
        let size = self.bounds.size
        let superSize = self.superview?.bounds.size
        
        self.frame = CGRect(x: self.frame.origin.x, y: (superSize!.height - size.height) * 0.5, width: size.width, height: size.height)
        
    }
    
    func centerXY() {
        let superSize = self.superview?.bounds.size
        self.center = CGPoint(x: superSize!.width * 0.5, y: superSize!.height * 0.5)
    }
    //Put current view above top of view
    func aboveView(view: UIView, verticalSpace: CGFloat) {
       // let rec = convertRect(view.frame, toView: self.superview!)
        let size = self.bounds.size
        self.frame = CGRect(x: self.frame.origin.x, y: (view.frame.origin.y - verticalSpace - size.height), width: size.width, height: size.height)

    }
}
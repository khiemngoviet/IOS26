//
//  DemoColor.swift
//  UIViewControls
//
//  Created by Trinh Minh Cuong on 9/23/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class DemoColor: UIViewController {

    override func loadView() {
        super.loadView()
        self.view.backgroundColor = UIColor.whiteColor()
        self.edgesForExtendedLayout = UIRectEdge.None
        demoColor()
    }


    func demoColor() {
        //http://pltts.me/palettes/1930
        let colorViewWidth = 200.0
        let x0 = (CGFloat(self.view.bounds.width) - CGFloat(colorViewWidth)) * 0.5
        
        let view1 = ColorView(frame: CGRect(x: x0, y: 10, width: 200, height: 40), hex: "#556270", alpha: 1.0)
        
        let view2 = ColorView(frame: CGRect(x: x0, y: 60, width: 200, height: 40), hex: "#4ECDC4", alpha: 1.0)
        
        let view3 = ColorView(frame: CGRect(x: x0, y: 110, width: 200, height: 40), hex: "#C7F464", alpha: 1.0)
        
        let view4 = ColorView(frame: CGRect(x: x0, y: 160, width: 200, height: 40), hex: "#FF6B6B", alpha: 1.0)
        
        let view5 = ColorView(frame: CGRect(x: x0, y: 210, width: 200, height: 40), hex: "#C44D58", alpha: 1.0)
        
        self.view.addSubview(view1)
        self.view.addSubview(view2)
        self.view.addSubview(view3)
        self.view.addSubview(view4)
        self.view.addSubview(view5)
    }
}

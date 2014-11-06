//
//  MarginWithOther.swift
//  DemoAdaptiveLayout
//
//  Created by Trinh Minh Cuong on 10/13/14.
//  Copyright (c) 2014 Techmaster Vietnam. All rights reserved.
// Chú ý trong ví dụ này

import UIKit

class MarginWithOther: UIViewController {
    @IBOutlet weak var RightLabel_Photo_HorizontalSpace: NSLayoutConstraint!
    override func loadView() {
        super.loadView()
        self.edgesForExtendedLayout = UIRectEdge.None
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        let val = RightLabel_Photo_HorizontalSpace.valueForKey("constant") as Float
        println("\(val)")
    }


}

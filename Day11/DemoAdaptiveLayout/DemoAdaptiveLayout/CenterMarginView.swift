//
//  CenterMarginView.swift
//  DemoAdaptiveLayout
//
//  Created by Trinh Minh Cuong on 10/13/14.
//  Copyright (c) 2014 Techmaster Vietnam. All rights reserved.
//

import UIKit

class CenterMarginView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Thử bỏ dòng này xem thế nào?
        // Xem kỹ hơn
        //http://stackoverflow.com/questions/18798792/explaining-difference-between-automaticallyadjustsscrollviewinsets-extendedlayo
        self.edgesForExtendedLayout = UIRectEdge.None
    }
}

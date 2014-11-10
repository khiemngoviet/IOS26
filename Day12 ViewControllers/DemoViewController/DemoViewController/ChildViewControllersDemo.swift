//
//  ChildViewControllersDemo.swift
//  DemoViewController
//
//  Created by cuong minh on 10/31/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class ChildViewControllersDemo: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       // self.edgesForExtendedLayout = UIRectEdge.None
        let childVCA = ChildVCA(nibName:"ChildVCA", bundle:nil)
        let childVCB = ChildVCB(nibName:"ChildVCB", bundle:nil)
        self.addChildViewController(childVCA)
        self.addChildViewController(childVCB)
        let size = self.view.bounds.size
        
        //Ty nua tinh lai!
        childVCA.view.frame = CGRect(x: 0, y: 64, width: size.width, height: (size.height - 64) * 0.5)
        self.view.addSubview(childVCA.view)
        
        childVCB.view.frame = CGRect(x: 0, y: size.height * 0.5, width: size.width, height: size.height * 0.5)
        
        self.view.addSubview(childVCB.view)
        
    }


}

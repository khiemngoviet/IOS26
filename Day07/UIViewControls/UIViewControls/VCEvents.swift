//
//  VCEvents.swift
//  UIViewControls
//
//  Created by Trinh Minh Cuong on 10/20/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class VCEvents: UIViewController {
    override func loadView() {
        super.loadView() //Không được bỏ đi vì như thế self.view sẽ không được tạo ra
        self.view.backgroundColor = UIColor.whiteColor()
        println("loadView")
    }
    override func viewDidLoad() {
        //super.viewDidLoad()  //Có thể bỏ được
        println("viewDidLoad")
    }
    override func viewWillAppear(animated: Bool) {
        println("viewWillAppear")
    }
    
    override func viewDidAppear(animated: Bool) {
        println("viewDidAppear")
    }
    
    override func viewWillDisappear(animated: Bool) {
        println("viewWillDisappear")
    }
    override func viewDidDisappear(animated: Bool) {
        println("viewDidDisappear")
    }
    
    override func viewWillLayoutSubviews() {
        println("viewWillLayoutSubviews")
    }
    
    override func viewDidLayoutSubviews() {
        println("viewDidLayoutSubviews")
    }
   
}

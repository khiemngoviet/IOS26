//
//  ViewControllerEvents.swift
//  ViewControllersBasic
//
//  Created by cuong minh on 11/10/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class ViewControllerEvents: UIViewController {

    override func loadView() {
        super.loadView()  //cực kỳ quan trọng
        let label = UILabel(frame: CGRect(x: 10, y: 64, width: 100, height: 30))
        label.backgroundColor = UIColor.yellowColor()
        label.text = "Test"
        self.view.addSubview(label)
        println("loadView")
        
    }
    override func viewDidLoad() {
        //super.viewDidLoad()
        //Add label
        
        println("viewDidLoad")
    }
    
    override func viewWillAppear(animated: Bool) {
       println("viewWillAppear")
    }
    
    override func viewDidAppear(animated: Bool) {
        println("viewDidAppear")
        

    }
    
    override func viewWillLayoutSubviews() {
        println("viewWillLayoutSubviews")
    }
    
    override func viewDidLayoutSubviews() {
        println("viewDidLayoutSubviews")
    }
    
    override func viewWillDisappear(animated: Bool) {
        println("viewWillDisappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        println("viewDidDisappear")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let segue_id = segue.identifier {
            println("\(segue_id)")
        }
        println("\(segue.destinationViewController.restorationIdentifier)")
    }


}

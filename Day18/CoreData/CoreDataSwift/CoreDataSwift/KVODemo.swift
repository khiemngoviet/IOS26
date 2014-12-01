//
//  KVODemo.swift
//  CoreDataSwift
//
//  Created by techmaster on 12/1/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class KVODemo: UIViewController {
    var timer: NSTimer!
    //KVO trong Swift bắt buộc phải có khai báo keyword dynamic mới chạy được.
    //Khác với Objective-C không cần khai báo dynamic
    dynamic var gasoline = 100
    @IBOutlet weak var progressView: UIProgressView!
    var gasWatcher = GasWatcher()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = UIRectEdge.None
        
        progressView.addObserver(gasWatcher, forKeyPath: "progress", options: NSKeyValueObservingOptions.New|NSKeyValueObservingOptions.Old, context: nil)
        
        self.addObserver(gasWatcher, forKeyPath: "gasoline", options: NSKeyValueObservingOptions.New|NSKeyValueObservingOptions.Old, context: nil)
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "runEngine", userInfo: nil, repeats: true)
        
    }
    //Sau khi không cần quan sát nữa thì phải removeObserver nếu không sẽ bị memory leaking
    //hoặc, luôn có một observer không quan sát gì cả
    override func viewWillDisappear(animated: Bool) {
        progressView.removeObserver(gasWatcher, forKeyPath: "progress")
        self.removeObserver(gasWatcher, forKeyPath: "gasoline")
    }
    
    func runEngine() {
        progressView.progress -= 0.05
        gasoline = gasoline - 1
    }
    
    @IBAction func gotoDashboard(sender: AnyObject) {
        let dashboard = DashboardDemo(nibName: "DashboardDemo", bundle: nil)
        dashboard.prevController = self
        navigationController?.pushViewController(dashboard, animated: true)        
    }
}

class GasWatcher: NSObject {
    override func observeValueForKeyPath(keyPath: String, ofObject object: AnyObject, change: [NSObject : AnyObject], context: UnsafeMutablePointer<Void>) {
        switch keyPath {
        case "progress":
            let gasolineLevel = (object as UIProgressView).progress
            //println("\(gasolineLevel)")
            
        case "gasoline":
            let gasolineLevel = (object as KVODemo).gasoline
            println("\(gasolineLevel)")

            
        default:
            super.observeValueForKeyPath(keyPath, ofObject: object, change: change, context: context)
        }
    }


    
}
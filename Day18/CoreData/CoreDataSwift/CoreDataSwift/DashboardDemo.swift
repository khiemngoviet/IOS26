//
//  DashboardDemo.swift
//  CoreDataSwift
//
//  Created by techmaster on 12/1/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class DashboardDemo: UIViewController {
    
    @IBOutlet weak var gasolineStatus: UILabel!
    var prevController: KVODemo?
    override func viewWillAppear(animated: Bool) {

        prevController!.progressView.addObserver(self, forKeyPath: "progress", options: NSKeyValueObservingOptions.New | NSKeyValueObservingOptions.Old, context: nil)

    }
    
    override func viewWillDisappear(animated: Bool) {
        prevController!.progressView.removeObserver(self, forKeyPath: "progress")
    }
    
    override func observeValueForKeyPath(keyPath: String, ofObject object: AnyObject, change: [NSObject : AnyObject], context: UnsafeMutablePointer<Void>) {
        switch keyPath {
        case "progress":
            let progress = (object as UIProgressView).progress
            gasolineStatus.text = "\(progress)"
            
        default:
            super.observeValueForKeyPath(keyPath, ofObject: object, change: change, context: context)
        }
    }
}


//
//  NotificationDemo.swift
//  CoreDataSwift
//
//  Created by techmaster on 12/1/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit
let nGasLevel = "GasolineLevel"
class NotificationDemo: UIViewController {

    @IBOutlet weak var progressView: UIProgressView!
    var timer: NSTimer!
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "runEngine", userInfo: nil, repeats: true)
    }
    
    @IBAction func goDashboard(sender: AnyObject) {
        let notificationReceiver = NotificationReceiver(nibName: "NotificationReceiver", bundle: nil)
        navigationController?.pushViewController(notificationReceiver, animated: true)
    }
    func runEngine() {
        progressView.progress -= 0.05
        NSNotificationCenter.defaultCenter().postNotificationName(nGasLevel, object: ["progress": NSNumber(float: progressView.progress)])
    }


  
}

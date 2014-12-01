//
//  NotificationReceiver.swift
//  CoreDataSwift
//
//  Created by techmaster on 12/1/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class NotificationReceiver: UIViewController {

    @IBOutlet weak var gasLevel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        NSNotificationCenter.defaultCenter().addObserver(self, selector:"handleNotification:", name: nGasLevel, object: nil)
    }
    
    func handleNotification(notifi:NSNotification) {
        let data = notifi.object as NSDictionary
        let gas = data["progress"] as Float
        gasLevel.text = "\(gas)"
    }



}

//
//  ReadWriteNSUserDefaults.swift
//  CoreDataSwift
//
//  Created by techmaster on 12/1/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class ReadWriteNSUserDefaults: UITableViewController {
    @IBOutlet weak var airplaneMode: UISwitch!
    @IBOutlet weak var bluetoothMode: UISwitch!

    override func viewWillAppear(animated: Bool) {
        let userDefault = NSUserDefaults.standardUserDefaults()
        airplaneMode.setOn(userDefault.boolForKey("Airplane"), animated: true)
        bluetoothMode.setOn(userDefault.boolForKey("Bluetooth"), animated: true)
    }
    @IBAction func onAirplaneModeChange(sender: UISwitch) {
        let userDefault = NSUserDefaults.standardUserDefaults()
        userDefault.setBool(sender.on, forKey: "Airplane")
    }

    @IBAction func onBluetoothModeChange(sender: UISwitch) {
        let userDefault = NSUserDefaults.standardUserDefaults()
        userDefault.setBool(sender.on, forKey: "Bluetooth")
    }
    
}

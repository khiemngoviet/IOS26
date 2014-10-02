//
//  ViewController.swift
//  Demo2
//
//  Created by ios26 on 9/22/14.
//  Copyright (c) 2014 Trung Anh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var weatherIcon: UIImageView!
    
    let locations = ["Sydney, Autralia", "New York, USA", "CDE, FGH"]
    
    @IBAction func buttonChange(sender: UIButton) {
        let locationIndex = arc4random_uniform(UInt32(locations.count))
        
        println("\(locationIndex)")
        location.text = locations[Int(locationIndex)]
    }
    
    let string = String(fomat: "%2.1f", getTemperature())
    
    func getTemperature() -> Float{
    
        return 14.0 + Float(arc4random_uniform(18)) + Float(arc4random()) / Float(UINT32_MAX)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


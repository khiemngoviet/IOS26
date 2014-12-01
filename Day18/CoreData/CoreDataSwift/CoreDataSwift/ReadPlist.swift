//
//  ReadPlist.swift
//  CoreDataSwift
//
//  Created by techmaster on 12/1/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class ReadPlist: ConsoleScreen {

    override func viewDidLoad() {
        super.viewDidLoad()
        if let path = NSBundle.mainBundle().pathForResource("Array", ofType: "plist") {
            println("\(path)")
            if let celebrities = NSArray(contentsOfFile: path) {
                /*for celeb in celebrities {
                    let name = (celeb as NSDictionary)["name"] as String
                    let job = (celeb as NSDictionary)["job"] as String
                    self.writeln("\(name) - \(job)")
                }*/
                
                for item in celebrities {
                    let celeb = item as NSDictionary
                    let name = celeb["name"] as String
                    let job = celeb["job"] as String
                    self.writeln("\(name) - \(job)")
                }
            }
        }
    }

}

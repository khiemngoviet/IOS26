//
//  ConsoleScreen.swift
//  TechmasterSwiftApp
//
//  Created by Adam on 9/8/14.
//  Copyright (c) 2014 Adam. All rights reserved.
//

import UIKit

class ConsoleScreen: UIViewController {
    weak var console:UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        var console = UITextView(frame: self.view.bounds)
        console.backgroundColor = UIColor.blackColor()
        console.textColor = UIColor.greenColor()
        console.font = UIFont(name: "Courier", size: 16)
        console.editable = false
        self.view.addSubview(console)
        self.console = console
    }
    func write(string:NSString){
        var temp = NSMutableString(string: self.console.text)
        temp.appendString(string)
        self.console.text = temp
    
    }
    func writeln (string:NSString){
        var temp = NSMutableString(string: self.console.text)
        temp.appendString(string)
        temp.appendString("\n")
        self.console.text = temp    
    }
}

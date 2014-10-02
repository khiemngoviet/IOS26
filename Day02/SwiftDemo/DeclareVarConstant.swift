//
//  DeclareVarConstant.swift
//  SwiftDemo
//
//  Created by ios26 on 9/25/14.
//  Copyright (c) 2014 khiemnv. All rights reserved.
//

import UIKit

class DeclareVarConstant: ConsoleScreen {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.write("Hi you\n")
        var x = 10
        let y: Int = 20
        x = 101
        let mutableArray = NSMutableArray(array: [1,2,3,4])
        let array = [1,2,3,5,4,6]
        let a =  array[0]
        //self.write(String(a))
        var tempString: String?
        if tempString != nil{
            println(tempString!)
        }
        
        //for var i = 0; i < 100; i++ {
            //.writeln(String(i+1))
            //}
        for i in array {
            self.writeln(String(i))
        }
        //changed
    }

    
    

}

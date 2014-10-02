//
//  FilterMapReduce.swift
//  DemoClass
//
//  Created by techmaster on 9/14/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class FilterMapReduce: ConsoleScreen {
    var intArr: [Int]?
    override func viewDidLoad() {
        super.viewDidLoad()

        intArr = [23, 12, 1 , -1 , 15, 24, 9, 6, 7, -9, 8]
        demoFilter()
    }
    func demoFilter() {
        let result: [Int] = intArr!.filter{$0 > 0}
        for i in result {
            self.writeln("\(i)")
        }
    }
   
}

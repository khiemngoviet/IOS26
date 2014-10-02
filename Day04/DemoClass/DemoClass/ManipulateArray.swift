//
//  ManipulateArray.swift
//  DemoClass
//
//  Created by techmaster on 9/12/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class ManipulateArray: ConsoleScreen {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sortArray()
        self.sortArray2()
    }
    func sortArray() {
        var intArr = [23, 44 , 10, 7, 66, 84, 100, 25, 45, 5, 7]
        intArr.sort { $0 < $1 }
        for i in intArr {
            self.writeln("\(i)")
        }
        
    }
    
    func sortArray2() {
        var studentArr: [Student] = [
            Student(name: "Cuong", score: 9.5),
            Student(name: "Cuong", score: 9),
            Student(name: "Dung", score: 7),
            Student(name: "Lan", score: 9.5),
            Student(name: "Hoang", score: 8),
            Student(name: "Linh", score: 3),
            Student(name: "Linh", score: 3.2),
            Student(name: "An", score: 6.2),
        ]

        studentArr.sort { $0 < $1 }
        for student in studentArr {
            self.writeln("\(student.description)")
        }
        self.writeln("-------")
        //let reverse = studentArr.reverse()
        let reverse = studentArr.daoMang()
        for student in reverse {
            self.writeln("\(student.description)")
        }
        self.writeln("-------")
        studentArr.daoMang2()
        for student in studentArr {
            self.writeln("\(student.description)")
        }
        
        
    }
}

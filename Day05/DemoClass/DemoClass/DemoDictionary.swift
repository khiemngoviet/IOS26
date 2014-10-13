//
//  DemoDictionary.swift
//  DemoClass
//
//  Created by techmaster on 9/11/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class DemoDictionary: ConsoleScreen {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.declareDic()
        self.objCDic()
    }
    
    func declareDic() {
        var ageOfPeople = [String: Int]()//Định nghĩa một Dictionary có key kiểu String, value kiểu Int
        ageOfPeople["Steve Jobs"] = 58
        ageOfPeople["Bill Gates"] = 80
        ageOfPeople["God"] = 10000000
        let ageGod = ageOfPeople["God2"]
        self.writeln("Age of God is \(ageGod)") //Cái này sẽ trả về nil
        
        //Nên dùng cách dưới đây để kiểm tra nil trước
        if let ageOfGod = ageOfPeople["God"] {
            self.writeln("Age of God is \(ageOfGod)")
        }
        //Luôn dùng cách này để tránh ứng dụng bị crash vì nill
        if let ageOfJesus = ageOfPeople["Jesus"] {
            self.writeln("Age of Jesus is \(ageOfJesus)")
        }
        
        //Khai báo minimumCapacity để lưu trữ đủ phần tử trước khi cần phải cấp phát thêm bộ nhớ
        var keyWordDic = [String: NSDictionary](minimumCapacity: 10)
    }
    
    //Dictionary của Objective-C hoàn toàn khác với Swift
    func objCDic() {
        var objDic : NSDictionary  //Dictionary trong Objective-C
        objDic = ["rec": Rectangle(width: 10, height: 10),
            "triangle": Triangle(a: 10, b: 10, c: 10),
            "circle": Circle(radius: 10)
        ]
        //Dictionary trong Swift
        var swiftDic : [String: Shape] = ["rec": Rectangle(width: 10, height: 10),
            "triangle": Triangle(a: 10, b: 10, c: 10),
            "circle": Circle(radius: 10)
        ]

        if let circle: AnyObject = objDic["circle"] {
            if circle is Circle {
                self.writeln("circle = \(circle)")
            }
        }
    }
   
}

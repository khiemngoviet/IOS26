//
//  DeclareVarConstant.swift
//  SwiftDemo
//
//  Created by Trinh Minh Cuong on 9/25/14.
//  Copyright (c) 2014 Techmaster Vietnam. All rights reserved.
//

import UIKit

class DeclareVarConstant: ConsoleScreen {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.writeln("Hello World")
        self.writeln("Hello World\n")
        self.writeln("Welcome to Vietnam")
        let x = 10 //x la constant
        let y: Int = 10 //Khai báo constant có kiểu tường minh
        var z = 101
        z = 100
        
        let mutableArray = NSMutableArray(array: ["a", "b", "c"])
        //NSMutableArray *mutableArray = [[NSMutableArray alloc] init: @[@"a", @"b", @"c"]];
        mutableArray.addObject("d")
        //Tuy let khai báo constant nhưng nó không đảm bảo đối với kiểu NSMutable, hoặc các biến có thể thay đổi
        //sau khi đã khai báo let không thể gán đối tượng khác vào được
        //mutableArray = NSMutableArray(array: ["x", "y", "z"])
        
        
        //let chỉ áp dụng khai báo constant đối với kiểu primitive datatype (build in) và kiểu chuẩn trong Swift, nó không áp dụng với kiểu NSMutable của Objective-C
        var flexString = "Hello "
        flexString += "World"
        self.writeln(flexString)
        
        var tempString: String?  //Khai báo kiểu Optional hoặc có, hoặc không
        //tempString = "Hack"
        //Kiểm tra gán thử biến Opional, nếu khác null mới in
        if let aString = tempString {
            self.writeln(aString)
        }
        
        println(tempString)
        
        var pi = 3.14158
        self.writeln("2 PI = \(2 * pi)")  //     \(....) gọi là string interpolation. Nội suy chuỗi
        let intNum: Int = Int(pi)  //Ép kiểu
        println(intNum)  //Trả về là 3
        
        var sum: Int = 0
        //Có nhiều cách để lập trình. Hãy chọn cách dễ hiểu, dễ đọc nhất.
        //Không cần quá tối ưu tốc độ, code dễ bảo trì quan trọng hơn
        /*
        for num in 1...1000 {
            sum += num
        }*/
        
        /*for var i = 0; i <= 1000; i++ {
            sum += i
        }*/
        /*
        var i = 0
        while i <= 1000 {
            sum += i++
            //sum = sum + i
            //i = i + 1
            
        }*/
        var i = 0
        do {
            sum = sum + i
            i = i + 1
        } while i <= 1000
        
        self.writeln("sum = \(sum)")
        

    }


    

  
}

//
//  DemoStruct.swift
//  DemoClass
//
//  Created by techmaster on 8/26/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit
struct Point {
    var x: Int = 0
    var y: Int = 0
}
//lhs: Left Hand Size, rhs: Right Hand Size
// == is Equal To, áp dụng cho cả class và struct
// === is Identical To, chỉ áp dụng cho class vì struct mặc định gán giá trị
func == (lhs: Point, rhs: Point) -> Bool{
    return lhs.x == rhs.x && lhs.y == rhs.y
}

struct Size {
    var width: Int = 0
    var height: Int = 0
}
func == (lhs: Size, rhs: Size) -> Bool{
    return lhs.width == rhs.width && lhs.height == rhs.height
}


struct Rect {
    var origin: Point
    var size: Size
    func area() -> Int {
        return size.width * size.height
    }
    
    var description: String {
        return "origin = \(origin.x), \(origin.y) and size = \(size.width), \(size.height)"
    }
}

func == (lhs: Rect, rhs: Rect) -> Bool{
    return lhs.origin == rhs.origin && lhs.size == rhs.size
}


/*
Chú ý: sự khác biệt giữa class và struct
1- class thì assign by reference vs struct assign by value
2- class có thể kế thừa vs struct không kế thừa được
3- class thích hợp với cấu trúc phức tạp vs struct cấu trúc đơn giản, kích thước nhỏ

---> Dòng dưới không thể biên dịch


struct SuperRect: Rect{
    
}
*/
class DemoStruct: ConsoleScreen {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.demoStruct()
        self.writeln("----------")
        self.demoAssignByRef()
        let count = 3_000_000_000_000
    }
    
    func demoStruct() {
        var rec1 = Rect(origin: Point(x: 10, y: 10), size: Size(width: 100, height: 120))
        self.writeln("\(rec1.description)")
        
        var rec2 = Rect(origin: Point(x: 10, y: 10), size: Size(width: 100, height: 120))
        
        //So sánh giá trị từng phần tử bên trong rec1 và rec2 xem có bằng nhau không?
        if rec1 == rec2 {
            self.writeln("rec1 == rec2")
        } else {
            self.writeln("rec1 !== rec2")
        }
        
    }
    
    func demoAssignByRef() {
        var r1 =  Rect(origin: Point(x: 10, y: 10), size: Size(width: 100, height: 120))
        self.writeln("Before \(r1.description)")
        self.modifyRect(&r1)  //Lấy ra reference của r1. r1 phải khai báo là var
        self.writeln("After \(r1.description)")
    }
    
    //inout: chỉ thị tham số truyền vào sẽ là by reference not by value
    func modifyRect(inout rect:Rect) {
        rect.origin = Point(x: 0, y: 0)
        rect.size = Size(width: 10, height: 10)
    }


}

//
//  DemoArray.swift
//  DemoClass
//
//  Created by techmaster on 9/11/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class DemoArray: ConsoleScreen {
    var instantArray : NSArray? //? để biểu thị optional
    override func viewDidLoad() {
        super.viewDidLoad()
        self.declareArray()
        //self.testSwiftArray()

    }
    func testSwiftArray() {
       var intArr = [Int]() //Khai báo một mảng Swift có kiểu phần tử là Int
        //tương đương với NSMutableArray
        // NSMutableArray *intArr = [[NSMutableArray alloc] initWithCapacity: 10];
        // [intArr addObject: @10];
        // [intArr addObject: @20];
        //Array, NSMutableArray trong objective-C chỉ chứa các phần tử là object. nếu 
        //phần tử có kiểu là primitive datatype thì phải box (đóng gói) primitive datatype thành phần tử. @10 -> đóng gói giá trị 10 thành đối tượng chứa giá trị 10
       intArr.append(10)
       intArr.append(20)
        //Mảng trong Swift có thể chứa primitive datatype và đối tượng
        
       let doubleArr = [0.5, 200.1, 230.15] //Constant array
        
        var hippiArr = [AnyObject]()
        hippiArr.append(self)
        hippiArr.append(10)
    }
    func declareArray() {
        var intArr = [Int]() //Swift array
        intArr.append(10)
        intArr.append(100)
        intArr.insert(50, atIndex: 1)
        var objArray : NSArray
        objArray = [Rectangle(width: 10, height: 10), Triangle(a: 10, b: 10, c: 10), Square(width: 4), Circle(radius: 2)]
        
        var swiftArray = [AnyObject]() //Swift array
        swiftArray.append(Rectangle(width: 10, height: 10))
        swiftArray.append(Triangle(a: 10, b: 10, c: 10))
        swiftArray.append(Square(width: 4))
        swiftArray.append(Circle(radius: 2))
        
        instantArray = objArray
        
        // objMutableArr : NSMutableArray //Objective-C array
        let objMutableArr = NSMutableArray(capacity: 2)
        objMutableArr.addObject(Rectangle(width: 10, height: 10))
        
        let aTriangle = Triangle(a: 10, b: 10, c: 10)
        objMutableArr.addObject(aTriangle)
        objMutableArr.addObject(Square(width: 4))
        objMutableArr.addObject(Circle(radius: 2))
        
        
        for obj in objMutableArr  {
            if obj is Shape {
                let shape = obj as Shape
                self.writeln("\(shape.description) with perimeter is \(shape.perimeter())")
            }
        }
        
        if objMutableArr.containsObject(aTriangle) {
            self.writeln("YES")
        }
        
        let index: Int = objMutableArr.indexOfObjectIdenticalTo(Triangle(a: 10, b: 10, c: 10))
        if index == Int.max {
            self.writeln("Cannot find identical triangle")
        }
        
        let index2 = objMutableArr.indexOfObjectIdenticalTo(aTriangle)
        self.writeln("found index = \(index2)")
    }
}

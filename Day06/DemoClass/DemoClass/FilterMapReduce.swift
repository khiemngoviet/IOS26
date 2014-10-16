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
        demoMap()
        demoMap2()
        self.writeln("=====Reduce")
        self.demoReduce()
    }
    func demoFilter() {
        let result: [Int] = intArr!.filter{$0 > 0}
        for i in result {
            self.writeln("\(i)")
        }
    }

    func demoMap() {
        let stringMap: [String] = ["Cat", "Dog", "Tiger", "Pig"]
        let animals = stringMap.map{ self.animalFromString($0)}  //Truyền một hàm vào trong map
        for obj in animals {
            if let animal = obj as Animal? {
                self.writeln(animal.sound())
            }
        }
    }
    
    func demoMap2() {
        let intArray = [2, 4, 6, 8]
        let result = intArray.map{
        (var element) -> Int in  //Tương với block, tham số truyền vào là element, trả về là Int
            if element > 5 { //Kiểm tra nếu lớn hơn 5
                return element * element //thì bình phương
            }
            return element //nếu không thì trả về đúng
        }
        for i in result {
            self.writeln("\(i)")
        }
    }
    
    func animalFromString(name: String) -> Animal? {
        let mainBundle = NSBundle.mainBundle()
        let info =  mainBundle.infoDictionary as NSDictionary?
        let appName = info!.objectForKey("CFBundleName") as NSString
        // Retrospection programming - Reflection programming
        if let animalType = NSClassFromString("\(appName).\(name)") as? Animal.Type {
            return animalType()
        } else{
            return nil
        }
    }
    
    func demoReduce(){
        let array = [1, 2, 3, 4, 5, 0]
    }
    
    
   
}

//
//  DemoFunction.swift
//  DemoClass
//
//  Created by techmaster on 9/14/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class DemoFunction: ConsoleScreen {

    override func viewDidLoad() {
        super.viewDidLoad()
        //Function trả về tuple
        var (farewell, ability) = jediGreet("Cuong", ability: "yes")
        self.writeln("\(farewell)")
        self.writeln("\(ability)")
        
        //Variadic function: hàm có nhiều tham số tương tự nhau
        jediBladeColor(self, colors: "red","green", "blue", "orange")
   
        
        //inout
        var x = 10, y = 50
        swap(&x, b: &y) //Phải chuyển vào reference của biến
        //&x: truyền vào reference của giá trị (đối tượng x), không copy

    }

    //http://fuckingswiftblocksyntax.com/
    //Trả về nhiều hơn một giá trị. Trong lập trình, nhóm giá trị (đối tượng) trả về gọi là tuple
    func jediGreet(name: String, ability: String) -> (farewell: String, mayTheForceBeWithYou: String) {
        return ("Good bye, \(name).", "May the \(ability) be with you.")
    }    
    
    
    //Variadic function
    func jediBladeColor (console: ConsoleScreen, colors: String...) -> () {
        for color in colors {
            console.writeln("\(color)")
        }
    }
    
    //inout
    func swap(inout a: Int, inout b: Int) {
        let temp = a
        a = b
        b = temp
    }
    /*func swap(var a: Int, var b: Int) {
        let temp = a
        a = b
        b = temp
    }*/
    
    private func secretFun() -> String {
        return "KJAKHJWKE2312312--=123"
    }
    
    internal func xx() {
        
    }
    
}

//
//  ExtendDouble.swift
//  DemoClass
//
//  Created by techmaster on 9/12/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import Foundation
infix operator ~~ {}
//Chúng ta không thể so sánh == đối với 2 số vô tỷ !
func ~~(d1: Double, d2: Double) -> Bool {
    let delta = d1 - d2
    if delta.absolute < 0.0000000001 {
        return true
    } else {
        return false
    }
}
//Mở rộng thêm vào chính kiểu (class) Double. Tương đương với Category trong Objective-C
extension Double {

    var absolute: Double {  //computed property
        if self > 0.0 {
            return self
        } else {
            return -self
        }
    }
}
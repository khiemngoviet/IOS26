//
//  Student.swift
//  DemoClass
//
//  Created by techmaster on 9/12/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import Foundation
//Để có thể sắp xếp kiểu đặc biệt , cần phải viết hàm so sánh nhỏ hơn hoặc lớn hơn
infix operator < {}

func < (s1: Student, s2: Student) -> Bool {
    if (s1.name < s2.name) {
        return true
    } else if (s1.name == s2.name) && (s1.score < s2.score) {
        return true
    } else {
        return false
    }
}
class Student {
    var name: String
    var score: Double
    init (name: String, score: Double) {
        self.name = name
        self.score = score
    }
    var description: String {
       return "\(self.name) - \(self.score)"
    }
}
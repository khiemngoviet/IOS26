//
//  StringExtend.swift
//  UIViewControls
//
//  Created by Trinh Minh Cuong on 9/23/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//  http://stackoverflow.com/questions/24092884/get-nth-character-of-a-string-in-swift-programming-language

import Foundation
extension String {
    //Là một dạng toán tử đặc biệt cho kiểu mảng hoặc kiểu tập hợp tuần tự. Toán tự truy xuất theo vị trí
    subscript (i: Int) -> String {
        //Array(self) ép kiểu đối tượng String sang kiểu Array
        //Array(self)[i] lấy ra phần tử thứ i
        //String(...) ép kiểu trở lại dạng String
        return String(Array(self)[i])
    }
    
    subscript (r: Range<Int>) -> String {
        var start = advance(startIndex, r.startIndex)
        var end = advance(startIndex, r.endIndex)
        return substringWithRange(Range(start: start, end: end))
    }
}

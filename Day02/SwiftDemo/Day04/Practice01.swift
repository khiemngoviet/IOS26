//
//  Practice01.swift
//  SwiftDemo
//
//  Created by Khiem Ngo Viet on 10/9/14.
//  Copyright (c) 2014 khiemnv. All rights reserved.
//

import UIKit

class Practice01: ConsoleScreen {
    
    var arrNum = [2,4,5,8,4,5,15,4,1,6,8]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.writeln("Min")
        self.writeln("\(min(arrNum))")
        self.writeln("Max")
        self.writeln("\(max(arrNum))")
        self.writeln("Nearest average")
        self.writeln("\(nearestAverage(arrNum)!)")
    }
    
    func max(arrNum: [Int]) -> Int{
        var max = 0
        for i in 0 ... arrNum.count - 1 {
            if (arrNum[i] > max){max = arrNum[i]}
        }
        return max
    }
    
    func min(arrNum: [Int]) -> Int{
        var min = arrNum[0]
        for i in 0 ... arrNum.count - 1 {
            if (arrNum[i] < min){min = arrNum[i]}
        }
        return min
    }
    
    func nearestAverage(arrNum: [Int]) -> Int? {
        var averageInt = Int(round(average(arrNum)))
        var offsets = [Int]()
        for i in 0 ... arrNum.count - 1 {
            var offset = arrNum[i] - averageInt
            if offset < 0{
                offset = -offset
            }
            offsets.append(offset)
        }
        let minOffset = min(offsets)
        //find index's minOffset in offsets
        for i in 0 ... offsets.count - 1{
            if offsets[i] == minOffset{
                return arrNum[i]
            }
        }
        return nil
    }
    
    func average(arrNum: [Int]) -> Float{
        var total = 0
        for i in 0 ... arrNum.count - 1 {
            total += arrNum[i]
        }
        return Float(total)/Float( arrNum.count)
    }
    
}

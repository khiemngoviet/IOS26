//
//  DemoClosure.swift
//  DemoClass
//
//  Created by techmaster on 9/14/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class DemoClosure: ConsoleScreen {

    override func viewDidLoad() {
        super.viewDidLoad()

        let train = jediTrainer()
        train("Obi Wan", 3)
        if let trainA = trainSoldier(GermanSoldier(name: "Heiner")) {
            self.writeln(trainA(lesson: "How to fire missle"))
        }
        self.writeln("\n")
        if let trainB = trainSoldier(RussianSoldier(name: "Ivanopulo")) {
            self.writeln(trainB(lesson: "How to drive submarine"))
        }
    }
    //This function returns a function
    func jediTrainer () -> ((String, Int) -> String) {
        func train(name: String, times: Int) -> (String) {
            return "\(name) has been trained in the Force \(times) times"
        }
        return train
    }
    
    
    func trainSoldier(soldier: Soldier) -> ((lesson: String) -> String)? {
        //Kiểm tra kiểu bằng lệnh Switch
        switch soldier {
        case is RussianSoldier:
            func trainRussian(lesson: String) -> String {
                return "Train Russian solider lesson \(lesson)"
            }
            return trainRussian
            
        case is GermanSoldier:
            func trainGerman(lesson: String) -> String {
                return "Train German solider \(soldier.name) lesson \(lesson)"
            }
            return trainGerman
        default:
            return nil
        }
    }
    
    //Hãy viết hàm mở file PNG, JPG, PSD sử dụng các thư viện đọc file khác nhau
}

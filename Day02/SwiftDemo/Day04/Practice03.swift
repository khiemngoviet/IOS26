//
//  Practice03.swift
//  SwiftDemo
//
//  Created by Khiem Ngo Viet on 10/9/14.
//  Copyright (c) 2014 khiemnv. All rights reserved.
//

import UIKit

class Practice03: ConsoleScreen {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func animalSimulator(){
        var animals = [Animal]()
        for i in 0 ..< 1000 {
            let random = arc4random_uniform(3)
            let sex = arc4random_uniform(1) == 0 ? Sex.female : Sex.male
            let animal:Animal?
            switch random{
            case 0:
                let animal = Cat(sex: sex, adulAge: 1, deadAge: 15)
            case 1:
                let animal = Dog(sex: sex, adulAge: 3, deadAge: 25)
            case 2:
                let animal = Horse(sex: sex, adulAge: 10, deadAge: 50)
            case 3:
                let animal = Pig(sex: sex, adulAge: 2, deadAge: 20)
            default:
                break
            }
            animals.append(animal!)
        }
    }
}

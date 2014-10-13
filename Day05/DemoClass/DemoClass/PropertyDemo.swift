//
//  PropertyDemo.swift
//  DemoClass
//
//  Created by techmaster on 9/5/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit
class Soldier {
    var name: String
    var isEnemy: Bool
    var blood: Int = 50  //0->100
    var armour: Int = 50 { //0->100
        willSet(newArmour) {
            
        }
        //Đang có bug ở chỗ này. didSet vẫn giữ giá trị ban đầu.
        //Kiểm tra lại sau
        didSet {
            if self.armour < 0 {
                self.armour = 0
            } else if self.armour > 100 {                
                self.armour = 100
            }
            switch self.armour {
            case 0...30:
                println("Becareful when fighting")
            case 31...60:
                println("Ready to fight")
            case 61...80:
                println("Your armour is good, let's kill")
            case 81...100:
                println("Please unload some armour to go faster")
            default:
                println("Armour is unknown")
            }
        }
    }
    var weapon: Int = 50  //property with default value
    //Computed property
    var health: Int {
        return (self.blood + self.weapon + self.armour) / 3
    }
    
    init (name: String, enemy: Bool) {
        self.name = name
        self.isEnemy = enemy
    }
    //Computed Property
    var description: String {
        var status: String
            switch self.health {
            case 0...10:
                status = "almost dies"
            case 11...30:
                status = "too weak"
            case 31...40:
                status = "needs more blood, armour and weapon"
            case 41...60:
                status = "ready to fire"
            case 61...70:
                status = "is strong"
            case 71...85:
                status = "is very strong"
            case 86...100:
                status = "is super strong, let's destroy everything"
            default:
                status = "is invisible mode"
            }
            
            return "\(self.name) is \(status)"
    }
    
}
class PropertyDemo: ConsoleScreen {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.demoSoldier()
    }
    
    func demoSoldier() {
        let soldierA = Soldier(name: "Eisenhow", enemy: true)
        soldierA.armour = 120
        soldierA.blood = 70
        soldierA.weapon = 30
        let soldierB = Soldier(name: "Jack", enemy: false)
        
        self.writeln("\(soldierA.name) has health: \(soldierA.health)")
        //self.writeln("\(soldierB.name) has health: \(soldierB.health)")
        self.writeln("\(soldierA.description)")
    }

    
}

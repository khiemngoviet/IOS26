//
//  ProtocolDemo.swift
//  DemoClass
//
//  Created by techmaster on 9/5/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

//@objc --> Objective-C
@objc protocol Athletic{
    
    func playFootball() -> String
    func swim() -> String
}

class TechmasterStudent: Person, Athletic{
    func playFootball() -> String {
        return "\(self.name) play foot ball"
    }
    
    func swim() -> String {
        return "\(self.name) swim"
    }
}

class RussianSoldier: Soldier, Athletic {
    init (name: String) {
        super.init(name: name, enemy: false)
    }
    func playFootball() -> String {
        return "\(self.name) play foot ball badly"
    }
    
    func swim() -> String {
        return "\(self.name) swim badly, prefer drink Vodka"
    }
}

class GermanSoldier: Soldier, Athletic {
    init (name: String) {
        super.init(name: name, enemy: true)
    }
    
    func playFootball() -> String {
        return "\(self.name) play foot ball very well"
    }
    
    func swim() -> String {
        return "\(self.name) swim cross Rein river"
    }
}
class ProtocolDemo: ConsoleScreen {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.demoProtocol()
    }
    
    func demoProtocol() {
        let tm1 = TechmasterStudent(name: "Giap", dob: "1994-11-05")
        let tm2 = TechmasterStudent(name: "Duy", dob: "1990-09-09")
        let tm3 = TechmasterStudent(name: "Dung Beo", dob: "1992-03-09")
        let quan = Person(name: "Quan", dob: "1990-12-02")
        let russianSol = RussianSoldier(name: "Ivan")
        let germanSol = GermanSoldier(name: "Heineker")
       /* Casting mảng people thành mảng Atheletic. Kiểm tra kiểu ngay lúc lập trình. Khác với objective-C kiểm tra ở runtime */
       /* let people = [tm1, tm2, tm3, russianSol, germanSol] as [Athletic]
        for person in people {
            self.writeln(person.swim())
        }*/
        
        //Declare mảng chứa các phần tử adopt protocol Athletic
        /*let people:[Athletic] = [tm1, tm2, tm3, russianSol, germanSol]
        for person in people {
            self.writeln(person.swim())
        }*/
        let people = [tm1, tm2, tm3, quan, russianSol, germanSol]
        for person in people {
            if person is Athletic {
                self.writeln(person.swim())
            }
           /* if let truePerson = person as? Person {
                self.writeln("\(truePerson.name) is a Person")
            }*/
            if person.isMemberOfClass(Person) {
               //let aperson = person as Person
               //self.writeln("\((person as Person).name) is a Person")
                
               /* trường hợp này in ra sẽ bị nil is a Person
               self.writeln("\(person.name) is a Person") */
            }
            
            //if person.isKindOfClass(<#aClass: AnyClass!#>)
        }
    }
    

}

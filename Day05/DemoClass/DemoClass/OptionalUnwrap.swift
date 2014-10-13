//
//  OptionalUnwrap.swift
//  DemoClass
//
//  Created by techmaster on 8/29/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class Person {
    var name: String
    var DOB: String
    var numOfPet: Int? //Optional kiểu Int có hai khả năng: có đối tượng kiểu hoặc nil
    var address: Address?
    init (name: String, dob: String) {
        self.name = name
        self.DOB = dob
        //self.numOfPet = 2
    }
}

class Address {
    var street: String
    var no: Int?
    init (street: String) {
        self.street = street
    }
}

class OptionalUnwrap: ConsoleScreen {

    override func viewDidLoad() {
        super.viewDidLoad()
       // self.checkOptional()
        self.testPerson()
       // self.testFunctionReturnOption()
    }
    func checkOptional() {
        let numLegs = ["ant":8, "snake":0, "cheetah": 4]
        var legCat = numLegs["cat"]
        if let legofCat = numLegs["cat"] {
            self.writeln("Cat has \(legofCat) legs")
        }
        
        if let legofAnt = numLegs["ant"] {
            self.writeln("Ant has \(legofAnt) legs")
        }
    }
    func testPerson() {
        let person = Person(name: "Cuong", dob: "1975-11-27")
       
       // self.writeln("Number of pet = \(person.numOfPet)")
        
        //Kỹ thuật này gọi là optional binding
        if let numOfPet = person.numOfPet {
            self.writeln("Number of pet = \(numOfPet)")
        }
        //Lệnh này in ra nil
        self.writeln("\(person.address?.street)")
        
        /*Lệnh này không biên dịch được vì address là optional
        self.writeln("\(person.address.street)")
        */
        
        //!: là toán tử unwrap một optional value khi biết chắc optional value không nil. Nếu nil chương trình sẽ crash
        //self.writeln("\(person.address!.street)")
        
        
        person.address = Address(street: "Nguyen Dinh Chieu")
        if let street = person.address?.street {
            self.writeln("\(person.name) is at \(street)")
        }
        
        person.address?.no = 79 //Thử bật tắt lệnh này xem sao
        
        if let no = person.address?.no? {  //Cái này gọi là optional chaining
            self.writeln("\(person.name) is at no: \(no)")
        }

    }
    
    func testFunctionReturnOption() {
        let index = self.findIndexOfString("hello", array: ["Chao", "Konhichiwa", "Guttentag", "hello"])
        if index != nil {
            self.writeln("Without unwrap: \(index)")
            self.writeln("With unwrap   : \(index!)")
        }
        
        
    }
    
    func findIndexOfString(string: String, array: [String])-> Int? {
        for (index, value) in enumerate(array) {
            if value == string {
                return index
            }
        }
        return nil
    }

}

//
//  CallC.swift
//  MultiLanguages
//
//  Created by cuong minh on 12/9/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class CallC: ConsoleScreen {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let result = cmax(10, 20)
        self.writeln("max is \(result)")
        let temp = returnCString()
        let string = String.fromCString(temp)
        self.writeln("\(string!)")
        var title =  UnsafeMutablePointer<Int8>(("Hello" as NSString).UTF8String)
        var book = Book(title: title , book_id: 100)
        
        self.writeln("book id = \(book.book_id)")
        
        var cool =  UnsafeMutablePointer<Int8>(("Cooler" as NSString).UTF8String)
        strrev(cool)
        let looc = String.fromCString(cool)!
        self.writeln("\(looc)")
        
        var utf8Str = UnsafeMutablePointer<Int8>(("Cường" as NSString).UTF8String)
        strrev_utf8(utf8Str)
        let revutf8Str = String.fromCString(utf8Str)!
        self.writeln("\(revutf8Str)")
        
        var pStrA = UnsafeMutablePointer<Int8>(("Rock" as NSString).UTF8String)
        var pStrB = UnsafeMutablePointer<Int8>(("Fire" as NSString).UTF8String)
        swapCString(&pStrA, &pStrB)
        let rock = String.fromCString(pStrA)!
        let fire = String.fromCString(pStrB)!
        self.writeln("rock = \(rock)")
        self.writeln("fire = \(fire)")
        
    }
}

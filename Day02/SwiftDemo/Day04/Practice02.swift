//
//  Practice02.swift
//  SwiftDemo
//
//  Created by Khiem Ngo Viet on 10/9/14.
//  Copyright (c) 2014 khiemnv. All rights reserved.
//

import UIKit

class Practice02: ConsoleScreen {
    
    var input = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.writeln("First Inverted")
        var invertedDocument = self.inverstDocument(input)
        self.writeln("\(invertedDocument)")
        self.writeln("")
        self.writeln("Second Inverted")
        invertedDocument = inverstDocument(invertedDocument)
        self.writeln("\(invertedDocument)")
    }
    
    func inverstDocument(input:String) -> String {
        var invertedDocument = [String]()
        var arrWords = input.componentsSeparatedByString(" ")
        for word in arrWords{
            invertedDocument.append(invertWord(word))
        }
        var returnedString = ""
        //join in to string
        for invertedWord in invertedDocument{
            returnedString = returnedString  + invertedWord + " "
        }
        return returnedString
    }
    
    func invertWord(word:String) -> String{
        var invertedWord:String = ""
        for var i = countElements(word) - 1; i >= 0; i-- {
            invertedWord = invertedWord + String(Array(word)[i])
        }
        return invertedWord
    }
    
    
    
}

//
//  WordCounter.swift
//  DemoClass
//
//  Created by techmaster on 9/9/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit
infix operator =~ {}
func =~ (string: String, regex: NSRegularExpression) -> Bool {
    let matches = regex.numberOfMatchesInString(string,
        options: nil,
        range: NSMakeRange(0, countElements(string)))
    return matches > 0
}
infix operator < {}
func < (s1: Word, s2: Word) -> Bool {
    if (s1.count > s2.count) {
        return true
    } else {
        return false
    }
}
class Word {
    var word: String
    var count: Int = 1
    init(word: String) {
        self.word = word
    }
    func increment() {
        self.count += 1
    }
}
class WordCounter: ConsoleScreen {
    
    var WordCountNSort: [Word] = [Word]()
    let dummyWords = ["", " ","a", "all", "an", "i", "in", "is", "it", "are", "were", "he", "she", "they", "it's", "my", "his", "her", "their", "this", "that", "very", "much"]
    
    let numrex = NSRegularExpression(pattern: "^\\d+$", options: NSRegularExpressionOptions.CaseInsensitive, error: nil)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*  if let plainString = self.readFileToString("data.txt") {
        self.countWord(plainString)
        }*/
        
        self.countWord("I like this. i hate that dog. Cat is fun,joke,love: is it cool?. dog,flower;dog. hate is bad hate.Love is all around. Red blue green yellow violet sexy")
        
        self.writeln("Sort by Alphabet Descessding")
        self.countWordDescesding("I like this. i hate that dog. Cat is fun,joke,love: is it cool?. dog,flower;dog. hate is bad hate.Love is all around. Red blue green yellow violet sexy")
        
//        self.writeln("Sort by word Length")
//        self.countWordDescesdingByLength("I like this. i hate that dog. Cat is fun,joke,love: is it cool?. dog,flower;dog. hate is bad hate.Love is all around. Red blue green yellow violet sexy")
        
        
        //self.countWord("aa nn mm cc kk ee cc bb bb ee dd aa")
        //self.countWord("cc kk cc")
    }
    
    func readFileToString(textFile: String) -> String? {
        let fileNameArr = textFile.componentsSeparatedByString(".")
        if fileNameArr.count != 2 { return nil }
        
        let filePath = NSBundle.mainBundle().pathForResource(fileNameArr[0], ofType: fileNameArr[1])
        println("\(filePath)")
        
        //return String.stringWithContentsOfFile(filePath!, encoding: NSUTF8StringEncoding, error: nil)
        return String(contentsOfFile: filePath!, encoding: NSUTF8StringEncoding, error: nil)
    }
    func shouldRemoveThisWord(word: String) -> Bool {
        if contains(dummyWords, word) { return true }
        if (word =~ numrex!) { return true }
        return false;
    }
    
    func countWord(inputString: String) {
        let separator = NSMutableCharacterSet(charactersInString: " .,:;?!")
        let rawWordArray = inputString.lowercaseString.componentsSeparatedByCharactersInSet(separator)
        
        /* ok nhung khong sort duoc
        let wordSet = NSCountedSet()
        for word in rawWordArray {
        if !self.shouldRemoveThisWord(word) {
        wordSet.addObject(word)
        }
        }
        
        for word in wordSet {
        self.writeln("\(word) : \(wordSet.countForObject(word))")
        }*/
        
        for word in rawWordArray {
            if !self.shouldRemoveThisWord(word) {
                self.insertWordToWordCountNSort(word)
            }
        }
        
        for word in rawWordArray {
            if !self.shouldRemoveThisWord(word) {
                self.insertWordToWordCountNSortDescesding(word)
            }
        }
        
        //sort wordCountNSort by length of word
        
        
        
//        var passnum = WordCountNSort.count - 1
//        
//        var exchange = true
//        
//        while passnum > 0 && exchange
//        {
//            exchange = false
//            for (var i = 0 ; i < passnum ; i++)
//            {
//                if WordCountNSort[i].count < WordCountNSort[i+1].count
//                {
//                    exchange = true
//                    var temp = WordCountNSort[i]
//                    WordCountNSort[i] = WordCountNSort[i+1];
//                    WordCountNSort[i+1] = temp;
//                }
//            }
//            passnum--
//        }
        
        WordCountNSort.sort { $0 < $1 }
       
        
        for item in WordCountNSort {
            self.writeln("\(item.word) : \(item.count)")
        }
        
    }
    
    func countWordDescesding(inputString: String) {
        let separator = NSMutableCharacterSet(charactersInString: " .,:;?!")
        let rawWordArray = inputString.lowercaseString.componentsSeparatedByCharactersInSet(separator)
        
        /* ok nhung khong sort duoc
        let wordSet = NSCountedSet()
        for word in rawWordArray {
        if !self.shouldRemoveThisWord(word) {
        wordSet.addObject(word)
        }
        }
        
        for word in wordSet {
        self.writeln("\(word) : \(wordSet.countForObject(word))")
        }*/
        
        for word in rawWordArray {
            if !self.shouldRemoveThisWord(word) {
                self.insertWordToWordCountNSortDescesding(word)
            }
        }
        
        for item in WordCountNSort {
            self.writeln("\(item.word) : \(item.count)")
        }
        
    }
    
    func countWordDescesdingByLength(inputString: String) {
        let separator = NSMutableCharacterSet(charactersInString: " .,:;?!")
        let rawWordArray = inputString.lowercaseString.componentsSeparatedByCharactersInSet(separator)
        
        /* ok nhung khong sort duoc
        let wordSet = NSCountedSet()
        for word in rawWordArray {
        if !self.shouldRemoveThisWord(word) {
        wordSet.addObject(word)
        }
        }
        
        for word in wordSet {
        self.writeln("\(word) : \(wordSet.countForObject(word))")
        }*/
        
        for word in rawWordArray {
            if !self.shouldRemoveThisWord(word) {
                self.insertWordToWordCountNSortDescesding(word)
            }
        }
        
        //sort wordCountNSort by length of word
        
        
        //var res2 = [2,34,452,45,234,6,3,1,343,543,23,2,34,452,45,234,6,3,1,343,543,23,2,34,452,45,234,6,3,1,343,543,23,2,34,452,45,234,6,3,1,343,543,23];
        
        var passnum = WordCountNSort.count - 1
        
        var exchange = true

        while passnum > 0 && exchange
        {
            exchange = false
            for (var i = 0 ; i < passnum ; i++)
            {
                if WordCountNSort[i].count > WordCountNSort[i+1].count
                {
                    exchange = true
                    var temp = WordCountNSort[i]
                    WordCountNSort[i] = WordCountNSort[i+1];
                    WordCountNSort[i+1] = temp;
                }
            }
            passnum--
        }
        
        
        for item in WordCountNSort {
            self.writeln("\(item.word) : \(item.count)")
        }
        
    }
    
    
    
    
    
    
    
    func insertWordToWordCountNSort(word: String) {
        var index = 0
        if (WordCountNSort.count == 0) {
            WordCountNSort.append(Word(word: word))
            return
        }
        
        for item in WordCountNSort {
            if (word < item.word) {
                WordCountNSort.insert(Word(word: word), atIndex: index)
                return
            } else if (word == item.word) {
                item.increment()
                return
            } else if (word > item.word) {
                index++
                if (index == WordCountNSort.count) {
                    WordCountNSort.append(Word(word: word))
                }
            }
        }
    }
    
    func insertWordToWordCountNSortDescesding(word: String) {
        var index = 0
        if (WordCountNSort.count == 0) {
            WordCountNSort.append(Word(word: word))
            return
        }
        
        for item in WordCountNSort {
            if (word > item.word) {
                WordCountNSort.insert(Word(word: word), atIndex: index)
                return
            } else if (word == item.word) {
                item.increment()
                return
            } else if (word < item.word) {
                index++
                if (index == WordCountNSort.count) {
                    WordCountNSort.append(Word(word: word))
                }
            }
        }
    }
    
    func insertWordToWordCountNSortDescesdingByLength(word: String) {
        var index = 0
        if (WordCountNSort.count == 0) {
            WordCountNSort.append(Word(word: word))
            return
        }
        
        for item in WordCountNSort {
            if (word > item.word) {
                WordCountNSort.insert(Word(word: word), atIndex: index)
                return
            } else if (word == item.word) {
                item.increment()
                return
            } else if (word < item.word) {
                index++
                if (index == WordCountNSort.count) {
                    WordCountNSort.append(Word(word: word))
                }
            }
        }
    }
}
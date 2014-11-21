//
//  Singleton.swift
//  CodeCamp.Tetris
//
//  Created by Khiem Ngo Viet on 11/21/14.
//  Copyright (c) 2014 Khiem Ngo Viet. All rights reserved.
//

import Foundation

private let _shared = Singleton()

class Singleton:NSObject{
    class var shared: Singleton {
        return _shared
    }
    
    var blockArray:Array2D<Block>!
    
}
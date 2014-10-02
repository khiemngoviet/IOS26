//
//  Banana.swift
//  ShareUILib
//
//  Created by techmaster on 9/14/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import Foundation

//Phải khai báo public
public class Banana {
    public init () {
  
    }
    //Phải khai báo public
    public func makeBananaLonger() ->String {
        return "Longer banana"
    }
    
    internal func makeBananaSweeter() ->String {
        return "Switter banana"
    }
    
    internal func makeBananaSmellie() ->String {
        return "Secret banana"
    }
}
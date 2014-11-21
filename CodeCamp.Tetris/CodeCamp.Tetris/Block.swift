//
//  Block.swift
//  CodeCamp.Tetris
//
//  Created by Khiem Ngo Viet on 11/21/14.
//  Copyright (c) 2014 Khiem Ngo Viet. All rights reserved.
//

import Foundation
import UIKit

let BlockSize: CGFloat = 20

class Block: UIView {
    
    var column: Int!
    var row: Int!
    
    var color: Int!{
        didSet{
            self.backgroundColor = UIColor.redColor()
        }
    }
 
    
}
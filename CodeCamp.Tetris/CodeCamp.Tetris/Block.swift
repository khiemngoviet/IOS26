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
            switch color{
             case 0:
                self.backgroundColor = UIColor(red: 0.067, green:0.247, blue:0.549, alpha:1)
            case 1:
            self.backgroundColor = UIColor(red: 0.004, green:0.643, blue:0.643, alpha:1)
            case 2:
              self.backgroundColor = UIColor(red: 0.38, green:0.682, blue:0.141, alpha:1)
            case 3:
               self.backgroundColor = UIColor(red: 0.816, green:0.82, blue:0.008, alpha:1)
            case 4:
                self.backgroundColor = UIColor(red:0, green:0.631, blue:0.796, alpha:1)
            case 5:
                self.backgroundColor = UIColor(red: 0.843, green:0, blue:0.376, alpha:1)
            case 6:
                self.backgroundColor = UIColor(red: 0.898, green:0.251, blue:0.157, alpha:1)
            default:
               self.backgroundColor = UIColor(red: 0.067, green:0.247, blue:0.549, alpha:1)
            }
        }
    }
 
    
}
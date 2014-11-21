//
//  TShape.swift
//  CodeCamp.Tetris
//
//  Created by Khiem Ngo Viet on 11/21/14.
//  Copyright (c) 2014 Khiem Ngo Viet. All rights reserved.
//

import Foundation
class TShape:Shape {
    /*
    Orientation 0
    
        | 0 |
    | 1 | 2 | 3 |
    
    Orientation 90
    
    •| 1 |
    | 2 | 0 |
    | 3 |
    
    Orientation 180
    
    •
    | 1 | 2 | 3 |
    | 0 |
    
    Orientation 270
    
    • | 1 |
    | 0 | 2 |
    | 3 |
    
    • marks the row/column indicator for the shape
    
    */
    
    override var blockRowColumnPositions: [Orient: Array<(columnDiff: Int, rowDiff: Int)>] {
        return [
            Orient.top:       [(1, 0), (0, 1), (1, 1), (2, 1)],
            Orient.right:     [(2, 1), (1, 0), (1, 1), (1, 2)],
            Orient.bottom:    [(1, 2), (0, 1), (1, 1), (2, 1)],
            Orient.left:      [(0, 1), (1, 0), (1, 1), (1, 2)]
        ]
    }
 
}
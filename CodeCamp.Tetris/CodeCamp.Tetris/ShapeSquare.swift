//
//  Shape1.swift
//  CodeCamp.Tetris
//
//  Created by Khiem Ngo Viet on 11/21/14.
//  Copyright (c) 2014 Khiem Ngo Viet. All rights reserved.
//

import Foundation

class ShapeSquare: Shape{
    
    override var blockRowColumnPositions: [Orient: Array<(columnDiff: Int, rowDiff: Int)>] {
        return [
            Orient.top:        [(0, 0), (1, 0), (0, 1), (1, 1)],	
            Orient.right:      [(0, 0), (1, 0), (0, 1), (1, 1)],
            Orient.bottom:     [(0, 0), (1, 0), (0, 1), (1, 1)],
            Orient.left:       [(0, 0), (1, 0), (0, 1), (1, 1)]
        ]
    }
    
    
    
}
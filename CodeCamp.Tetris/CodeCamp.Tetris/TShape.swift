//
//  TShape.swift
//  CodeCamp.Tetris
//
//  Created by Khiem Ngo Viet on 11/21/14.
//  Copyright (c) 2014 Khiem Ngo Viet. All rights reserved.
//

import Foundation
class TShape:Shape {
  
    
    override var blockRowColumnPositions: [Orient: Array<(columnDiff: Int, rowDiff: Int)>] {
        return [
            Orient.top:       [(1, 0), (0, 1), (1, 1), (2, 1)],
            Orient.right:     [(2, 1), (1, 0), (1, 1), (1, 2)],
            Orient.bottom:    [(1, 2), (0, 1), (1, 1), (2, 1)],
            Orient.left:      [(0, 1), (1, 0), (1, 1), (1, 2)]
        ]
    }
 
}
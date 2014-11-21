//
//  ShapeLine.swift
//  CodeCamp.Tetris
//
//  Created by Khiem Ngo Viet on 11/21/14.
//  Copyright (c) 2014 Khiem Ngo Viet. All rights reserved.
//

import Foundation
class ShapeLine: Shape{
    override var blockRowColumnPositions: [Orient: Array<(columnDiff: Int, rowDiff: Int)>] {
        return [
            Orient.top:       [(0, 0), (0, 1), (0, 2), (0, 3)],
            Orient.right:     [(0,0), (1, 0), (2, 0), (3, 0)],
            Orient.bottom:    [(0, 0), (0, 1), (0, 2), (0, 3)],
            Orient.left:      [(0,0), (1, 0), (2, 0), (3, 0)],
        ]
    }
    
    override var bottomBlocksForOrientations: [Orient: Array<Block>] {
        return [
            Orient.top:       [blocks[FourthBlockIdx]],
            Orient.right:     blocks,
            Orient.bottom:  [blocks[FourthBlockIdx]],
            Orient.left: blocks
        ]
    }

}
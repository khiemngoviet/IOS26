//
//  Shape.swift
//  CodeCamp.Tetris
//
//  Created by Khiem Ngo Viet on 11/21/14.
//  Copyright (c) 2014 Khiem Ngo Viet. All rights reserved.
//

import Foundation
import UIKit

let FirstBlockIdx: Int = 0
let SecondBlockIdx: Int = 1
let ThirdBlockIdx: Int = 2
let FourthBlockIdx: Int = 3

let ShapeWidth: CGFloat = 80.0
let ShapeHeight: CGFloat = 80.0

class Shape: UIView{
    
    var blocks = Array<Block>()
    var orient: Orient = Orient.left
    var color: Int!
    var column:Int!
    var row:Int!
    
    
    var blockRowColumnPositions: [Orient: Array<(columnDiff: Int, rowDiff: Int)>] {
        return [:]
    }

    
    func drawShape(){ //draw at top position
        //Clear old shape if exist
        self.blocks.removeAll(keepCapacity: false)
        for block  in self.subviews {
            block.removeFromSuperview()
            Singleton.shared.blockArray[(block as Block).column, (block as Block).row] = nil
        }
        let coord = coordinateForColnRow(self.column, row: self.row)
        self.frame = CGRect(x: coord.x, y: coord.y, width: ShapeWidth, height: ShapeHeight)
        let block: Array<(columnDiff: Int, rowDiff: Int)> = self.blockRowColumnPositions[orient]!
        var x: CGFloat = 0
        
        for i in 0..<block.count{
            var y: CGFloat = 0
            for j in 0..<block.count{
                for (blockColumn,blockRow) in block{
                    if blockColumn == i && blockRow == j{
                        let block = Block(frame: CGRect(x: x, y: y, width: BlockSize, height: BlockSize))
                        block.row = self.row + blockRow
                        block.column = self.column + blockColumn
                        block.color = self.color
                        block.layer.borderWidth = 1
                        block.layer.cornerRadius = 4
                        block.layer.borderColor = UIColor.whiteColor().CGColor
                        self.addSubview(block)
                        
                        self.blocks.append(block)
                    }
                }
                y += BlockSize
            }
            x += BlockSize //block size
        }
    }
    
    func moveDown(){
        var frame = self.frame
        frame = CGRect(x: frame.origin.x, y: frame.origin.y + CGFloat(BlockSize), width: frame.size.width, height: frame.size.height)
        self.frame = frame
        self.row = self.row + 1
        for block in self.blocks{
            block.row = block.row + 1
        }
    }
    
    func moveLeft(){
        var frame = self.frame
        frame = CGRect(x: frame.origin.x - CGFloat(BlockSize), y: frame.origin.y , width: frame.size.width, height: frame.size.height)
        self.frame = frame
        self.column = self.column - 1
        for block in self.blocks{
            block.column = block.column - 1
        }
    }
    
    func moveRight(){
        var frame = self.frame
        frame = CGRect(x: frame.origin.x + CGFloat(BlockSize), y: frame.origin.y , width: frame.size.width, height: frame.size.height)
        self.frame = frame
        self.column = self.column + 1
        for block in self.blocks{
            block.column = block.column + 1
        }
    }
    
    func rotate(){
        var rotated = orient.rawValue + 1
        if rotated > Orient.left.rawValue{
            rotated = Orient.top.rawValue
        }
        self.orient = Orient(rawValue: rotated)!
        self.drawShape()
    }

    
    func coordinateForColnRow(column:Int, row:Int) -> CGPoint{
        let x: CGFloat =  CGFloat(column) * BlockSize
        let y: CGFloat =  CGFloat(row) * BlockSize
        return CGPointMake(x, y)
    }
    
    class func random(startingColumn:Int, startingRow:Int) -> Shape {
        var shape:Shape!
        let rand = Int(arc4random_uniform(6))
        switch  rand {
        case 0:
             shape = ShapeSquare()
        case 1:
             shape = ShapeLine()
        case 2:
            shape = TShape()
        case 3:
            shape = JShape()
        case 4:
            shape = SShape()
        case 5:
            shape = ZShape()
        case 6:
            shape = LShape()
        default:
             shape = ShapeLine()
        }
        shape.column = startingColumn
        shape.row = startingRow
        shape.orient =  shape.randomOrient()
        shape.color = rand
        return shape
    }
    
    func randomOrient() -> Orient{
        switch Int(arc4random_uniform(4)) {
        case 0:
            return Orient.top
        case 1:
            return Orient.right
        case 2:
            return Orient.bottom
        case 3:
            return Orient.left
        default:
            return Orient.top
        }
    }
    
    
    
}

enum Orient: Int{
    case top, right, bottom, left
}
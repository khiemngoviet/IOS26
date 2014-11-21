//
//  ViewController.swift
//  CodeCamp.Tetris
//
//  Created by Khiem Ngo Viet on 11/21/14.
//  Copyright (c) 2014 Khiem Ngo Viet. All rights reserved.
//

import UIKit
let OffsetX: CGFloat = 10
let OffsetY: CGFloat = 50
let NumColumns = 10
let NumRows = 20


class ViewController: UIViewController {
    
    @IBOutlet var container: UIView!
    
    var timer:NSTimer!

    var currentShape: Shape!
    
    var tapGesture:UITapGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Singleton.shared.blockArray = Array2D<Block>(columns: NumColumns, rows: NumRows)
        
//        let outerContainer = UIView(frame: CGRect(x: OffsetX , y: OffsetY, width: 222, height: 402))
//        outerContainer.layer.borderColor = UIColor.grayColor().CGColor
//        outerContainer.layer.borderWidth = 2.0
//        
//        container = UIView(frame: CGRect(x: 2, y: 2, width: 220, height: 400))
        tapGesture = UITapGestureRecognizer(target: self, action: "onTapGesture:")
        let swipeLeftGesture = UISwipeGestureRecognizer(target: self, action: "onSwipeLeft:")
        swipeLeftGesture.direction = UISwipeGestureRecognizerDirection.Left
        let swipeRightGesture = UISwipeGestureRecognizer(target: self, action: "onSwipeRight:")
        swipeRightGesture.direction = UISwipeGestureRecognizerDirection.Right
        let swipeDownGesture = UISwipeGestureRecognizer(target: self, action: "onSwipeDown:")
        swipeDownGesture.direction = UISwipeGestureRecognizerDirection.Down
        container.addGestureRecognizer(swipeLeftGesture)
        container.addGestureRecognizer(swipeRightGesture)
        container.addGestureRecognizer(swipeDownGesture)
        container.addGestureRecognizer(tapGesture)
        //outerContainer.addSubview(container)
        //self.view.addSubview(outerContainer)
        self.beginGame()
    }
    
    func onSwipeLeft(swipeGesture: UISwipeGestureRecognizer){
        if validatePosition(Orient.left){
            currentShape.moveLeft()
        }
    }
    
    func onSwipeRight(swipeGesture: UISwipeGestureRecognizer){
        if validatePosition(Orient.right){
            currentShape.moveRight()
        }
        
    }
    
    func onSwipeDown(gesture:UISwipeGestureRecognizer){
        timer.invalidate()
        timer = nil
        timer = NSTimer.scheduledTimerWithTimeInterval(0.03, target: self, selector: "updateFrame", userInfo: nil, repeats: true)
    }
    
    func onTapGesture(gesture: UITapGestureRecognizer){
        currentShape.rotate()
        timer.timeInterval
    }
    
    func beginGame(){
        self.createShape()
        timer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: "updateFrame", userInfo: nil, repeats: true)
    }
    
    func createShape(){
        currentShape = Shape.random(4, startingRow: 0)
        currentShape.drawShape()
        container.addSubview(currentShape)
    }
    
    func updateFrame(){
        //move down 1 blockSize
        if !detectImpact(){
            currentShape.moveDown()
        }
        else{ //got Impacted
            //create new shape
            for block in currentShape.blocks{
                Singleton.shared.blockArray[block.column, block.row] = block
            }
            self.checkCompletedRow()
            self.createShape()
            timer.invalidate()
            timer = nil
            timer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: "updateFrame", userInfo: nil, repeats: true)
        }
    }
    
    func detectImpact() -> Bool{
        for bottomBlock in currentShape.blocks {
            if bottomBlock.row == NumRows - 1 || Singleton.shared.blockArray[bottomBlock.column, bottomBlock.row + 1] != nil {
                return true
            }
        }
        return false
    }
    
    func checkCompletedRow(){
        var completedLine = Array<Array<Block>>()
        for var row = NumRows - 1; row > 0; row-- {
            var rowOfBlocks = Array<Block>()
            for column in 0..<NumColumns {
                if let block = Singleton.shared.blockArray[column, row] {
                    rowOfBlocks.append(block)
                }
            }
            let count = rowOfBlocks
            if rowOfBlocks.count == NumColumns {
                completedLine.append(rowOfBlocks)
                for block in rowOfBlocks {
                    Singleton.shared.blockArray[block.column, block.row] = nil
                    block.removeFromSuperview()
                }
//                for view in self.container.subviews{
//                    let shape = view as Shape
//                    var frame = shape.frame
//                    frame = CGRect(x: frame.origin.x, y: frame.origin.y + CGFloat(BlockSize), width: frame.size.width, height: frame.size.height)
//                    shape.frame = frame
//                    shape.row = shape.row + 1
//                    for block in shape.blocks{
//                        block.row = block.row + 1
//                    }
//                }
                var fallenBlocks = Array<Array<Block>>()
                for column in 0..<NumColumns {
                    var fallenBlocksArray = Array<Block>()
                    for var row = completedLine[0][0].row - 1; row > 0; row-- {
                        if let block = Singleton.shared.blockArray[column, row] {
                            var newRow = row
                            while (newRow < NumRows - 1 && Singleton.shared.blockArray[column, newRow + 1] == nil) {
                                newRow++
                            }
                            block.row = newRow
                            Singleton.shared.blockArray[column, row] = nil
                            Singleton.shared.blockArray[column, newRow] = block
                            fallenBlocksArray.append(block)
                        }
                    }
                    if fallenBlocksArray.count > 0 {
                        fallenBlocks.append(fallenBlocksArray)
                        for block in fallenBlocksArray{
                            var frame = block.frame
                            frame = CGRect(x: frame.origin.x, y: frame.origin.y + CGFloat(BlockSize), width: frame.size.width, height: frame.size.height)
                            block.frame = frame
                        }
                    }
                }
                
                checkCompletedRow()

            }
        }
        
        
        if completedLine.count == 0 {
            return
        }
        
        
        

        
    }
    
    func dropShapesAboveCompletedLine(atRow: Int){
        
    }
    
    func validatePosition(orient: Orient) -> Bool{
        var param:Int = 0
        switch orient{
        case .left:
            param = -1
        case .right:
            param = 1
        default:
            param = 0
        }
        for block in currentShape.blocks {
            if block.column + param < 0 || block.column + param >= NumColumns {
                return false
            } else if Singleton.shared.blockArray[block.column + param, block.row] != nil {
                return false
            }
        }
        return true
    }
    
}


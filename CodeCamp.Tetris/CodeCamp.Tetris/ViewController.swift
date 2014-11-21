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
    
    var timer:NSTimer!
    
    var container: UIView!
    
    var currentShape: Shape!
    
    var tapGesture:UITapGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Singleton.shared.blockArray = Array2D<Block>(columns: NumColumns, rows: NumRows)
        
        let outerContainer = UIView(frame: CGRect(x: OffsetX , y: OffsetY, width: 202, height: 402))
        outerContainer.layer.borderColor = UIColor.grayColor().CGColor
        outerContainer.layer.borderWidth = 2.0
        
        container = UIView(frame: CGRect(x: 2, y: 2, width: 200, height: 400))
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
        outerContainer.addSubview(container)
        self.view.addSubview(outerContainer)
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
        //        currentShape = ShapeLine()
        //        currentShape.column = 4
        //        currentShape.row = 0
        //        currentShape.orient = Orient.top
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
            self.createShape()
            timer.invalidate()
            timer = nil
            timer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: "updateFrame", userInfo: nil, repeats: true)
        }
    }
    
    func detectImpact() -> Bool{
        for bottomBlock in currentShape.bottomBlocks {
            if bottomBlock.row == NumRows - 1 || Singleton.shared.blockArray[bottomBlock.column, bottomBlock.row + 1] != nil {
                return true
            }
        }
        return false
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


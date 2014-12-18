//
//  MainVC.swift
//  BrickSwift
//
//  Created by Adam on 8/9/14.
//  Copyright (c) 2014 Adam. All rights reserved.
//

import UIKit
import Foundation
import AVFoundation
import MediaPlayer
class Brick : UIView {
    //0: brick must invisible or remove from super view, 1: red, 2: yellow, 3: green
    var score: Int = 0 {
        didSet {
            switch (score) {
            case 1:
                self.backgroundColor = UIColor.redColor()
            case 2:
                self.backgroundColor = UIColor.yellowColor()
            case 3:
                self.backgroundColor = UIColor.blueColor()
            default:
                self.hidden = true
            }
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
class Level {
    var columns: Int
    var rows: Int
    var map: [Int]
    init (cols: Int, rows: Int, map: [Int] = []) {
        self.rows = rows
        self.columns = cols
        if map.count != cols * rows {
            self.map = [Int]()
            for var i = 0; i < cols * rows; i++ {
                self.map.append(1 + Int(arc4random_uniform(3)))
            }
        } else {
            self.map = map
        }
    }
}
class MainVC: UIViewController, AVAudioPlayerDelegate {

    @IBOutlet weak var bar: UIImageView!
    @IBOutlet weak var ball: UIImageView!
    
    var _timer: NSTimer!
    var _vX: CGFloat!
    var _vY: CGFloat!
    var time: Double!
    var start = false
    var gameOver = false
    var countHitBrick: Int = 0

    var bricks = [Brick]()
 
    var level: Level!
    var ballSize: CGSize!
    var ballRadius: CGFloat!
    var barHalfWidth: CGFloat!
    var screenHeight, screenWidth: CGFloat!
    var brickWidth, brickHeight: CGFloat!
    var originalBarFrame, originalBallFrame: CGRect!
    
    var audioPlayer: AVAudioPlayer!
    var touchBrick: SystemSoundID = 0
    var die: SystemSoundID = 0
    var victory: SystemSoundID = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        ballSize = ball.bounds.size
        ballRadius = ballSize.width * 0.5
        barHalfWidth = bar.bounds.size.width * 0.5
        screenHeight = view.bounds.size.height
        screenWidth = view.bounds.size.width
        
        bar.addGestureRecognizer(UIPanGestureRecognizer(target: self, action:"onDragBar:"))
        originalBallFrame = ball.frame
        originalBarFrame = bar.frame
        setUpVariables()
        setupLevel()
        createBricks()
        setupSound()
    }
    func setUpVariables() {
        gameOver = false
        start = false
        countHitBrick = 0
        //Configure default velocity. Need to randomize it
        _vX = 0.1 + (CGFloat(arc4random_uniform(30)) - 15.0) / 10.0
        _vX = abs(_vX) < 0.5 ? -1.5: _vX
        _vY = -1.0 - CGFloat(Float(arc4random_uniform(20)) / 10.0)
        
        time = 0.01
        if bricks.count > 0 {
            for brick in bricks {
                brick.removeFromSuperview()
            }
            bricks.removeAll(keepCapacity: true)
        }
    }
    func setupLevel() {
        let map =  [1,1,2,1,
                    2,3,3,2,
                    2,3,3,2,
                    2,3,3,2,
                    1,1,1,3,
                    1,1,1,1,
                    1,1,1,1,
                    1,3,2,1] as [Int];
        level = Level(cols: 5, rows: 8, map: [])
    }
    func setupSound() {
        let mainBundle = NSBundle.mainBundle()
        // Background music
        var soundFilePath = mainBundle.pathForResource("soundBackground", ofType: "mp3")
        
        var fileData = NSData(contentsOfFile: soundFilePath!, options: NSDataReadingOptions.allZeros, error: nil)
        self.audioPlayer = AVAudioPlayer(data: fileData, error: NSErrorPointer())
        self.audioPlayer.delegate = self
        self.audioPlayer.numberOfLoops = -1
        self.audioPlayer.play()
        //âm thanh trong game
        var soundX = NSURL.fileURLWithPath(mainBundle.pathForResource("touchBrick", ofType: "wav")!)
        AudioServicesCreateSystemSoundID(soundX, &touchBrick)
    }
    
 
    func createBricks(){
        let topBrickWall:CGFloat = 60
        let hMargin:CGFloat = 15
        let vMargin:CGFloat = 30
        brickWidth = (screenWidth - CGFloat(level.columns + 1) * hMargin) / CGFloat(level.columns)
        brickHeight = 10
        
        for var i = 0; i < level.rows; i++ {
            for var j = 0; j < level.columns; j++ {
                let brickFrame = CGRect(x: hMargin * CGFloat(j+1) + brickWidth * CGFloat(j),
                    y: topBrickWall + CGFloat(i) * vMargin,
                    width: brickWidth,
                    height: brickHeight)
                let brick = Brick(frame: brickFrame)
                brick.score = level.map[i * level.columns + j]
                bricks.append(brick)
                view.addSubview(brick)
            }
        }
    }
    func onDragBar (gestureRecognizer:UIPanGestureRecognizer){
        start = true
        if start { //di chuyển thanh hứng thì mới bắt đầu
            if _timer == nil {
                _timer = NSTimer.scheduledTimerWithTimeInterval(NSTimeInterval(time), target: self, selector: "animate:", userInfo: nil, repeats: true)
            }
            
            if gestureRecognizer.state == UIGestureRecognizerState.Began || gestureRecognizer.state == UIGestureRecognizerState.Changed {
                var piece = gestureRecognizer.view!
                var translation = gestureRecognizer.translationInView(piece.superview!)
                piece.center = CGPointMake(piece.center.x + translation.x, piece.center.y)
                gestureRecognizer.setTranslation(CGPointZero, inView: piece.superview)
            }
        }
    }

    
    //Animate ball
    func animate(theTimer:NSTimer){
        var newX = ball.center.x + _vX
        var newY = ball.center.y + _vY
        if newX < ballRadius || newX > view.bounds.size.width  - ballRadius {
            //Đập tường trái, phải
            _vX = -_vX
        
        }
        if newY < ballRadius {
            //Đập trên cùng
            _vY = -_vY
        }
        if newY > view.bounds.size.height - ballRadius {
            // dap vao tuong duoi gameover
            ball.hidden = true
            gameOver = true
            _timer.invalidate()
            _timer = nil
            showResult()
            return
            
        }
        if  (newX <= bar.center.x + barHalfWidth) &&
            (newX >= bar.center.x - barHalfWidth) &&
            (_vY > 0) &&
            (newY + ballRadius >= bar.center.y - bar.bounds.size.height * 0.5) {
            _vY = -_vY;
        
        }
        
        newX = ball.center.x + _vX
        newY = ball.center.y + _vY

        ball.center = CGPoint(x:newX, y:newY)
        ballCollideBricks()
        
    }
    
   
    func ballCollideBricks() {
        if countHitBrick == bricks.count { // đập hết gạch
            _timer.invalidate()
            _timer = nil
            gameOver = false
            showResult()
        }
        
        for brick in bricks {
            if brick.score == 0 {
                continue
            }
            var brickRect = brick.frame as CGRect
            brickRect.inset(dx: -ballRadius, dy: -ballRadius)
            if brickRect.contains(ball.center)
            {
                AudioServicesPlaySystemSound(touchBrick)
                brick.score = brick.score - 1
                _vY = -_vY
                if brick.score == 0 {
                    countHitBrick = countHitBrick + 1
                    //Fun logic when countHitBrick increase, increase velocity
                    let oneThirdBrickCounts = CGFloat(bricks.count) * 0.3
                    if countHitBrick > Int(oneThirdBrickCounts) {
                        let increase = sqrt(CGFloat(countHitBrick) / oneThirdBrickCounts)
                        _vX = _vX * increase
                        _vY = _vY * increase
                    }
                }
            }
        }

    }
    func showResult(){
        self.audioPlayer.pause()
        if gameOver {
            let alert = UIAlertController(title: "Game over", message: "To continue playing, hit 'Play Again'", preferredStyle: UIAlertControllerStyle.Alert)
            let continuePlayAction = UIAlertAction(title: "Play again", style: UIAlertActionStyle.Default, handler: { (_) -> Void in
                self.resetGame()
            })
            let cancelAction = UIAlertAction(title: "End Game", style: UIAlertActionStyle.Cancel, handler:{ (_) -> Void in
                    self.dismissViewControllerAnimated(true, completion: nil)
                }
            )
            alert.addAction(continuePlayAction)
            alert.addAction(cancelAction)
            self.presentViewController(alert, animated: true, completion: nil)
           
        } else {
            var alert = UIAlertView(title: "Congratulation", message: "Victory", delegate: self, cancelButtonTitle: "OK")
            alert.show()
        }
    }
    
    func resetGame() {
        ball.frame = originalBallFrame
        ball.hidden = false
        bar.frame = originalBarFrame
        
        setUpVariables()
        setupLevel()
        createBricks()
    }
}

//
//  ViewController.swift
//  RandomPhoto
//
//  Created by Khiem Ngo Viet on 11/3/14.
//  Copyright (c) 2014 Khiem Ngo Viet. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UIGestureRecognizerDelegate {
    
    @IBOutlet var trashButton: UIButton!
    
    var photos = [UIImage(named: "01.jpg"),
        UIImage(named: "02.jpg"),
        UIImage(named: "03.jpg"),
        UIImage(named: "04.jpg"),
        UIImage(named: "05.jpg"),
        UIImage(named: "06.jpg"),
        UIImage(named: "07.jpg"),
        UIImage(named: "08.jpg"),
        UIImage(named: "09.jpg"),
        UIImage(named: "10.jpg")]
    var audioPlayer:AVAudioPlayer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let filePath = NSBundle.mainBundle().pathForResource("empty trash", ofType: "aif")
        let url = NSURL(fileURLWithPath: filePath!)
        self.audioPlayer = AVAudioPlayer(contentsOfURL: url, error: nil)
        self.audioPlayer.prepareToPlay()
    }
    
    
    @IBAction func handleTap(sender: UITapGestureRecognizer) {
        let index = Int(rand() % 8)
        let aPhoto = UIImageView(image: self.photos[index])
        aPhoto.center = sender.locationInView(self.view)
        aPhoto.makeItCool()
        aPhoto.addGestureRecognizer()
        self.view.addSubview(aPhoto)
        self.view.bringSubviewToFront(self.trashButton)
    }
    
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldReceiveTouch touch: UITouch) -> Bool {
        if touch.view == trashButton{
            return false
        }
        else{
            return true
        }
    }
    
    @IBAction func clickOnTrash(sender: UIButton) {
        for view in self.view.subviews {
            //if(view.tag != trashButton.tag) cach nay khong hay
            if view.isMemberOfClass(UIImageView.classForCoder())
            {
                audioPlayer.play()
                
                UIView.animateWithDuration(1, animations:  {() in
                    (view as UIImageView).center = self.trashButton.center
                    let transform = CGAffineTransformMakeScale(0.1, 0.1)
                    (view as UIImageView).transform = transform
                    (view as UIImageView).alpha = 0.1
                    }, completion:{(Bool)  in
                        view.removeFromSuperview()
                })
            }
        }
        
    }
    
}
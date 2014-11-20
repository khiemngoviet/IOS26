//
//  InfinitiScroll.swift
//  ScrollInSwift
//
//  Created by Trung on 8/25/14.
//  Copyright (c) 2014 vn.Techmsater. All rights reserved.
//

import Foundation
import UIKit
enum ScrollDirection: Int {
    case Horizontal
    case Vertical
}
class InfinitiScroll: UIViewController, UIScrollViewDelegate {
    
    weak var scrollView: UIScrollView!
    var scrollDirection: ScrollDirection!
    
    
    override func viewDidLoad() {
        self.initScrollView()
    }
    
    override func viewWillDisappear(animated: Bool) {
        self.scrollView.delegate = nil
    }
    func initScrollView() {
        var scrollView = UIScrollView(frame: self.view.frame)
        scrollView.delegate = self
        self.view .addSubview(scrollView)
        self.scrollView = scrollView
        
        self.scrollDirection = ScrollDirection.Horizontal
        if self.scrollDirection == .Horizontal {
            scrollView.contentSize = CGSizeMake(CGFloat(NUM_PHOTO + 2) * PHOTO_WIDTH, PHOTO_HEIGHT)
        }else {
            scrollView.contentSize = CGSizeMake(PHOTO_WIDTH, CGFloat(NUM_PHOTO + 2) * PHOTO_HEIGHT)
        }
        
        self.addPhoto(self.fileByIndex(NUM_PHOTO), index: 0)
        
        for var i = 1; i < NUM_PHOTO + 1; i++ {
            self.addPhoto(self.fileByIndex(i), index: i)
        }
        self.addPhoto(self.fileByIndex(1), index: NUM_PHOTO + 1)
        
        self.scrollView .scrollRectToVisible(CGRectMake(PHOTO_WIDTH, 0, PHOTO_WIDTH, PHOTO_HEIGHT), animated: false)
        
    }
    
    func fileByIndex(index: Int) -> NSString {
        var test = NSString(format: "%d.jpg", index)
        return test
    }
    
    func addPhoto(file: NSString, index: Int){
        var photo = UIImageView(image: UIImage(named: file))
        if self.scrollDirection == .Horizontal {
            photo.frame = CGRectMake(CGFloat(index) * PHOTO_WIDTH, 0, PHOTO_WIDTH, PHOTO_HEIGHT)
        }else {
            photo.frame = CGRectMake(0, CGFloat(index) * PHOTO_HEIGHT, PHOTO_WIDTH, PHOTO_HEIGHT)
        }
        self.scrollView.addSubview(photo)
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView!) {
        var rect:CGRect!
        println(self.scrollView.contentOffset)
        
        if self.scrollDirection == .Horizontal {
            if self.scrollView.contentOffset.x <= 0 {
                rect = CGRectMake(PHOTO_WIDTH, 0, PHOTO_WIDTH, PHOTO_HEIGHT)
            }else if self.scrollView.contentOffset.x >= CGFloat(NUM_PHOTO) * PHOTO_WIDTH {
                rect = CGRectMake(PHOTO_WIDTH, 0, PHOTO_WIDTH, PHOTO_HEIGHT)
            }
            else{
                return
            }
        }else {
            if self.scrollView.contentOffset.y <= 0 {
                rect = CGRectMake(0, CGFloat(NUM_PHOTO) * PHOTO_HEIGHT, PHOTO_WIDTH, PHOTO_HEIGHT)
            }else if self.scrollView.contentOffset.y >= CGFloat(NUM_PHOTO) * PHOTO_HEIGHT {
                rect = CGRectMake(0, PHOTO_HEIGHT, PHOTO_WIDTH, PHOTO_HEIGHT)
            }
        }
        
        self.scrollView.scrollRectToVisible(rect, animated: false)
    }
}
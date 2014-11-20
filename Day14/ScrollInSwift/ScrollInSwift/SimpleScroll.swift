//
//  SimpleScroll.swift
//  ScrollInSwift
//
//  Created by Trung on 8/25/14.
//  Copyright (c) 2014 vn.Techmsater. All rights reserved.
//

import Foundation
import UIKit


let PHOTO_WIDTH:CGFloat = 320
let PHOTO_HEIGHT:CGFloat = 480
let NUM_PHOTO = 6
class SimpleScroll: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    override func viewDidLoad() {
        self.scrollView.delegate = self
        self.scrollView.contentSize = CGSizeMake(PHOTO_WIDTH * CGFloat(NUM_PHOTO), PHOTO_HEIGHT)
        self.scrollView.pagingEnabled = true
        
        for var i = 1; i < NUM_PHOTO + 1; i++ {
            var fileName = String(format: "%d.jpg", i)
            var image = UIImage(named: fileName)
            var imageView = UIImageView(image: image)
            imageView.frame = CGRectMake(CGFloat(i - 1) * PHOTO_WIDTH, 0, PHOTO_WIDTH, PHOTO_HEIGHT)
            
            self.scrollView.addSubview(imageView)
        }
        self.pageControl.numberOfPages = NUM_PHOTO
    }
    
    override func viewWillDisappear(animated: Bool) {
        self.scrollView.delegate = nil
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView!) {
        self.pageControl.currentPage = Int(self.scrollView.contentOffset.x / PHOTO_WIDTH)
    }
    
    @IBAction func onPageChange(sender: AnyObject) {
        self.scrollView.contentOffset = CGPointMake(CGFloat(self.pageControl.currentPage) * PHOTO_WIDTH, 0)
    }
    
    
}
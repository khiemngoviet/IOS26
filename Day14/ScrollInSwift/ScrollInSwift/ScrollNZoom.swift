//
//  ScrollNZoom.swift
//  ScrollInSwift
//
//  Created by ios26 on 11/17/14.
//  Copyright (c) 2014 vn.Techmsater. All rights reserved.
//

import UIKit

class ScrollNZoom: UIViewController, UIScrollViewDelegate {

    weak var scrollView: UIScrollView!
    var viewRect: CGRect!
    var viewHeight: CGFloat!
    var viewWidth: CGFloat!
    var imageSet = ["photo1.jpeg","photo2.jpeg","photo3.jpeg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewRect = self.view.bounds
        self.viewWidth = viewRect.size.width
        self.viewHeight = viewRect.size.height
        
        self.initScrollView()
    }

    func initScrollView() {
        var scrollView = UIScrollView(frame: viewRect)
        scrollView.delegate = self
        scrollView.pagingEnabled = true
        scrollView.contentSize = CGSizeMake(CGFloat(3) * self.viewWidth, self.viewHeight)
        
        self.view.addSubview(scrollView)
        self.scrollView = scrollView
        
        for var i = 0; i < 3; i++ {
            self.addNestedScrollViewAtIndex(i)
        }
    }
    
    func addNestedScrollViewAtIndex(index: Int) {
        var subScrollView = UIScrollView(frame: CGRectMake(CGFloat(index) * self.viewWidth, 0, self.viewWidth, self.viewHeight))
        subScrollView.minimumZoomScale = 0.25
        subScrollView.maximumZoomScale = 4.0
        subScrollView.delegate = self
        let imageView = UIImageView(image: UIImage(named: imageSet[index]))
        imageView.frame = CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height)
        imageView.contentMode = UIViewContentMode.ScaleAspectFill
        subScrollView.addSubview(imageView)
        self.scrollView.addSubview(subScrollView)
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
       return scrollView.subviews[0] as? UIView
    }
    
}

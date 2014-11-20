//
//  NestedScroll.swift
//  ScrollInSwift
//
//  Created by Trung on 8/25/14.
//  Copyright (c) 2014 vn.Techmsater. All rights reserved.
//

import Foundation
import UIKit

class NestedScroll: UIViewController, UIScrollViewDelegate {
    var viewRect: CGRect!
    var viewHeight: CGFloat!
    var viewWidth: CGFloat!
    var colors: NSArray!
    
    weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        self.viewRect = self.view.bounds
        self.viewWidth = viewRect.size.width
        self.viewHeight = viewRect.size.height
        
        colors = ["#5E412F", "#FCEBB6", "#78C0A8", "#F07818", "#F0A830","#5E412F"]
        self.initScrollView()
    }
    
    func initScrollView() {
        var scrollView = UIScrollView(frame: viewRect)
        scrollView.delegate = self
        scrollView.pagingEnabled = true
        scrollView.contentSize = CGSizeMake(CGFloat(NUM_PHOTO) * self.viewWidth, self.viewHeight)
        
        self.view.addSubview(scrollView)
        self.scrollView = scrollView
        
        for var i = 0; i < NUM_PHOTO; i++ {
            self.addNestedScrollViewAtIndex(i)
        }
    }
    
    func addNestedScrollViewAtIndex(index: Int) {
        var subScrollView = UIScrollView(frame: CGRectMake(CGFloat(index) * self.viewWidth, 0, self.viewWidth, self.viewHeight))
        subScrollView.pagingEnabled = true
//        subScrollView.backgroundColor = UIColor.initByHexString(colors[index] as NSString, alpha: 1.0)
        subScrollView.backgroundColor = UIColor(rgba: colors[index] as NSString)
        var numViews = Int(arc4random() % 8) + 1
        subScrollView.contentSize = CGSizeMake(self.viewWidth, self.viewHeight * CGFloat(numViews))
        
        for var j = 0; j < numViews; j++ {
            var label = UILabel(frame: CGRectMake(0, 0, 300, 80))
            label.center = CGPointMake(self.viewWidth * 0.5, CGFloat(j) * self.viewHeight + self.viewHeight * 0.5)
            label.text = "\(index)-\(j)"
            label.textAlignment = NSTextAlignment.Center
            label.font = UIFont(name: "Courier", size: 42)
            subScrollView.addSubview(label)
        }
        self.scrollView.addSubview(subScrollView)
    }
    
 
}
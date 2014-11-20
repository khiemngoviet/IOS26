//
//  SimpleZoom.swift
//  ScrollInSwift
//
//  Created by Trung on 8/25/14.
//  Copyright (c) 2014 vn.Techmsater. All rights reserved.
//
import UIKit
import Foundation

class SimpleZoom: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        scrollView.minimumZoomScale = 0.25
        scrollView.maximumZoomScale = 4.0
    }
    
    
    func viewForZoomingInScrollView(scrollView: UIScrollView!) -> UIView! {
        return imageView
    }
    
    func scrollViewDidZoom(scrollView: UIScrollView) {
       //println(NSString(format: "%2.2f", Double(scrollView.zoomScale)))
       println("\(scrollView.contentSize.width) - \(scrollView.contentSize.height)")
    }
    
    override func didReceiveMemoryWarning() {
        
    }
}

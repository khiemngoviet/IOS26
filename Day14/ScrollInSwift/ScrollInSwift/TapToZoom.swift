//
//  TapToZoom.swift
//  ScrollInSwift
//
//  Created by Trung on 8/25/14.
//  Copyright (c) 2014 vn.Techmsater. All rights reserved.
//

import Foundation
import UIKit

let ZOOM_STEP:CGFloat = 2
class TapToZoom: UIViewController, UIScrollViewDelegate, UIGestureRecognizerDelegate {
    weak var scrollView: UIScrollView!
    weak var photo: UIImageView!
    weak var scaleLabel: UILabel!
    
    override func viewDidLoad() {
        // Chu y phai tao local pointer truoc, khong gan truc tiep doi tuong vao weak property
        var scrollView = UIScrollView(frame: self.view.frame)
        scrollView.delegate = self
        scrollView.minimumZoomScale = 0.1
        scrollView.maximumZoomScale = 10
        scrollView.clipsToBounds = true
        
        var photo = UIImageView(frame: scrollView.frame)
        photo.image = UIImage(named: "playboy.jpg")
        photo.contentMode = UIViewContentMode.ScaleAspectFit
        // Enabler user interaction
        photo.userInteractionEnabled = true
        photo.multipleTouchEnabled = true
        
        var singleTap = UITapGestureRecognizer(target: self, action: "onTap:")
        singleTap.numberOfTapsRequired = 1
        singleTap.delegate = self
        photo.addGestureRecognizer(singleTap)
        
        var doubleTap = UITapGestureRecognizer(target: self, action: "onDoubleTap:")
        doubleTap.numberOfTapsRequired = 2
        doubleTap.delegate = self
        photo.addGestureRecognizer(doubleTap)
        
        // Chu y den cau lenh duoi
        
        singleTap.requireGestureRecognizerToFail(doubleTap)
        
        scrollView.addSubview(photo)
        self.view.addSubview(scrollView)
        
        // Sau khi scrollView duoc gan vao view cha, co con tro strong thi ta moi gan vao weak property
        self.scrollView = scrollView
        self.photo = photo
        
        var scaleLabel = UILabel(frame: CGRectMake(0, 0, 60, 40))
        scaleLabel.textAlignment = NSTextAlignment.Right
        scaleLabel.text = NSString(format: "%2.2f", scrollView.zoomScale)
        
        var barbutton = UIBarButtonItem(customView: scaleLabel)
        self.navigationItem.setRightBarButtonItem(barbutton, animated: true)
        self.scaleLabel = scaleLabel
        
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView!) -> UIView! {
        return self.photo
    }
    
    func onTap(sender: UITapGestureRecognizer) {
        var tapPoint = sender.locationInView(self.photo)
        var newScale = self.scrollView.zoomScale * ZOOM_STEP
        self.zoomRectForScale(newScale, center: tapPoint)
    }
    
    func onDoubleTap(sender: UITapGestureRecognizer){
        var newScale = self.scrollView.zoomScale / ZOOM_STEP
        self.zoomRectForScale(newScale, center: sender.locationInView(self.photo))
    }
    func zoomRectForScale(scale:CGFloat, center:CGPoint){
        var zoomRect: CGRect = CGRect()
        
        var scrollViewSize = self.scrollView.bounds.size
        zoomRect.size.height = scrollViewSize.height / scale
        zoomRect.size.width = scrollViewSize.width / scale
        
        zoomRect.origin.x = center.x - ( zoomRect.size.width / 2.0)
        zoomRect.origin.y = center.y - ( zoomRect.size.height / 2.0)
        
        self.scrollView.zoomToRect(zoomRect, animated: true)
        self.scaleLabel.text = "\(self.scrollView.zoomScale)"
    }
}
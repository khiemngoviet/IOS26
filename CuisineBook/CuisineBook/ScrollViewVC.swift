//
//  ScrollViewVC.swift
//  CuisineBook
//
//  Created by Khiem Ngo Viet on 11/19/14.
//  Copyright (c) 2014 Khiem Ngo Viet. All rights reserved.
//

import UIKit

class ScrollViewVC: UIViewController {

    var images = ["Food1.jpg","Food2.jpg","Food3.jpg",]
    @IBOutlet var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.scrollView.contentSize = CGSize(width: 3 * scrollView.frame.size.width, height: scrollView.frame.size.height)
        self.scrollView.pagingEnabled = true
        var x: CGFloat = 0.0
        var scrollSize = scrollView.frame.size
        let widths = scrollSize.width
        for i in 0...2 {
            var imageView = UIImageView(image: UIImage(named: images[i]))
            imageView.frame = CGRect(x: x, y: 0, width: widths, height: scrollSize.height)
            imageView.contentMode = UIViewContentMode.ScaleToFill
            self.scrollView.addSubview(imageView)
            x += scrollSize.width
        }

    }

    

}

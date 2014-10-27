//
//  RatingView.swift
//  UIViewControls
//
//  Created by Khiem Ngo Viet on 10/27/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class RatingView: UIImageView {

    var fullWidth:CGFloat!
    
    var value: CGFloat?{
        didSet{
            self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, fullWidth * value! / 5, self.frame.size.height);
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        fullWidth = self.bounds.size.width
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}

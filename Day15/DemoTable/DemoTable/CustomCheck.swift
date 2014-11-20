//
//  CustomCheck.swift
//  DemoTable
//
//  Created by cuong minh on 11/8/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class CustomCheck: UIImageView {
    var checked: Bool = false {
        didSet{
            if checked {
                self.image = self.checkImage
            } else {
                self.image = self.noncheckImage
            }
        }
    }
    var noncheckImage: UIImage
    var checkImage: UIImage
    
    init (noncheck: UIImage, check: UIImage) {
        noncheckImage = noncheck
        checkImage = check
        super.init(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: check.size))
        self.image = noncheck
        self.userInteractionEnabled = true        
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

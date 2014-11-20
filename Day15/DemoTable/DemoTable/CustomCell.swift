//
//  CustomCell.swift
//  DemoTable
//
//  Created by cuong minh on 11/7/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var thumb: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var score: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

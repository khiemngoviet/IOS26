//
//  TableViewCell.swift
//  CodeCamp.STM
//
//  Created by ios26 on 11/23/14.
//  Copyright (c) 2014 ios26. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var photoProfile: UIImageView!
    @IBOutlet var fullName: UILabel!
    @IBOutlet var score: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        photoProfile.layer.cornerRadius = photoProfile.frame.size.width/2
        photoProfile.layer.borderWidth = 3
        photoProfile.layer.borderColor = UIColor.whiteColor().CGColor
        photoProfile.clipsToBounds = true
        self.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
    }

    
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

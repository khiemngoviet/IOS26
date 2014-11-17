//
//  TableViewCell.swift
//  CuisineBook
//
//  Created by Khiem Ngo Viet on 11/16/14.
//  Copyright (c) 2014 Khiem Ngo Viet. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    @IBOutlet var profileImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        profileImageView.layer.cornerRadius = profileImageView.frame.size.width/2
        profileImageView.layer.borderWidth = 3.0
        profileImageView.layer.borderColor = UIColor.whiteColor().CGColor
        profileImageView.clipsToBounds = true
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

//
//  AccountCell.swift
//  CodeCamp.MoneyKeeper
//
//  Created by Khiem Ngo Viet on 12/6/14.
//  Copyright (c) 2014 Khiem Ngo Viet. All rights reserved.
//

import UIKit

class AccountCell: UITableViewCell {

    
    @IBOutlet var accountNameLable: UILabel!
    @IBOutlet var remainAmountLabel: UILabel!
    @IBOutlet var originAmountLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

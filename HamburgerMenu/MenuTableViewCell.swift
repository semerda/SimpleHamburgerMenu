//
//  MenuTableViewCell.swift
//  HamburgerMenu
//
//  Created by Ernest on 11/5/16.
//  Copyright © 2016 Purpleblue Pty Ltd. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    
    @IBOutlet weak var menuTitleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

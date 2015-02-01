//
//  FriendDetailTableViewCell.swift
//  HelloClock
//
//  Created by soslab on 2015/1/31.
//  Copyright (c) 2015年 nccu. All rights reserved.
//

import UIKit

class FriendDetailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var fieldLabel:UILabel!
    @IBOutlet weak var valueLabel:UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

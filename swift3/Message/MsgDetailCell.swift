//
//  MsgDetailCell.swift
//  swift3
//
//  Created by eims1 on 16/5/17.
//  Copyright © 2016年 sky. All rights reserved.
//

import UIKit

class MsgDetailCell: UITableViewCell {

    @IBOutlet weak var TimeLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var HeadImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

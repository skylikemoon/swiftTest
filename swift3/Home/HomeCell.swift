//
//  HomeCell.swift
//  swift3
//
//  Created by eims1 on 16/5/13.
//  Copyright © 2016年 sky. All rights reserved.
//

import UIKit

class HomeCell: UITableViewCell {
    let titleLabel = UILabel()
    let imgView = UIImageView()
    var listID = NSString()
    var contentTableView = UITableView()
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        imgView.frame = CGRectMake(0, 0, self.frame.width, self.frame.height)
        imgView.image = UIImage.init(named: "as")
        self.contentView.addSubview(imgView)
        
        titleLabel.frame = CGRectMake(0, 0, self.frame.width, self.frame.height)
        titleLabel.textAlignment = NSTextAlignment.Center
        titleLabel.textColor = UIColor.brownColor()
        titleLabel.text = "Alvaro Soler"
        contentView.addSubview(titleLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

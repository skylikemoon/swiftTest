//
//  CustomCycleCell.swift
//  swift3
//
//  Created by eims1 on 16/6/2.
//  Copyright © 2016年 sky. All rights reserved.
//

import UIKit

class CustomCycleCell: UICollectionViewCell {
    var urlImage:NSString!
    var imageView = UIImageView()
    var labelTile = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.createSubview(frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createSubview(frame:CGRect){
        imageView = UIImageView.init(frame: CGRectMake(0, 0, frame.size.width, frame.size.height))
        self.contentView.addSubview(imageView)
        
        labelTile = UILabel.init(frame: CGRectMake(10, 10, 100, 40))
        labelTile.textColor = UIColor.whiteColor()
        imageView.addSubview(labelTile)
    }
    
    
    

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}

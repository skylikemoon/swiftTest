//
//  SqrTitleScrollView.swift
//  swift3
//
//  Created by eims1 on 16/5/20.
//  Copyright © 2016年 sky. All rights reserved.
//

import UIKit

protocol TitleScrollViewDelegate:NSObjectProtocol {
    func TitleScrollViewClick(clickIndex:Int)
}

class TitleView: UIView {
    
    var currentIndex:Int = 0
    var titleArray = NSArray()
    var lineView:UIView?
    var titleDelegate:TitleScrollViewDelegate?
    var fontSize:CGFloat = 0.0
    var nomarlColor :UIColor?
    var selectedColor : UIColor?
    var labelWidth:CGFloat = 0.0
    
    init(title:NSArray,norColor:UIColor,selColor:UIColor,font:CGFloat,frame:CGRect)
    {
        self.init()
        self.backgroundColor = UIColor.whiteColor()

        self.titleArray = title
        self.nomarlColor = norColor
        self.selectedColor = selColor
        self.fontSize = font
        self.frame = frame
        self.createSubView(frame)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createSubView(frame:CGRect){
        labelWidth = frame.width/CGFloat(self.titleArray.count)
        for i in 0...self.titleArray.count-1 {
            let btn = UIButton(type: UIButtonType.Custom)
            btn.frame = CGRectMake(CGFloat(i)*labelWidth, 0, labelWidth, frame.height)
            btn.titleLabel?.font = UIFont.systemFontOfSize(fontSize)
            btn.tag = i+100
            btn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
            btn.setTitleColor(UIColor.redColor(), forState: UIControlState.Selected)
            btn.setTitle(titleArray[i] as?String, forState: UIControlState.Normal)
            btn.selected =  btn.tag == 100 ? true:false
            btn.addTarget(self, action: "changeTitle:", forControlEvents: .TouchUpInside)
            self.addSubview(btn)
        
            
        }
        
        lineView = UIView.init(frame: CGRectMake(0, frame.height-2, labelWidth, 2))
        lineView?.backgroundColor = selectedColor
        self.addSubview(lineView!)
        
    }
    
    func setLineViewPosition(btnIndex:Int){
        let btn = self.viewWithTag(100+btnIndex) as? UIButton
        btn?.selected = true
        
        UIView.animateWithDuration(0.2) {
            self.lineView?.center = CGPointMake((btn?.center.x)!, (self.lineView?.center.y)!)
        }
    }

    //MARK:点击button,改变文字颜色，切换成高亮效果
    func changeTitle(sender:UIButton){
        if sender.selected == true {
            return
        }else{
            for view in self.subviews {
                if view .isKindOfClass(UIButton) && view.tag != sender.tag {
                    let unselectedBtn = view as? UIButton
                    unselectedBtn?.selected = false
                    
                }
            }
            
            sender.selected = true
            self.setLineViewPosition(sender.tag-100)
            
            titleDelegate?.TitleScrollViewClick(sender.tag-100)
        }
        
    }


    

}

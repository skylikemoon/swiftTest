//
//  BannerView.swift
//  swift3
//
//  Created by eims1 on 16/5/27.
//  Copyright © 2016年 sky. All rights reserved.
//

import UIKit

private let bannerHeight = SCREEN_HEIGHT/3

class BannerView: UIView,UIScrollViewDelegate {
    var scrollView = UIScrollView()
    var bannarArray = NSArray()
    var timer = NSTimer()
    var pageControl =  UIPageControl()
    var testScro:UIScrollView?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initBannerArray(ImageArray:NSArray){
        
        self.bannarArray = ImageArray
        
        self.creatBannerViewFrame()
    }
    
    func creatBannerViewFrame(){
        

        scrollView.frame = CGRectMake(0, 0, SCREEN_WIDTH, bannerHeight)
        scrollView.delegate = self
        scrollView.pagingEnabled = true
        scrollView.bounces = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.contentSize = CGSizeMake(SCREEN_WIDTH*CGFloat(self.bannarArray.count+2), 0)
        //将scrollView向前偏移一个屏幕的宽度
        scrollView.contentOffset = CGPointMake(SCREEN_WIDTH, 0)
        self.addSubview(scrollView)
        
        //利用 n+2 方法 index=0 前面加最后一张图片     index = count-1 后加第一张图片
        
        //最后一张放到index = 0的位置
        let lastImageView = UIImageView.init(frame: CGRectMake(0, 0, SCREEN_WIDTH, bannerHeight))
        let lastIndex:NSInteger = (self.bannarArray.count)-1
        lastImageView.image = UIImage(named: self.bannarArray[lastIndex] as! String)
        scrollView.addSubview(lastImageView)
        
        //第一张放到index = (self.bannarArray.count)+1 的位置
        let firstIndex:NSInteger = (self.bannarArray.count)+1
        let firstImageView = UIImageView.init(frame: CGRectMake(CGFloat(firstIndex)*SCREEN_WIDTH, 0, SCREEN_WIDTH, bannerHeight))
        firstImageView.image = UIImage(named: self.bannarArray[0] as!String)
        scrollView.addSubview(firstImageView)
        
        //放中间的数组图片
        for i in 0...self.bannarArray.count-1 {
            let imageView = UIImageView.init(frame: CGRectMake(SCREEN_WIDTH*CGFloat(i+1), 0, SCREEN_WIDTH, bannerHeight))
            imageView.image = UIImage(named: self.bannarArray[i] as! String)
            scrollView.addSubview(imageView)
        }
        
        //创建 pageControl
        pageControl.frame = CGRectMake(0, bannerHeight-20, 100, 20)
        pageControl.numberOfPages = self.bannarArray.count
        pageControl.currentPageIndicatorTintColor = UIColor.redColor()
        pageControl.pageIndicatorTintColor = UIColor.lightGrayColor()
        pageControl.currentPage = 0
        self.addSubview(pageControl)
        
        self.startTimer()
    }
    
    func startTimer() {
        self.timer = NSTimer(timeInterval: 2.0,target: self,selector: "changeBannerImage",userInfo: nil,repeats:true)
        
        NSRunLoop.currentRunLoop().addTimer(self.timer, forMode: NSRunLoopCommonModes)
        //NSRunLoopCommonModes  其他类似scollrVIew控件拖动 不会影响timer的执行
        //NSDefaultRunLoopMode  会暂停timer
    }
    
    func removeTimer(){
        self.timer.invalidate()

    }
    
    func changeBannerImage(){

        NSLog("scrollView.contentOffset = %f", scrollView.contentOffset.x)
        
        var item = Int(scrollView.contentOffset.x/SCREEN_WIDTH)
        
        if item == (self.bannarArray.count+1) {
            item = 0
            self.pageControl.currentPage = item

            self.scrollView.contentOffset = CGPointMake(SCREEN_WIDTH, 0)
        }else
        {
        
            self.scrollView.setContentOffset(CGPointMake(CGFloat(item+1)*SCREEN_WIDTH, 0), animated: true)

        }
        self.pageControl.currentPage = item

        

    }
    
    //滑动时对图片的处理
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let pageIndex = Int((scrollView.contentOffset.x-SCREEN_WIDTH)/SCREEN_WIDTH)
        pageControl.currentPage = pageIndex
        
        //如果滑到第一张
        if pageIndex == 0 {
            scrollView.contentOffset = CGPointMake(CGFloat(bannarArray.count)*SCREEN_WIDTH, 0)
            pageControl.currentPage = bannarArray.count-1
            
        }else if pageIndex+1 == bannarArray.count
        {
            //如果滑到最后一张
            scrollView.contentOffset = CGPointMake(SCREEN_WIDTH, 0)
            pageControl.currentPage = 0
        }
    }
    
    //MARK:手势开始滑动时 停止计时器
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        removeTimer()
    }
    //MARK:手势结束滑动时 开始计时器
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        startTimer()
    }
    
    
    
    
    
    
    
    
    

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}

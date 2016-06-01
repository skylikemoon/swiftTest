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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initBannerArray(ImageArray:NSArray){
        
        self.bannarArray = ImageArray
        
        NSLog("bannerArray.count = %d", bannarArray.count)
        self.creatBannerViewFrame()
        
        
    }
    
    func creatBannerViewFrame(){
        
        scrollView.frame = CGRectMake(0, 0, SCREEN_WIDTH, bannerHeight)
        scrollView.delegate = self
        scrollView.pagingEnabled = true
        scrollView.bounces = false
        scrollView.showsHorizontalScrollIndicator = false
        
        //利用 n+2 方法 index=0 前面加最后一张图片     index = count-1 后加第一张图片
        //最后一张放到index = 0的位置
        
        let lastImageView = UIImageView.init(frame: CGRectMake(0, 0, SCREEN_WIDTH, bannerHeight))
        let lastIndex:NSInteger = (self.bannarArray.count)-1
        lastImageView.image = UIImage.init(named: self.bannarArray[lastIndex] as! String)
        scrollView.addSubview(lastImageView)
        
        let firstIndex:NSInteger = (self.bannarArray.count)+1
        
        let firstImageView = UIImageView.init(frame: CGRectMake(CGFloat(firstIndex)*SCREEN_WIDTH, 0, SCREEN_WIDTH, bannerHeight))
        firstImageView.image = UIImage.init(named: self.bannarArray[0] as!String)
        scrollView.addSubview(firstImageView)
        
        for i in 0...self.bannarArray.count-1 {
            let imageView = UIImageView.init(frame: CGRectMake(SCREEN_WIDTH*CGFloat(i+1), 0, SCREEN_WIDTH, bannerHeight))
            imageView.image = UIImage.init(named: self.bannarArray[i] as! String)
            scrollView.addSubview(imageView)
            NSLog("%d", i)
        }
        
        scrollView.contentSize = CGSizeMake(SCREEN_WIDTH*CGFloat(lastIndex+1+2), 0)
        //将scrollView向前偏移一个屏幕的宽度
        scrollView.contentOffset = CGPointMake(SCREEN_WIDTH, 0)
        self.addSubview(scrollView)
        
        //创建 pageControl
        pageControl.frame = CGRectMake(0, bannerHeight-20, 100, 10)
        pageControl.numberOfPages = self.bannarArray.count
        pageControl.currentPageIndicatorTintColor = UIColor.redColor()
        pageControl.pageIndicatorTintColor = UIColor.lightGrayColor()
        pageControl.currentPage = 0
        self.addSubview(pageControl)
        
        
        self.startTimer()
        
    
    }
    
    //changeBannerImage
    func startTimer() {
//        self.timer = NSTimer.init(timeInterval: 4.0, target: self, selector: "changeBannerImage"); userInfo: nil, repeats: true)
//        self.timer = NSTimer.init(timeInterval: 4.0, target: self, selector: "changeBannerImage", userInfo: nil, repeats: true)
        self.timer = NSTimer(timeInterval: 4.0,target: self,selector: "changeBannerImage",userInfo: nil,repeats:true)
        
        NSRunLoop.currentRunLoop().addTimer(self.timer, forMode: NSRunLoopCommonModes)
        //NSRunLoopCommonModes  其他类似scollrVIew控件拖动 不会影响timer的执行
        //NSDefaultRunLoopMode  会暂停timer
    }
    
    func changeBannerImage(){

        NSLog("scrollView.contentOffset = %f", scrollView.contentOffset.x)

        if scrollView.contentOffset.x == CGFloat(self.bannarArray.count+1)*SCREEN_WIDTH {
            scrollView.contentOffset = CGPointMake(SCREEN_WIDTH, 0)
            pageControl.currentPage = 0
        }else
        {
            let pageIndex = Int((scrollView.contentOffset.x-SCREEN_WIDTH)/SCREEN_WIDTH)
            pageControl.currentPage = pageIndex
            
            
            scrollView.setContentOffset(CGPointMake(self.scrollView.contentOffset.x+SCREEN_WIDTH, 0), animated: true)
//            scrollView.setContentOffset(CGPointMake(CGFloat(pageIndex+1)*SCREEN_WIDTH, 0), animated: true)

//            NSLog("scrollView.contentOffset = %lf", offset)
//            NSLog("scrollView.contentOffset = %d", pageIndex)

        }
        NSLog("pageControl.currentPage = %d", pageControl.currentPage)

        //000000
        
    }
    
    //手势滑动时对图片的处理
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let pageIndex = Int((scrollView.contentOffset.x-SCREEN_WIDTH)/SCREEN_WIDTH)
        pageControl.currentPage = pageIndex
        
        //如果滑到第一张
        if pageIndex == 0 {
            scrollView.contentOffset = CGPointMake(CGFloat(bannarArray.count)*SCREEN_WIDTH, 0)
            pageControl.currentPage = bannarArray.count-1
            
        }else if scrollView.contentOffset.x == CGFloat(bannarArray.count+1)*SCREEN_WIDTH
        {
            //如果滑到最后一张
            scrollView.contentOffset = CGPointMake(SCREEN_WIDTH, 0)
            pageControl.currentPage = 0
        }
    }
    
    //MARK:手势开始滑动时 停止计时器
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
//        timer.fireDate = NSDate.distantFuture()
        timer.invalidate()
    }
    //MARK:手势结束滑动时 开始计时器
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
//        self.performSelector("startTimer", withObject: nil, afterDelay: 4.0)
//        timer.fireDate = NSDate()
        startTimer()
    }
    
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
//        self.scrollView.contentOffset = CGPointMake(SCREEN_WIDTH, 0)
        
    }
    
    
    
    
    
    

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}

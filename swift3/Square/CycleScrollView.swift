//
//  CycleScrollView.swift
//  swift3
//
//  Created by eims1 on 16/6/2.
//  Copyright © 2016年 sky. All rights reserved.
//

import UIKit

let sectionNum:Int = 3//这个值要大于或等于循环的图片数量

protocol CycleViewDelegate {
    func didSelectIndexCollectionViewCell(index:Int)->Void
}


class CycleScrollView: UIView,UICollectionViewDelegate,UICollectionViewDataSource{
    
    var delegate : CycleViewDelegate?
    var cycleCollectionView :UICollectionView?
    var images = NSMutableArray()
    var pageControl = UIPageControl()
    var flowLayout = UICollectionViewFlowLayout()
    var timer = NSTimer()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.createSubview(frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createSubview(frame:CGRect) {
        cycleCollectionView = UICollectionView.init(frame: CGRectMake(0, 0, frame.size.width, frame.size.height), collectionViewLayout: flowLayout)
        flowLayout.itemSize = CGSizeMake(frame.size.width, frame.size.height)
        flowLayout.minimumInteritemSpacing = 10;
        flowLayout.minimumLineSpacing = 0;
        flowLayout.scrollDirection = UICollectionViewScrollDirection.Horizontal;
        cycleCollectionView?.backgroundColor = UIColor.clearColor()
        cycleCollectionView?.pagingEnabled = true
        cycleCollectionView?.dataSource = self
        cycleCollectionView?.delegate = self
        cycleCollectionView?.showsVerticalScrollIndicator = false
        cycleCollectionView?.showsHorizontalScrollIndicator = false
        cycleCollectionView?.registerClass(CustomCycleCell.self, forCellWithReuseIdentifier: "cellId")
        self.addSubview(cycleCollectionView!)
        
        pageControl = UIPageControl.init(frame: CGRectMake(0, 0, frame.size.width/2, 40))
        pageControl.center = CGPointMake(frame.size.width/2,frame.size.height-20)
        self.addSubview(pageControl)
        self.addTimer()
    }
    
    
    func addTimer() {
         timer = NSTimer.init(timeInterval: 4, target: self, selector: "nextPageView", userInfo: nil, repeats: true)
        NSRunLoop.currentRunLoop().addTimer(timer, forMode: NSRunLoopCommonModes)
    }
    
    func  removeTimer(){
        self.timer.invalidate()
        
    }
    
    func returnIndexPath() ->NSIndexPath {
        var currentIndexPath = cycleCollectionView?.indexPathsForVisibleItems().last
        currentIndexPath = NSIndexPath.init(forRow: (currentIndexPath!.row), inSection: sectionNum/2)
        cycleCollectionView?.scrollToItemAtIndexPath(currentIndexPath!, atScrollPosition: UICollectionViewScrollPosition.Left, animated: false)
        return currentIndexPath!
        
    }
    
    func nextPageView() {
        
        let indexPath = self.returnIndexPath()
        var item = indexPath.row+1
        var section = indexPath.section
        if item == images.count {
            item = 0
            section += 1
        }
        self.pageControl.currentPage = item
        let  nextIndexPath = NSIndexPath.init(forRow: item, inSection: section)
        cycleCollectionView?.scrollToItemAtIndexPath(nextIndexPath, atScrollPosition: UICollectionViewScrollPosition.Left, animated: true)
    }
    
    //重用池
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cellId", forIndexPath: indexPath) as!CustomCycleCell
        cell.labelTile.text = NSString(format: "第%d张",indexPath.row+1) as String
        cell.imageView.image = UIImage(named: self.images[indexPath.row] as! String)
        return cell
        
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return sectionNum
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        pageControl.numberOfPages = images.count
        return images.count
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        self.addTimer()
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        self.removeTimer()
    }
    
    //MARK:设置当前的pageControl
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let page = (Int(scrollView.contentOffset.x)/Int(SCREEN_WIDTH))%images.count
        pageControl.currentPage = page
    }

    //MARK:响应collectionView的点击方法
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        self.delegate?.didSelectIndexCollectionViewCell(indexPath.row)
    }
    
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}

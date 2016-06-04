//
//  SquareViewController.swift
//  swift1
//
//  Created by eims1 on 16/5/13.
//  Copyright © 2016年 eims. All rights reserved.
//

import UIKit
let bnrArray = ["IMG_0017","IMG_0018","IMG_0019","IMG_0021"]

class SquareViewController: UIViewController,CycleViewDelegate,TitleScrollViewDelegate {
    var bannerView = BannerView()
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBar.hidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.title = "广场"
//        self.createBannerView()
        
        self.createCollectView()
        self.createTitleScrollView()
        
    }
    
    func createBannerView(){
        bannerView = BannerView.init(frame: CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT/3))
        bannerView.initBannerArray(bnrArray)
        self.view.addSubview(bannerView)
    }
    
    func createCollectView(){
        let cycle = CycleScrollView.init(frame: CGRectMake(0, SCREEN_HEIGHT/3, SCREEN_WIDTH, SCREEN_HEIGHT/3))
        cycle.delegate = self
        cycle.images = NSMutableArray(array: bnrArray)
        self.view.addSubview(cycle)
    }
    
    func didSelectIndexCollectionViewCell(index: Int) {
        NSLog("collectionViewCell.index = %d", index)
    }
    
    
    func createTitleScrollView(){
        let titleView = TitleView.init(title: bnrArray, norColor: UIColor.blackColor(), selColor: UIColor.redColor(), font: 16.0,frame:CGRectMake(0, 2*SCREEN_HEIGHT/3, SCREEN_WIDTH, 40))
        titleView.titleDelegate = self
        self.view.addSubview(titleView)
        
        
    }
    
    func TitleScrollViewClick(clickIndex: Int) {
        NSLog("title.index = %d", clickIndex)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

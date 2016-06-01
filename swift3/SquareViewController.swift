//
//  SquareViewController.swift
//  swift1
//
//  Created by eims1 on 16/5/13.
//  Copyright © 2016年 eims. All rights reserved.
//

import UIKit

class SquareViewController: UIViewController {
    var bannerView = BannerView()
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBar.hidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.title = "广场"
        self.createBannerView()
        
    }
    
    func createBannerView(){
        bannerView = BannerView.init(frame: CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT/3))
        let bnrArray : NSArray!
            bnrArray = ["IMG_0017","IMG_0018","IMG_0019","IMG_0021"];
        bannerView.initWithbannerArray(bnrArray)
        self.view.addSubview(bannerView)
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

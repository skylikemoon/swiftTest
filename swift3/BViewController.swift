//
//  BViewController.swift
//  swift1
//
//  Created by eims1 on 16/2/29.
//  Copyright (c) 2016年 eims. All rights reserved.
//

import UIKit

public let changeRootVC = "changeRootViewController"


class BViewController: UIViewController,UITableViewDelegate{
    var tableView:UITableView!
    var rowNum:Int = 4
    var imageView:UIImageView?
    var startBtn:UIButton?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor();
        
//        self.tableView = UITableView(frame: CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height))
////        self.tableView.dataSource = self
//        self.tableView.delegate = self
//        self.view.addSubview(self.tableView)
        // Do any additional setup after loading the view.
        
        imageView = UIImageView.init(frame: CGRectMake(0, 0, self.view.frame.width, self.view.frame.size.height))
        imageView?.image = UIImage.init(named: "taylor.jpg")
        self.view.addSubview(imageView!)
        
        startBtn = UIButton.init(type: UIButtonType.Custom)
        startBtn?.frame  = CGRectMake(0, self.view.frame.height-40, self.view.frame.width, 40)
        startBtn?.setTitle("开启APP之旅", forState:UIControlState.Normal)
        startBtn?.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
//        startBtn?.addTarget(self, action: #selector(BViewController.closeFirstViewController), forControlEvents: UIControlEvents.TouchUpInside)
        startBtn?.addTarget(self, action: "closeFirstViewController", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(startBtn!)
    }
    
    func closeFirstViewController() {
        //先放大imageView
        UIView.animateWithDuration(5) {
            self.imageView?.transform = CGAffineTransformMakeScale(0.4, 0.4)
            self.imageView?.alpha = 0.6
            
        }
        //更换rootViewController
        NSNotificationCenter.defaultCenter().postNotificationName(changeRootVC, object: nil)
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 4
    }
//    func tabl
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

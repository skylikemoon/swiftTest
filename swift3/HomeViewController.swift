//
//  HomeViewController.swift
//  swift1
//
//  Created by eims1 on 16/5/13.
//  Copyright © 2016年 eims. All rights reserved.
//

import UIKit


class HomeViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    private var tableView = UITableView()
    private var topImageView = UIImageView()
    private let topImageViewH :CGFloat = 350
    private let cellTitleArray = ["环形显示的进度条","环形显示的进度条——文字","弧形显示的进度条","弧形显示的进度条——文字","under"]
    private let cellImageArray = ["under","under","under","under","under"]
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBarHidden = true

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.title = "首页"
        initView()

    }
    
    func initView(){
        tableView = UITableView.init(frame: self.view.frame, style: UITableViewStyle.Plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.contentInset = UIEdgeInsetsMake(topImageViewH*0.5, 0, 0, 0)

        self.view.addSubview(self.tableView)
        
        self.topImageView = UIImageView.init(frame: CGRectMake(0, -topImageViewH, SCREEN_WIDTH, topImageViewH));
        self.topImageView.image = UIImage.init(named: "huba")
        self.topImageView.contentMode = UIViewContentMode.ScaleAspectFill
        self.tableView .insertSubview(self.topImageView, atIndex: 0)
    }

    //MARK:tableView.dataSource, delegate
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellTitleArray.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //4个cell，不用判断是否有复用
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
        cell.textLabel?.text  = cellTitleArray[indexPath.row]
        cell.imageView?.image = UIImage.init(named: cellImageArray[indexPath.row])
        
        return cell
    
    }
    
    
    func scrollViewDidScroll(scrollView: UIScrollView) {

        var down:CGFloat = -scrollView.contentOffset.y-topImageViewH*0.5
        
        if down<0 {
            down = 0.0
        }
        
        var frame:CGRect = self.topImageView.frame
        frame.size.height = down+topImageViewH
        self.topImageView.frame = frame
        
        
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

        if indexPath.row == 0 {
            
            let VC  = CircleViewController()
            VC.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(VC, animated: true)

        }else if indexPath.row == 1 {
            let VC  = CircleWithTextViewController()
            VC.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(VC, animated: true)
            
        }else if indexPath.row == 2 {
            let VC  = SemiCircleViewController()
            VC.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(VC, animated: true)
            
        }else if indexPath.row == 3 {
            let VC  = SemiCircleWithTextViewController()
            VC.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(VC, animated: true)
        }
        

    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBarHidden = false
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

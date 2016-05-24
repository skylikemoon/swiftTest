//
//  MessageCenterViewController.swift
//  swift1
//
//  Created by eims1 on 16/5/13.
//  Copyright © 2016年 eims. All rights reserved.
//

import UIKit

class MessageCenterViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    private var tableView = UITableView()
    private let cellTitleArray = ["详情列表XibCell","更换头像","新的喜欢","新的通知"]
    private let cellImageArray = ["more_info","more_about","more_contact","more_msg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.title = "我的消息"
        
        
        //接受模拟后台的推送
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "hasNewMessage", name: "UserMessage", object: nil)
        
        self.initView()
        // Do any additional setup after loading the view.
    }

    
    func initView(){
        tableView = UITableView.init(frame: CGRectMake(0, 0, self.view.frame.width, self.view.frame.height), style: UITableViewStyle.Plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = UITableViewCellSeparatorStyle.SingleLine
        tableView.tableFooterView = UIView.init()
        self.view.addSubview(self.tableView)
    }
    
    //MARK:tableView.dataSource, delegate
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellTitleArray.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //4个cell，不用判断是否有复用
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        cell.textLabel?.text  = cellTitleArray[indexPath.row]
        cell.imageView?.image = UIImage.init(named: cellImageArray[indexPath.row])
        
        return cell
    }
    
    //MARK:跳转到自定义cell的tableView页面
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 0
        {
            let VC = MsgDetailViewController()
            VC.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(VC, animated: true)
        }
        else if indexPath.row == 1
        {
            let VC = MsgHeadImgViewController()
            VC.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(VC, animated: true)
        }
        
    
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

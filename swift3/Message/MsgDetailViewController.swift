//
//  MsgDetailViewController.swift
//  swift3
//
//  Created by eims1 on 16/5/17.
//  Copyright © 2016年 sky. All rights reserved.
//


import UIKit

class MsgDetailViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    private var tableView = UITableView()
    private var cellTitleArray = ["新的粉丝","新的评论","新的喜欢","新的通知"]
    private let cellImageArray = ["more_info","more_about","more_contact","more_msg"]
    private var currentTime = NSString()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.title = "消息详情列表"
        
        let date = NSDate()
        let timeFormatter = NSDateFormatter()
        timeFormatter.dateFormat = "yyyy-MM-dd '    ' HH:mm:ss"
        currentTime = timeFormatter.stringFromDate(date)
        
        self.initView()
        // Do any additional setup after loading the view.
        
        
    }
    
    
    func initView(){
        tableView = UITableView.init(frame: CGRectMake(0, 0, self.view.frame.width, self.view.frame.height), style: UITableViewStyle.Grouped)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        tableView.tableFooterView = UIView.init()
        tableView.registerNib(UINib(nibName: "MsgDetailCell", bundle: nil), forCellReuseIdentifier: "MsgDetailCell")
//        tableView.editing = true
        self.view.addSubview(self.tableView)
    }
    
    //MARK:tableView.dataSource, delegate
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return cellTitleArray.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100.0
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.min
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 5.0
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let cell :MsgDetailCell!
        cell = tableView.dequeueReusableCellWithIdentifier("MsgDetailCell")as!MsgDetailCell
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        cell.titleLabel.text = NSString(format: "cell_indexPath:%ld", indexPath.section) as String
        cell.TimeLabel.text = currentTime as String
        
        return cell
    }
    
    //MARK:删除函数
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        //删除对应的数据源
        cellTitleArray.removeAtIndex(indexPath.section)
        
        //删除对应的cell
        let set = NSIndexSet.init(index: indexPath.section)
        
    
        tableView.deleteSections(set, withRowAnimation: UITableViewRowAnimation.Automatic)
    }
    
    //MARK:把delete改成中文
    func tableView(tableView: UITableView, titleForDeleteConfirmationButtonForRowAtIndexPath indexPath: NSIndexPath) -> String? {
        return "删除"
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

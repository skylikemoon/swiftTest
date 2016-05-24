//
//  MsgHeadImgViewController.swift
//  swift3
//
//  Created by eims1 on 16/5/20.
//  Copyright © 2016年 sky. All rights reserved.
//

import UIKit

class MsgHeadImgViewController: UIViewController ,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    var imgBtn:UIButton!
    var imgView:UIImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.title = "更换头像"
        
        // Do any additional setup after loading the view.
        imgBtn = UIButton.init(type:UIButtonType.RoundedRect)
        imgBtn.frame = CGRectMake((SCREEN_WIDTH-200)/2, 80, 200, 40)
        imgBtn.setTitleColor(UIColor.blackColor(), forState: .Normal)
        imgBtn.setTitle("点击更换头像", forState: .Normal)
        imgBtn.addTarget(self, action: #selector(MsgHeadImgViewController.changeHeadImageClick), forControlEvents: .TouchUpInside)
        self.view.addSubview(imgBtn)
        
        imgView = UIImageView.init(frame: CGRectMake(self.view.frame.width/2-50, CGRectGetMaxY(imgBtn.frame)+20, 100, 100))
        imgView.layer.cornerRadius = 50;
        imgView.clipsToBounds = true
        imgView.image = UIImage.init(named: "as")
        self.view .addSubview(imgView)
        
    }
    //MARK:调用本地相册
    func changeHeadImageClick() {
        
        let pick:UIImagePickerController = UIImagePickerController()
        pick.delegate = self
        self.presentViewController(pick, animated: true, completion: nil)
       
    }
    
    //MARK:实现UIImagePickerControllerDelegate 代理方法
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let getImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        imgView.image = getImage;
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        self.dismissViewControllerAnimated(true, completion: nil)
        
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

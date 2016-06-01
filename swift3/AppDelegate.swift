//
//  AppDelegate.swift
//  swift1
//
//  Created by eims1 on 15/8/26.
//  Copyright (c) 2015年 eims. All rights reserved.
//

import UIKit

let SCREEN_WIDTH: CGFloat = UIScreen.mainScreen().bounds.size.width
let SCREEN_HEIGHT: CGFloat = UIScreen.mainScreen().bounds.size.height

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var tabbarController:UITabBarController!
    var homeVC:HomeViewController!
    var messageVC:MessageCenterViewController!
    var squareVC:SquareViewController!
    var homeNV:UINavigationController!
    var messageNC:UINavigationController!
    var squareNC:UINavigationController!
    var vcArray:NSArray!
    
    
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow.init(frame: UIScreen.mainScreen().bounds)
        
        self.creatTabBarController()
        
        self.window?.rootViewController = mainViewController()
        self.window?.makeKeyAndVisible()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(AppDelegate.changeRootViewController), name: changeRootVC, object: nil)
        
        return true
    }
    
    //MARK:创建tabbarController
    func creatTabBarController() {
        self.tabbarController = UITabBarController.init()
        //        tabbarController.delegate = self
        
        //首页
        homeVC  = HomeViewController.init()
        homeVC.tabBarItem = UITabBarItem.init(title: "首页", image: UIImage.init(named: "tab_home"), selectedImage: UIImage.init(named: "tab_home_selected"))
        homeNV  = UINavigationController.init(rootViewController: homeVC)
        
        //广场
        squareVC = SquareViewController.init()
        squareVC.tabBarItem = UITabBarItem.init(title: "广场", image: UIImage.init(named: "tab_square"), selectedImage: UIImage.init(named: "tab_square_selected"))
        squareNC = UINavigationController.init(rootViewController: squareVC)
        
        //消息中心
        messageVC = MessageCenterViewController.init()
        messageVC.tabBarItem = UITabBarItem.init(title: "消息", image: UIImage.init(named: "tab_message"), selectedImage: UIImage.init(named: "tab_message_selected"))
        messageNC = UINavigationController.init(rootViewController: messageVC)
        
        vcArray = NSArray.init(objects:homeNV,squareNC,messageNC)
        self.tabbarController.viewControllers = vcArray as![UINavigationController]
        self.tabbarController.selectedIndex = 0
        self.tabbarController.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.redColor()], forState: .Selected)
        self.tabbarController.tabBar.tintColor = UIColor.redColor()
        
        
    }
    
    func mainViewController() -> UIViewController {
        //first start 不为空 ，不是第一次启动
        if NSUserDefaults.standardUserDefaults().objectForKey("firstStart") != nil {
            return self.tabbarController
        }else
        {
            NSUserDefaults.standardUserDefaults().setObject(false, forKey: "firstStart")
            let firstVC  = BViewController()
            
            
            return firstVC
        }
    }
    
    func changeRootViewController() {
        self.window!.rootViewController = self.tabbarController
    }
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
}


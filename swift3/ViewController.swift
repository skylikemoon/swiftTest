//
//  ViewController.swift
//  swift3
//
//  Created by eims1 on 16/3/1.
//  Copyright (c) 2016年 sky. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var infoArray:NSMutableArray?
    var nameArray:NSMutableArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor.whiteColor();
//        self.infoArray.
//        self.nameArray.addObject("sky")
//        print("array\(self.infoArray)")
        
        var array1:[String] = [String]()
        array1.append("ani")
        array1.append("jeu dui nu")
        print("println\(array1)")
        print("println\(array1)")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


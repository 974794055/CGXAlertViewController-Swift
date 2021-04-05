//
//  ViewController.swift
//  CGXAlertViewController-Swift
//
//  Created by MacMini-1 on 2019/7/23.
//  Copyright © 2019 CGX. All rights reserved.
//

import UIKit
import
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

//        CGXAlertViewController.showAlert(title: "温馨提示", message: "http", btnArr: ["取消","确认"]) { (title,message,btnStr) in
//            print(title,message,btnStr)
//        }
//
//        CGXAlertViewController.showAlert(title: "温馨提示", message: "http", btnArr: ["取消","确认"], titleBlock: { (titleModel) -> (Void) in
//
//        }, actionBlock: { (actionModel) in
//
//        }) { (title, message, btnStr) in
//
//        }
        
        
        CGXAlertViewController.showAlert(title: "温馨提示", message: "http", btnArr: ["取消","确认"], titleBlock: { (titleModel) -> (Void) in
            
        }, actionBlock: { (actionModel) in
            
        }) { (title, message, btnStr) in
             print(title,message,btnStr)
        }}

}


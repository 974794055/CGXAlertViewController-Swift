//
//  CGXAlertController.swift
//  AppStructure
//
//  Created by MacMini-1 on 2019/7/12.
//  Copyright © 2019 CGX. All rights reserved.
//
/**
下载链接：https://github.com/974794055/CGXAlertViewController-Swift.git
QQ号：974794055
群名称：
CGXAlertViewController交流群
群   号：
版本： 1.0.4
*/

import UIKit

@objc
public class CGXAlertViewController: NSObject {
     // 按钮点击事件block
    public typealias CGXAlertViewControllerSelectBlock = (_  title: String, _ message: String ,_ btnStr :String) ->()
    public typealias CGXAlertViewControllerTitleBlock = (_  titleModel: CGXAlertTitleModel) ->(Void)
    public typealias CGXAlertViewControllerActionBlock = (_  actionModel: CGXAlertActionModel) ->()
    
     /*
     title：标题
     message：提示语
     btnArr：按钮数组
     selectBlock：点击按钮回调
     titleBlock:修改标题、提示语字体、颜色
     actionBlock：修改按钮字体、颜色
     */
    public class func showAlert(title: String?, message: String?,btnArr:[String],selectBlock:@escaping CGXAlertViewControllerSelectBlock) {
        self.showAlert(title: title, message: message, btnArr: btnArr, titleBlock: { (titleModel) -> (Void) in
            
        }, actionBlock: { (actionModel) in
            
        }, selectBlock: selectBlock)
    }
    
    public class func showAlert(title: String?, message: String?,btnArr:[String],titleBlock:@escaping CGXAlertViewControllerTitleBlock ,actionBlock:@escaping CGXAlertViewControllerActionBlock,selectBlock:@escaping CGXAlertViewControllerSelectBlock) {
        self.showAlertView(Title: title, Message: message, btnArr: btnArr, titleBlock: { (titleModel) -> (Void) in
            
        }, actionBlock: { (actionModel) in
            
        }, selectBlock: selectBlock, preferredStyle: .alert)
    }
    
    public class func showAction(title: String?, message: String?,btnArr:[String],selectBlock:@escaping CGXAlertViewControllerSelectBlock) {
        self.showAction(title: title, message: message, btnArr: btnArr, titleBlock: { (titleModel) -> (Void) in
            
        }, actionBlock: { (actionModel) in
            
        }, selectBlock: selectBlock)
    }
    
    public class func showAction(title: String?, message: String?,btnArr:[String],titleBlock:@escaping CGXAlertViewControllerTitleBlock ,actionBlock:@escaping CGXAlertViewControllerActionBlock,selectBlock:@escaping CGXAlertViewControllerSelectBlock) {
        self.showAlertView(Title: title, Message: message, btnArr: btnArr, titleBlock: { (titleModel) -> (Void) in
            
        }, actionBlock: { (actionModel) in
            
        }, selectBlock: selectBlock, preferredStyle: .actionSheet)
    }
    

}
// MARK: - 私有方法
extension CGXAlertViewController
{
    fileprivate class func showAlertView(Title title: String?,Message message: String?,btnArr:[String],titleBlock:@escaping CGXAlertViewControllerTitleBlock ,actionBlock:@escaping CGXAlertViewControllerActionBlock,selectBlock:@escaping CGXAlertViewControllerSelectBlock,preferredStyle:UIAlertController.Style) {
        
        let titleModel:CGXAlertTitleModel = CGXAlertTitleModel.init()
        
        titleBlock(titleModel)

        var actionSheet = UIAlertController.init(title: title, message: message, preferredStyle: preferredStyle)
        if UIDevice.current.model == "iPad" || UIDevice.current.userInterfaceIdiom == .pad  {
            actionSheet = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        }
        actionSheet.view.tintColor = UIColor.black
        if title!.count > 0 {
            let titleStr = NSMutableAttributedString.init(string: title! + "\n")
            titleStr.addAttribute(NSAttributedString.Key.foregroundColor, value: titleModel.titleColor, range: NSRange.init(location: 0, length: title!.count))
            titleStr.addAttribute(NSAttributedString.Key.font, value: titleModel.titleFont, range: NSRange.init(location: 0, length: title!.count))
            actionSheet.setValue(titleStr, forKey: "attributedTitle")
        }
        if message!.count > 0 {
            let messageStr = NSMutableAttributedString.init(string: message!)
            messageStr.addAttribute(NSAttributedString.Key.foregroundColor, value: titleModel.messageColor, range: NSRange.init(location: 0, length: message!.count))
            messageStr.addAttribute(NSAttributedString.Key.font, value: titleModel.messageFont, range: NSRange.init(location: 0, length: message!.count))
            actionSheet.setValue(messageStr, forKey: "attributedMessage")
        }
        
        for index in 0..<btnArr.count {
            let btnStr = btnArr[index]
            
            let actionModel:CGXAlertActionModel = CGXAlertActionModel.init()
            actionModel.title = btnStr
            if (actionModel.title == "取消" || actionModel.title == "cancel") {
                actionModel.style = UIAlertAction.Style.cancel;
            }
            actionBlock(actionModel)
            
            let btnAction = UIAlertAction.init(title: actionModel.title, style: actionModel.style) { (action) in
                selectBlock(title!,message!,actionModel.title!)
            }
            btnAction.setValue(actionModel.titleColor, forKey: "titleTextColor")
            actionSheet.addAction(btnAction)
        }
        DispatchQueue.main.async {
            UIApplication.shared.keyWindow?.rootViewController?.present(actionSheet, animated: true, completion: { }
            )
        }
    }
}


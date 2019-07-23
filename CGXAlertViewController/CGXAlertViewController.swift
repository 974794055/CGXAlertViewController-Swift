//
//  CGXAlertController.swift
//  AppStructure
//
//  Created by MacMini-1 on 2019/7/12.
//  Copyright © 2019 CGX. All rights reserved.
//

import UIKit

class CGXAlertViewController: NSObject {
    /// 声明一个 Block
    
    typealias AlertSelectBlock = (_ btnStr :String) ->()
    var selectBlock: AlertSelectBlock!
    
    class func showAlert(title: String?, message: String?,btnArr:[String],selectBlock:@escaping AlertSelectBlock) {
        self.showAlert(title: title, message: message, btnArr: btnArr, selectBlock: selectBlock, preferredStyle: .alert)
    }
    class func showAlert(title: String?, message: String?,btnArr:[String],selectBlock:@escaping AlertSelectBlock,preferredStyle:UIAlertController.Style) {
        var colorA = [UIColor]()
        for _ in 0..<btnArr.count {
            colorA.append(UIColor.black)
        }
        self.showAlert(title: title, message: message, btnArr: btnArr, btnColorArr: colorA, selectBlock: selectBlock, preferredStyle: preferredStyle)
    }
    
    class func showAlert(title: String?, message: String?,btnArr:[String],btnColorArr:[UIColor],selectBlock:@escaping AlertSelectBlock,preferredStyle:UIAlertController.Style) {
        self.showAlertView(Title: title, TitleColor: UIColor.black, TitleFont: UIFont.systemFont(ofSize: 17), Message: message, MessageColor: UIColor.black, MessageFont: UIFont.systemFont(ofSize: 15), btnArr: btnArr, btnColorArr: btnColorArr, selectBlock: selectBlock, preferredStyle: preferredStyle)
    }
    
    
    private class func showAlertView(Title title: String?,TitleColor titleColor : UIColor ,TitleFont titleFont : UIFont, Message message: String?,MessageColor messageColor : UIColor ,MessageFont messageFont : UIFont,btnArr:[String],btnColorArr:[UIColor],selectBlock:@escaping AlertSelectBlock,preferredStyle:UIAlertController.Style) {
        
        assert((btnArr.count == btnColorArr.count), "按钮数组和颜色数组个数必须相等")
        let actionSheet = UIAlertController.init(title: title, message: message, preferredStyle: preferredStyle)
        actionSheet.view.tintColor = UIColor.black
        if title!.count > 0 {
            let titleStr = NSMutableAttributedString.init(string: title! + "\n")
            titleStr.addAttribute(NSAttributedString.Key.foregroundColor, value: titleColor, range: NSRange.init(location: 0, length: title!.count))
            titleStr.addAttribute(NSAttributedString.Key.font, value: titleFont, range: NSRange.init(location: 0, length: title!.count))
            actionSheet.setValue(titleStr, forKey: "attributedTitle")
        }
        if message!.count > 0 {
            let messageStr = NSMutableAttributedString.init(string: message!)
            messageStr.addAttribute(NSAttributedString.Key.foregroundColor, value: messageColor, range: NSRange.init(location: 0, length: message!.count))
            messageStr.addAttribute(NSAttributedString.Key.font, value: messageFont, range: NSRange.init(location: 0, length: message!.count))
            actionSheet.setValue(messageStr, forKey: "attributedMessage")
        }
        for index in 0..<btnArr.count {
            let btnStr = btnArr[index]
            let btnColor = btnColorArr[index]
            
            let btnAction = UIAlertAction.init(title: btnStr, style: .default) { (action) in
                selectBlock(action.title!)
            }
            btnAction.setValue(btnColor, forKey: "titleTextColor")
            actionSheet.addAction(btnAction)
        }
        UIApplication.shared.keyWindow?.rootViewController?.present(actionSheet, animated: true, completion: { })
    }
}

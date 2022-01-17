//
//  UIAlertController+category.swift
//  OA
//
//  Created by 洪继伟 on 2021/12/20.
//

import UIKit



extension UIAlertController {

    class func alert(title:String, message:String) -> UIAlertController{
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        let btnOk = UIAlertAction(title: "确定", style: UIAlertAction.Style.default)
        
        let btnCancel = UIAlertAction(title: "取消", style: UIAlertAction.Style.cancel)
        alert.addAction(btnOk)
        alert.addAction(btnCancel)
        
        return alert
    }
    
//    class func actionSheet(title:String?,message:String?) -> UIAlertController{
//
//        let alert = UIAlertController(title: "提示", message: "确定要退出登陆吗", preferredStyle: UIAlertController.Style.alert)
//        
//        let btnOk = UIAlertAction(title: "确定", style: UIAlertAction.Style.default) { _ in
//            //清理token
//            UserDefaults.standard.removeObject(forKey: App_Token_Key)
//            //删除account
//            Account.clearAccount()
//            //跳转到登陆页
//            UIWindow.switchRootController()
//        }
//
//        let btnCancel = UIAlertAction(title: "取消", style: UIAlertAction.Style.cancel, handler: nil)
//        alert.addAction(btnOk)
//        alert.addAction(btnCancel)
//
//    }

}

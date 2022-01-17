//
//  PopoverPresentationController.swift
//  OA
//
//  Created by 洪继伟 on 2021/10/3.
//

import UIKit

class PopoverPresentationController: UIPresentationController {
    
    var presentFrame:CGRect=CGRect.zero
    
    lazy var coverView: UIView = {
        //创建view
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.0, alpha: 0.2)
        view.frame = UIScreen.main.bounds
        
        //监听
        let tap = UITapGestureRecognizer(target: self, action:#selector(closePopover) )
        view.addGestureRecognizer(tap)
        return view
    }()
    
    
    
    /// 初始化方法
    /// - Parameters:
    ///   - presentedViewController: 被展现控制器
    ///   - presentingViewController: 发起控制器
    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
        
        print(presentedViewController)
        //print(presentingViewController!)
    }
    
    
    /// 即将展现专场 视图时调用
    override  func containerViewWillLayoutSubviews(){
        
        //修改弹出视图尺寸
        //presentedView容器试图
        //containerView被展示试图
        
//        if presentedView?.frame == CGRect.zero{
            presentedView?.frame = presentFrame
//        }else
//        {
//            presentedView?.frame = CGRect.zero
//        }
        
        // 2.在容器视图上添加一个蒙版, 插入到展现视图的下面
        containerView?.insertSubview(coverView, at: 0)
    }
    
    
    //MARK: 方法  ==注释==
    @objc func closePopover()  {
        //        print(#function)
        presentedViewController.dismiss(animated: true, completion: nil)
    }
}

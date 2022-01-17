//
//  PopoverAnimator.swift
//  OA
//
//  Created by 洪继伟 on 2021/10/3.
//

import UIKit

class ActionSheetAnimator: NSObject {
    var isPresenting:Bool = false
    var presentFrame:CGRect=CGRect.zero
}

extension ActionSheetAnimator:UIViewControllerTransitioningDelegate{
    
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController?{
        let ppc = PopoverPresentationController(presentedViewController: presented, presenting: presenting)
        ppc.presentFrame = presentFrame
        return ppc
    }
    
    
    // MARK: - 只要实现了一下方法, 那么系统自带的默认动画就没有了, "所有"东西都需要程序员自己来实现
    /// 告诉系统谁来负责Modal的展现动画
    /// - Parameters:
    ///   - presented: 被展现视图
    ///   - presenting: 发起的视图
    ///   - source: 谁来负责
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning?
    {
        isPresenting=true
        //        print(#function)
        //        print("presented")
        //        print(presented)
        //        print("presenting")
        //        print(presenting)
        //        print("source")
        //        print(source)
        return self;
    }
    
    
    /// 告诉系统谁来负责Modal的消失动画
    /// - Parameter dismissed: 被关闭的视图
    /// - Returns:  谁来负责
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning?
    {
        isPresenting=false
        return self;
    }
    
}


extension ActionSheetAnimator:UIViewControllerAnimatedTransitioning{
    
    
    /// 动画时长
    /// - Parameter transitionContext:转场上下文
    /// - Returns: 时长
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval{
        return 0.35
    }
    
    
    
    ///  告诉系统如何动画, 无论是展现还是消失都会调用这个方法
    /// - Parameter transitionContext: 上下文, 里面保存了动画需要的所有参数
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning){
        
        
        if isPresenting {
            let toView = transitionContext.view(forKey:.to)
            
            print("toView")
            if let _toView = toView{
                print(_toView)
                
                _toView.transform = CGAffineTransform(translationX: 0, y: _toView.height)
                
                // 设置锚点
//                _toView.layer.anchorPoint = CGPoint(x: 0.5, y: 0)
                // 注意: 一定要将视图添加到容器上
                transitionContext.containerView.addSubview((_toView))
                
                UIView.animate(withDuration: transitionDuration(using: transitionContext)) {
                    // 2.1清空transform
                    _toView.transform = CGAffineTransform.identity
                } completion: { _ in
                    // 2.2动画执行完毕, 一定要告诉系统
                    // 如果不写, 可能导致一些未知错误
                    transitionContext.completeTransition(true)
                }
            }
        }
        else{
            let fromView = transitionContext.view(forKey:.from)
            print("fromView")
            if let _fromView = fromView{
                print(_fromView)
                
                UIView.animate(withDuration: transitionDuration(using: transitionContext)) {
                    _fromView.transform = CGAffineTransform(translationX: 0, y: _fromView.height)
                    
                } completion: { _ in
                    // 如果不写, 可能导致一些未知错误
                    transitionContext.completeTransition(true)
                }
                
            }
            
        }
        
    }
    
    
}

//
//  UIDateActionSheetController.swift
//  OA
//
//  Created by 洪继伟 on 2021/12/21.
//

import UIKit


@objc protocol ActionSheetDelegate:NSObjectProtocol{
    @objc func ActionSheetConfirm()
}

class ActionSheetController: UIViewController {

    init(title:String, contentView:UIView) {
        super.init(nibName:nil,bundle: nil)    // 直接调用super.init()会报错
        
        // 2.1设置转场代理
        self.modalPresentationStyle = UIModalPresentationStyle.custom
        // 2.2设置转场的样式
        self.transitioningDelegate = actionSheetAnimator
        
        self.titleLabel.text = title
        self.contentView = contentView
    }
    
    weak var delegate:ActionSheetDelegate?
    
    //MARK: 懒加载  ==注释==
    lazy var actionSheetAnimator: ActionSheetAnimator = {
        let obj = ActionSheetAnimator()
        obj.presentFrame = CGRect(x: 0, y: App_Screen_Height - ActionSheetController.sheetHeight, width: App_Screen_Width, height: ActionSheetController.sheetHeight)
        return obj
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static let sheetHeight:CGFloat = 220
    
    lazy var titleLabel: UILabel = {
        let temp = UILabel()
        temp.textColor = TEXT_COLOR_BLACK_87
        temp.isUserInteractionEnabled = true
        temp.textAlignment = NSTextAlignment.center
        return temp
    }()
    
    lazy var confirmBtn: UIButton = {
        let temp = UIButton(type: UIButton.ButtonType.custom)
        temp.setTitle("确认", for: UIControl.State.normal)
        temp.setTitleColor(AppColor_Blue, for: UIControl.State.normal)
        temp.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        temp.addTarget(self, action: #selector(self.confirmBtnDidClick), for: UIControl.Event.touchUpInside)
        return temp
    }()
    
    lazy var cancelBtn: UIButton = {
        let temp = UIButton(type: UIButton.ButtonType.custom)
        temp.setTitle("取消", for: UIControl.State.normal)
        temp.setTitleColor(AppColor_Blue, for: UIControl.State.normal)
        temp.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        temp.addTarget(self, action: #selector(self.dismissVC), for: UIControl.Event.touchUpInside)
        return temp
    }()
    
    var contentView:UIView = {
        let temp = UIView()
        return temp
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white

     
        self.view.addSubview(titleLabel)
        titleLabel.addSubview(cancelBtn)
        titleLabel.addSubview(confirmBtn)
        self.view.addSubview(contentView)
        
        titleLabel.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(40)
        }
        cancelBtn.snp.makeConstraints { make in
            make.left.top.equalToSuperview()
            make.height.equalTo(40)
            make.width.equalTo(60)
        }
        confirmBtn.snp.makeConstraints { make in
            make.right.top.equalToSuperview()
            make.height.equalTo(40)
            make.width.equalTo(60)
        }
        
        contentView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom)
            make.height.equalTo(ActionSheetController.sheetHeight - 40)
        }
        
//        contentView.backgroundColor = UIColor.random
    }
    

   @objc func confirmBtnDidClick()  {
       
       self.dismiss(animated: true, completion:nil)
       
       guard let _delegate = delegate else {
           return
       }
       
       _delegate.ActionSheetConfirm()
    }
    
    @objc func  dismissVC(){
        self.dismiss(animated: true, completion: nil)
    }

}

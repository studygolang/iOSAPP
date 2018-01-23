//
//  SGBaseViewController.swift
//  SG
//
//  Created by Mac on 2017/3/30.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit

class SGBaseController: UIViewController {

    lazy var titleLabel: UILabel = {
        let l1 = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: 200, height: 40))
        l1.backgroundColor = UIColor.clear
        l1.textColor = UIColor.black
        l1.textAlignment = NSTextAlignment.center
        l1.font = UIFont.systemFont(ofSize: 16.0)
        return l1
    }()
    var backBtn:UIButton?
    public typealias FinishClosure = () -> Void
    var popClosure:FinishClosure?
    
    var rightView: UIView {
        get {
            return self.rightView
        }
        set {
            self.rightView = newValue
            self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: newValue)
        }
    }
    /// 设置导航栏标题
    ///
    /// - Parameter title: 标题
    func setNavTitle(title:String) {
        self.titleLabel.text = title
    }

    /// 设置导航栏标题颜色
    ///
    /// - Parameter color: 颜色
    func setNavCorlor(color:UIColor)
    {
        self.titleLabel.textColor = color
    }
    
    
    /// 设置导航栏字体
    ///
    /// - Parameter font: 字体大小 float 类型
    func setNavFont(font:CGFloat)
    {
        self.titleLabel.font = UIFont.systemFont(ofSize: font)
    }
    
    /// 是否显示导航栏返回按钮
    ///
    /// - Parameter show: 是否显示
    func setShowBackBtn(show:Bool)
    {
        self.backBtn?.isHidden = show
    }
    
    /// 是否显示导航栏
    ///
    /// - Parameter isShow: 是否显示导航栏
    func setShowNav(isShow:Bool)
    {
        self.navigationController?.isNavigationBarHidden = isShow
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.titleView = titleLabel
        let backBtn = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 26, height: 42))
        backBtn.backgroundColor = UIColor.clear
        backBtn.imageEdgeInsets = UIEdgeInsets.init(top: 0, left: -40, bottom: 0, right: 0)
        backBtn.setImage(UIImage.init(named: "navBack"), for: UIControlState.normal)
        weak var weakSelf = self
        backBtn.buttonClick { (btn:UIButton?) in
            print("点击了返回按钮 .....")
            weakSelf?.navigationController!.popViewController(animated: true)
            if self.popClosure != nil {
                self.popClosure!()
            }
        }
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: backBtn)
        self.backBtn = backBtn
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print("内存警告了 ---- %@",self)
    }
    
    deinit {
        print("class is deinit " , self.classForCoder)
    }

   

}

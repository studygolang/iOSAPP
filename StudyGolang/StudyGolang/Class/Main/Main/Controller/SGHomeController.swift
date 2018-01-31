//
//  HomeController.swift
//  StudyGolang
//
//  Created by Mac on 2018/1/19.
//  Copyright © 2018年 Mac. All rights reserved.
//

import UIKit

class SGHomeController: SGBaseController {

    var mainTheme:SGMainThemeController?
    var otherTheme:SGOtherThemeController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = SGWhiteTheme
        setControll()
        setMainUI()
        
     }
    
    func setControll() {
        let secControll = UISegmentedControl.init(items: ["主题","其他"])
        secControll.frame = CGRect(x: 0, y: 20, width: 200, height: 30)
        self.navigationItem.titleView = secControll
        secControll.selectedSegmentIndex = 0
        secControll.addTarget(self, action: #selector(secControllChange(controll:)), for: .valueChanged)
    }
    
    func setMainUI(){
        let tabHei = CGFloat(SGTabController.GetTabbarHei())
        mainTheme = SGMainThemeController()
        mainTheme?.view.frame = CGRect.init(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight - tabHei)
        self.addChildViewController(mainTheme!)
        self.view.addSubview(mainTheme!.view)
         otherTheme = SGOtherThemeController()
        otherTheme?.view.frame = CGRect.init(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight - tabHei )
        self.addChildViewController(otherTheme!)
        self.view.addSubview(otherTheme!.view)
        otherTheme?.view.isHidden = true
        mainTheme?.view.isHidden = false
    }
    
    @objc func secControllChange(controll:UISegmentedControl) {
        if controll.selectedSegmentIndex == 0 {
            mainTheme?.view.isHidden = false
            otherTheme?.view.isHidden = true
        } else {
            mainTheme?.view.isHidden = true
            otherTheme?.view.isHidden = false
        }
    }
    
     override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
     }

}

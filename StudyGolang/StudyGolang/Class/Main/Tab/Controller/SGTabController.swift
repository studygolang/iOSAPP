//
//  SGVTabController.swift
//  SG
//
//  Created by Mac on 2017/3/30.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit

class SGTabController: UITabBarController,SGTabbarProtocol {
     lazy var customTabbar: SGTabbar = {
        var tab = SGTabbar.init(frame: self.tabBar.frame)
        tab.delegate = self
        return tab
    }()
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
     override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white        
        let homeVC = SGHomeController.init()
        setUpVC(vc: homeVC as SGBaseController, slcImgName: "home_select", norImgName: "home_nor", title: "首页")
        let sendVC = SGSentController.init()
        setUpVC(vc: sendVC as SGBaseController, slcImgName: "sent_select", norImgName: "sent_select", title: "发布")
        let searchVC = SGFeatureController.init()
        setUpVC(vc: searchVC as SGBaseController, slcImgName: "search_select", norImgName: "search_nor", title: "搜索")
        let mineVC = SGMineController.init()
        setUpVC(vc: mineVC as SGBaseController, slcImgName: "mine_select", norImgName: "mine_nor", title: "我的")
    }
    
    func setUpVC(vc:SGBaseController , slcImgName:String , norImgName:String , title:String) {
        let slcImg = UIImage.init(named: slcImgName)
        let norImg = UIImage.init(named: norImgName)
        vc.tabBarItem.image = norImg
        vc.tabBarItem.selectedImage = slcImg
        vc.tabBarItem.title = title
        if title != "首页" {
            vc.setNavTitle(title: title)
        }
        let nav = SGBaseNavgationController.init(rootViewController: vc)
         self.addChildViewController(nav)
        self.customTabbar.addTabbarItem(item: vc.tabBarItem)
    }
    
    public static func GetTabbarHei()->Float {
        var tabHei:Float = 49.0
        let inch = IphoneType.getDeviceInch()
        if inch == IphoneType.inch_57 {
            tabHei = 83.0
        } else {
            tabHei = 49.0
        }
        return tabHei
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
         for vi in self.tabBar.subviews {
            vi.removeFromSuperview()
        }
        self.customTabbar.frame = CGRect.init(x: 0, y: 0, width: self.tabBar.width, height: self.tabBar.height)
        self.tabBar.addSubview(self.customTabbar)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func didSelectidx(tabbar:SGTabbar?,index:Int) {
         self.selectedIndex = index
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        NSLog("didReceiveMemoryWarning -- %@", self)
    }
    
}

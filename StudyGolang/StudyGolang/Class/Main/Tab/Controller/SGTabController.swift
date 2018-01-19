//
//  SGVTabController.swift
//  SG
//
//  Created by Mac on 2017/3/30.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit

class SGTabController: UITabBarController {

    var customTabbar: SGTabbar {
        return SGTabbar(frame: CGRect.zero)
    }
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
    

    }
    
    func setUpVC(vc:SGTabController , slcImgName:String , norImgName:String , title:String)
    {
        let slcImg = UIImage.init(named: slcImgName)
        let norImg = UIImage.init(named: norImgName)
        vc.tabBarItem.image = norImg
        vc.tabBarItem.selectedImage = slcImg
        vc.title = title
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        NSLog("didReceiveMemoryWarning -- %@", self)
    }
    
}

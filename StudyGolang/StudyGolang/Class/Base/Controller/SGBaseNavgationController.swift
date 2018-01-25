//
//  SGBaseNaVC.swift
//  SG
//
//  Created by Mac on 2017/4/21.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit
import SwifterSwift

class SGBaseNavgationController: UINavigationController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
     override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.isTranslucent = false
        self.navigationBar.backgroundColor = SGThemeColor
        self.navigationBar.setBackgroundImage(UIImage.init(color: SGThemeColor, size: CGSize.init(width: kScreenWidth, height: 64))  , for: .default)
        self.navigationBar.setColors(background: SGThemeColor, text: SGTextColor1)
     }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print("didReceiveMemoryWarning -- %@",self)
    }
}

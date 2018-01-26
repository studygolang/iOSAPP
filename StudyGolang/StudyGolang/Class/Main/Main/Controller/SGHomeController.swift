//
//  HomeController.swift
//  StudyGolang
//
//  Created by Mac on 2018/1/19.
//  Copyright © 2018年 Mac. All rights reserved.
//

import UIKit
import RxSwift

class SGHomeController: SGBaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = SGWhiteTheme
        let secControll = UISegmentedControl.init(items: ["主题","其他"])
        secControll.frame = CGRect(x: 0, y: 0, width: 200, height: 40)
        self.navigationItem.titleView = secControll
        
        
     }
     override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
     }

}

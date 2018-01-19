//
//  SGBaseNaVC.swift
//  SG
//
//  Created by Mac on 2017/4/21.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit

class SGBaseNavgationController: UINavigationController {


  
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.isTranslucent = false
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print("didReceiveMemoryWarning -- %@",self)
    }
}

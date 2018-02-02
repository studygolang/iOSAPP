//
//  SGMainThemeController.swift
//  StudyGolang
//
//  Created by Mac on 2018/1/30.
//  Copyright © 2018年 Mac. All rights reserved.
//

import UIKit

class SGMainThemeController: SGBaseController {

    var themeList = [SGMainThemeModel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.red
        getNodeList()
    }

    private func setThemeListView(){
    }

    private func getNodeList(){
        YYNetworkTool.httpRequest(type: .get, url: mainNodeList, par: nil) { (model:SGRequestModel?, err:Error?) in
            print(model)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
     }
 }

//
//  SGMainModel.swift
//  StudyGolang
//
//  Created by Mac on 2018/2/1.
//  Copyright © 2018年 Mac. All rights reserved.
//

import UIKit
import ObjectMapper

class SGMainSubTheme: NSObject , Mappable {
    convenience override init() {
        self.init()
    }
    required init?(map: Map) {
    }
    var uri:String?
    var name:String?
     func mapping(map: Map) {
        uri <- map["uri"]
        name <- map["name"]
     }
 }

class SGMainThemeModel: NSObject , Mappable {
    var tab:String?
    var name:String?
    var data_source:String?
    var children:[SGMainSubTheme]?
    convenience override init() {
        self.init()
    }
    func mapping(map: Map) {
        tab <- map["tab"]
        name <- map["name"]
        data_source <- map["data_source"]
        children <- map["children"]
    }
    
    required init?(map: Map) {
        
    }
    
}

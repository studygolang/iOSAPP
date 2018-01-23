//
//  UIColor+Extension.swift
//  StudyGolang
//
//  Created by Mac on 2018/1/19.
//  Copyright © 2018年 Mac. All rights reserved.
//

import Foundation
import UIKit


extension UIColor {
    convenience public init(hex : Int) {
        let r = CGFloat((hex & 0xFF0000) >> 16) / 255.0
        let g = CGFloat((hex & 0xFF00) >> 8) / 255.0
        let b = CGFloat((hex & 0xFF)) / 255.0
        self.init(red: r, green: g, blue: b, alpha: 1)
    }
}



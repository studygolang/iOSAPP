//
//  Tools.swift
//  YY
//
//  Created by Mac on 2017/3/31.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit

enum IphoneType:Int
{
    case inch_35 = 0x01
    case inch_4
    case inch_47
    case inch_55
    static func getDeviceInch() -> IphoneType
    {
        var inch:IphoneType = IphoneType.inch_35;
        let devHeight:CGFloat = UIScreen.main.bounds.size.height
        switch devHeight {
        case 480:
            inch = IphoneType.inch_35
        case 568:
            inch = IphoneType.inch_4
        case 667:
            inch = IphoneType.inch_47
        case 736:
            inch = IphoneType.inch_55
        default:
            inch = IphoneType.inch_35
        }
        return inch
    }
}

class Tools: NSObject {

    
}


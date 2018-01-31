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
    case inch_57

 }

extension IphoneType {
    static func getDeviceInch() -> IphoneType
    {
        var inch:IphoneType = IphoneType.inch_35;
        let devHeight:CGFloat = UIScreen.main.bounds.size.height
        switch devHeight {
        case 480.0:
            inch = IphoneType.inch_35
        case 568.0:
            inch = IphoneType.inch_4
        case 667.0:
            inch = IphoneType.inch_47
        case 736.0:
            inch = IphoneType.inch_55
        case 812.0:
            inch = IphoneType.inch_57
        default:
            inch = IphoneType.inch_35
        }
        return inch
    }
}

class Tools: NSObject {

    
}


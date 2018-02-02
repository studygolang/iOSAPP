//
//  SGConstant.swift
//  StudyGolang
//
//  Created by Mac on 2018/1/18.
//  Copyright © 2018年 Mac. All rights reserved.
//

import Foundation
import UIKit


open class Constant {
    
}

public   let SGThemeColor = UIColor.init(hex: 0x39affa)
public   let SGNightTheme = UIColor.init(hex: 0x282b35)
public   let SGWhiteTheme = UIColor.init(hex: 0xf9f9f9)

public   let SGTextColor1 = UIColor.init(hex: 0x333333)
public   let SGTextColor2 = UIColor.init(hex: 0x666666)
public   let SGTextColor3 = UIColor.init(hex: 0x999999)


//屏幕宽高
public   let kScreenWidth = UIScreen.main.bounds.size.width
public   let kScreenHeight = UIScreen.main.bounds.size.height

//封装的日志输出功能（T表示不指定日志信息参数类型）
public func MyLog<T>(_ message:T, file:String = #file, function:String = #function,line:Int = #line) {
    #if DEBUG
        //获取文件名
        let fileName = (file as NSString).lastPathComponent
        //打印日志内容
        print("\(fileName) --- \(line) ---- (function)  ---- \(message)")
    #endif
}

 

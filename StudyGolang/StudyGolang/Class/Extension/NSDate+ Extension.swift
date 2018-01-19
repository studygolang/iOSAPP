//
//  NSDate+Tools.swift
//  YY
//
//  Created by Mac on 2017/4/6.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit

extension NSDate {

    public func isToday()->Bool
    {
        let calen = Calendar.current
        let nowCmps = calen.dateComponents([Calendar.Component.year,Calendar.Component.month,Calendar.Component.day], from: Date.init())
        let selfCmps = calen.dateComponents([Calendar.Component.year,Calendar.Component.month,Calendar.Component.day], from: self as Date)
        let state:Bool = (selfCmps.year == nowCmps.year) && (selfCmps.month == nowCmps.month) && (selfCmps.day == nowCmps.day)
        return state
    }
    
    public func dateWithYMD() ->NSDate
    {
        let formatter = DateFormatter.init()
        formatter.dateFormat = "yyyy-MM-dd"
        let dateStr = formatter.string(from: self as Date)
        let d1 = formatter.date(from: dateStr)!
        return d1 as NSDate
    }
    
    public func isYestoday() ->Bool
    {
        let nowDate = NSDate().dateWithYMD()
        let selfDate = self.dateWithYMD()
        let cel = Calendar.current
        let cmps = cel.dateComponents([Calendar.Component.day], from: selfDate as Date, to: nowDate as Date)
        return cmps.day == 1
    }
    
    
    /// 时间戳
    public var timestamp:TimeInterval { return self.timeIntervalSince1970}
    
    
    /// 时间成分
    public var component:DateComponents {
        let cal = Calendar.current
        let cmps = cal.dateComponents([.year,.month,.day,.hour,.minute,.second], from: self as Date)
        return cmps
    }

    
    /// 日期字符串转NSDate
    ///
    /// - Parameters:
    ///   - dateStr: “2017-12-03 12：21：23”
    ///   - foamat: "格式为 yyyy-MM-dd HH:mm:ss.SSS "
    /// - Returns: NSDate
    open class func dateFromString(dateStr:String,foamat:String) -> NSDate
    {
        let fmt = DateFormatter.init()
        fmt.dateFormat = foamat
        let d1 = fmt.date(from: dateStr)
        return d1! as NSDate
    }
    
    
    
    /// NSDate 转换成 日期字符串
    ///
    /// - Parameter format: " yyyy-MM-dd HH:mm:ss.SSS "
    /// - Returns: 日期字符串
    public func dateToString(format:String) ->String
    {
        let fmt = DateFormatter()
        fmt.dateFormat = format
        let str =  fmt.string(from: self as Date)
        return str
    }
    
    
    /// 将时间戳转换成日期字符串
    ///
    /// - Parameters:
    ///   - intervel: 时间戳
    ///   - format: 日期格式 yyyy-MM-dd HH:mm:ss.SSS "
    /// - Returns: 格式化后的字符串
    open class func dateFromTimeInterval(intervel:TimeInterval , format:String) -> String
    {
        let fmt = DateFormatter()
        fmt.dateFormat = format
        let d1 = Date.init(timeIntervalSince1970:intervel)
        let dateStr = fmt.string(from: d1)
        return dateStr
    }

    
    /// 将日期字符串转换成时间戳
    ///
    /// - Parameters:
    ///   - dateStr: 日期字符串
    ///   - format: 日期格式 yyyy-MM-dd HH:mm:ss.SSS "
    /// - Returns: 时间戳
    open class func dateStringToTimestamp(dateStr:String , format:String) ->TimeInterval
    {
        let d1 = NSDate.dateFromString(dateStr: dateStr, foamat: format)
        return d1.timestamp
    }
    
    
    /// 日期格式转换
    ///
    /// - Parameters:
    ///   - srcDateStr: 假设服务器返回的日期字符串是 “2017-02-12"
    ///   - srcFormat:  原始的format 应该传递 "yyyy-MM-dd"
    ///   - toFormat:  转换的format "yyyy年MM月dd日"
    /// - Returns: 返回后的字符串 “2017年02月12日"
    open class func dateStrToDateStr(srcDateStr:String , srcFormat:String , toFormat:String) -> String
    {
        let d1 = NSDate.dateFromString(dateStr: srcDateStr, foamat: srcFormat)
        let fmt = DateFormatter()
        fmt.dateFormat = toFormat
        let str = fmt.string(from: d1 as Date)
        return str
    }
    
}




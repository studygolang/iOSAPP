//
//  NSUserDefaults+Extension.swift
//  YY
//
//  Created by Mac on 2017/4/7.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit

extension UserDefaults {
    open class func cleanUserDefalut() {
        UserDefaults.resetStandardUserDefaults()
    }
    
    public typealias userDefalutBlock = (_ defalut:UserDefaults) ->Void
    open class func synchronizeValue(block:userDefalutBlock)->Bool
    {
        let d1 = UserDefaults.standard
        block(d1)
        return d1.synchronize()
    }
    
    open class func saveInteger(value:Int, key:String) ->Bool
    {
        return UserDefaults.synchronizeValue(block: { ( defalut:UserDefaults ) in
            defalut.set(value, forKey: key)
        })
    }
    
    open class func saveFloat(value:Float, key:String) ->Bool
    {
        return UserDefaults.synchronizeValue(block: { ( defalut:UserDefaults ) in
            defalut.set(value, forKey: key)
        })
    }
    
    open class func saveBool(value:Bool, key:String) ->Bool
    {
        return UserDefaults.synchronizeValue(block: { ( defalut:UserDefaults ) in
            defalut.set(value, forKey: key)
        })
    }
    
    open class func saveDouble(value:Double, key:String) ->Bool
    {
        return UserDefaults.synchronizeValue(block: { ( defalut:UserDefaults ) in
            defalut.set(value, forKey: key)
        })
    }
    
    open class func saveURL(value:URL, key:String) ->Bool
    {
        return UserDefaults.synchronizeValue(block: { ( defalut:UserDefaults ) in
            defalut.set(value, forKey: key)
        })
    }
    
    open class func saveObject(value:Any, key:String) ->Bool
    {
        return UserDefaults.synchronizeValue(block: { ( defalut:UserDefaults ) in
            defalut.setValue(value, forKey: key)
        })
    }
    
    open static func saveCustomInheritNSObject(obj:NSObject,key:String) ->Bool
    {
        return UserDefaults.synchronizeValue(block: { (defalut:UserDefaults) in
            let myLock = NSLock.init()
            myLock.lock()
            var dictM = Dictionary<String, Any>.init()
            var count:UInt32 = 0
            let plist = class_copyIvarList(obj.classForCoder, &count)
            for i in 0 ..< count {
                let ivar = plist?[Int(i)]
                let name = ivar_getName(ivar!)
                let key = NSString.init(utf8String: name!)! as String
                let v1 = obj.value(forKeyPath: key)
                if v1 != nil
                {
                    dictM[key] = v1
                }
            }
            let className = NSStringFromClass(obj.classForCoder)
            dictM["className"] = className;
            defalut.set(dictM, forKey: key)
            myLock.unlock()
        })
    }
    
    open static func readCustomInheritNSObject(key:String) ->NSObject
    {
        var obj = NSObject.init()
        let state = UserDefaults.synchronizeValue(block: { (defalut:UserDefaults) in
            let myLock = NSLock.init()
            myLock.lock()
            let d1 = defalut.object(forKey: key)
            let dictM = NSMutableDictionary.init(dictionary: d1 as! Dictionary)
            let className = dictM.value(forKey: "className")
            dictM.removeObject(forKey: "className")
            let cls = NSClassFromString(className as! String) as! NSObject.Type
            obj = cls.init()
            for (key, v) in dictM {
                obj.setValue(v, forKey: key as! String)
            }
            myLock.unlock()
        })
        
        print("readCustomInheritNSObjectstate -- ",state)
        return obj
    }
    
}



//
//  NSObject+Tools.swift
//  YY
//
//  Created by Mac on 2017/4/5.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit

public extension NSObject
{
    public func saveFile(fileName:String)
    {
        let loc:NSLock = NSLock.init()
        loc.lock()
        let que = OperationQueue.init()
        que.maxConcurrentOperationCount = 1
        que.addOperation
        {
            do
            {
                let path = NSString.getDocumentDirectory().appending(fileName)
                let d1 = try JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
                NSKeyedArchiver.archiveRootObject(d1, toFile: path)
            }
            catch let error as NSError
            {
                print("archiveRootObject error -- \(error)")
            }
        }
        loc.unlock()
    }
    
    public class func getFileWithName(file:String) ->Any
    {
        var tempObj:Any = NSNull.init()
        let loc:NSLock = NSLock.init()
        loc.lock()
        let que = OperationQueue.init()
        que.maxConcurrentOperationCount = 1
        que.addOperation {
            let path = NSString.getDocumentDirectory().appending(file)
            do {
                let d1 =  NSKeyedUnarchiver.unarchiveObject(withFile: path)
                let obj:Any =  try JSONSerialization.jsonObject(with: d1 as! Data, options: JSONSerialization.ReadingOptions.mutableContainers)
                tempObj = obj
            }
            catch let error as NSError {
                print(error)
            }
        }
        loc.unlock()
        
        return tempObj
    }
}

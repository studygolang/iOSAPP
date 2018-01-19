//
//  NSString+Tools.swift
//  YY
//
//  Created by Mac on 2017/4/5.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit

extension NSString {
    
    open class func getHomeDirectory() ->NSString
    {
        return NSHomeDirectory() as NSString
    }
    
    open class func getDocumentDirectory() ->NSString
    {
        let paths =  NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true);
        return paths[0] as NSString
    }
  
    open class func getLibraryPreferenceDirectory() ->NSString
    {
        let paths = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)
        let str = paths[0].appendingFormat("/Preference","")
        return str as NSString
    }
    
    open class func getLibraryCacheDirectory() ->NSString
    {
        let paths = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)
        return paths[0].appendingFormat("/Caches", "")
    }
    
    open class func getTempDirectory() ->NSString
    {
        let paths = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)
        return paths[0].appendingFormat("/tmp", "")
    }
    
    open class func getUUID()->NSString
    {
        let cUuid = CFUUIDCreate(nil)
        let cf = CFUUIDCreateString(nil, cUuid)! as CFString
        let str = NSString.init(format: "%@", cf as! CVarArg)
        return  str
    }
    
    func sizeWithFont(font:UIFont!,maxSize:CGSize!) -> CGSize
    {
        if (maxSize.width != 0 && maxSize.height != 0)
        {
            let rect = self.boundingRect(with: maxSize, options:NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font:font], context: nil)
            return rect.size
        }
        else
        {
            return CGSize.zero
        }
    }
    
    func replaceNull()->String
    {
        return self.replacingOccurrences(of: "(null)", with: "")
    }
}


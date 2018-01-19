//
//  UIButton+Tools.swift
//  YY
//
//  Created by Mac on 2017/3/31.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit

struct YYRuntimeKey {
    public static let btnClickKey = "btnClickClosureKey"
}

public extension UIButton {
    public typealias  BtnClickClosure = (_ sender:UIButton) -> Void
    @objc func extension_UIButton(sender:UIButton) -> Void
    {
        let closure:BtnClickClosure? = objc_getAssociatedObject(self, YYRuntimeKey.btnClickKey) as? UIButton.BtnClickClosure
        if closure != nil
        {
            closure!(sender)
        }
    }
    
    public func buttonClick(closure:BtnClickClosure?)
    {
        if closure != nil
        {
            objc_setAssociatedObject(self, YYRuntimeKey.btnClickKey, closure, objc_AssociationPolicy.OBJC_ASSOCIATION_COPY_NONATOMIC)
            self.addTarget(self, action: #selector(self.extension_UIButton(sender:)), for: UIControlEvents.touchUpInside)
        }
    }
    
   
    
}


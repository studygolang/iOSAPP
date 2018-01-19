//
//  UITextField+Extension.swift
//  YY
//
//  Created by Mac on 2017/4/13.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit

struct YYRuntimeKey_UITextField {
    public static let textKey1 = "YYRuntimeKey_UITextField_TextFiledDidBeginEditingKey"
    public static let textKey2 = "YYRuntimeKey_UITextField_TextFiledDidEndEditingKey"
    public static let textKey3 = "YYRuntimeKey_UITextField_TextFiledDidChangeKey"

}

extension UITextField {
    
    public typealias TextFieldClosure = (_ sender:UITextField?) ->Void
    
    public func textBegingEditing(cl:TextFieldClosure?) ->Void {
        if cl != nil {
            objc_setAssociatedObject(self, YYRuntimeKey_UITextField.textKey1, cl, objc_AssociationPolicy.OBJC_ASSOCIATION_COPY)
            let notify = NotificationCenter.default
            notify.addObserver(self, selector: #selector(textBegingEditingNotyfy(sender:)), name: NSNotification.Name.UITextFieldTextDidBeginEditing, object: NSObject.init())
            
        }
    }
    
    @objc func textBegingEditingNotyfy(sender:NSNotification)
    {
        let text = sender.object as! UITextField
        let closure = objc_getAssociatedObject(self, YYRuntimeKey_UITextField.textKey1) as! TextFieldClosure
        closure(text)
    }
    
    public func textEndEditing(cl:TextFieldClosure?) {
        if cl != nil {
            objc_setAssociatedObject(self, YYRuntimeKey_UITextField.textKey2, cl, objc_AssociationPolicy.OBJC_ASSOCIATION_COPY)
            let notify = NotificationCenter.default
            notify.addObserver(self, selector: #selector(textEndEditingNotify(sender:)), name: NSNotification.Name.UITextFieldTextDidEndEditing, object: NSObject.init())
            
        }
    }
    
    @objc func textEndEditingNotify(sender:NSNotification)
    {
        let text = sender.object as! UITextField
        let closure = objc_getAssociatedObject(self, YYRuntimeKey_UITextField.textKey2) as! TextFieldClosure
        closure(text)
    }
    

    public func textDidEndChange(cl:TextFieldClosure?) {
        if cl != nil {
            objc_setAssociatedObject(self, YYRuntimeKey_UITextField.textKey3, cl, objc_AssociationPolicy.OBJC_ASSOCIATION_COPY)
            let notify = NotificationCenter.default
            notify.addObserver(self, selector: #selector(textDidEndChangeNotify(sender:)), name: NSNotification.Name.UITextFieldTextDidChange, object: NSObject.init())
            
        }
    }

    @objc func textDidEndChangeNotify(sender:NSNotification)
    {
        let text = sender.object as! UITextField
        let closure = objc_getAssociatedObject(self, YYRuntimeKey_UITextField.textKey3) as! TextFieldClosure
        closure(text)
    }
    
}

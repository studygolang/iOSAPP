//
//  UIView+Tool.swift
//  YY
//
//  Created by Mac on 2017/3/31.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit

public extension UIView {
    
    var x: CGFloat {
        get {
            return self.frame.origin.x
        }
        set {
            var tempFrame = self.frame
            tempFrame.origin.x = newValue
            self.frame = tempFrame
        }
    }
    
    var y: CGFloat {
        get {
            return self.frame.origin.y
        }
        set {
            var tempFrame = self.frame
            tempFrame.origin.y = newValue
            self.frame = tempFrame
        }
    }
    
    var width: CGFloat {
        get {
            return self.frame.size.width
        }
        set {
            var tempFrame = self.frame
            tempFrame.size.width = newValue
            self.frame = tempFrame
        }
    }
    
    var height: CGFloat {
        get {
            return self.frame.size.height
        }
        set {
            var tempFrame = self.frame
            tempFrame.size.height = newValue
            self.frame = tempFrame
        }
    }
    
    var centerX: CGFloat {
        get {
            return self.center.x
        }
        set {
            var temP = self.center
            temP.x = newValue
            self.center = temP
        }
    }
    
    var centerY: CGFloat {
        get {
            return self.center.y
        }
        set {
            var temP = self.center
            temP.y = newValue
            self.center = temP
        }
    }
    
    var size: CGSize {
        get {
            return self.frame.size
        }
        set {
            var tempSize = self.frame.size
            tempSize = newValue
            self.frame.size = tempSize
        }
    }
    
    var cornerRadius : CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
            self.layer.masksToBounds = true
            self.clipsToBounds = true;
        }
    }
    
    var borderWidth: CGFloat {
        get {
            return self.layer.borderWidth
        }
        set {
            self.layer.borderWidth = newValue
            self.layer.masksToBounds = true
            self.clipsToBounds = true
        }
    }
    
    var borderColor : CGColor {
        get {
            return self.layer.borderColor!
        }
        set {
            self.layer.borderColor = newValue
            self.layer.masksToBounds = true
            self.clipsToBounds = true
        }
    }
}

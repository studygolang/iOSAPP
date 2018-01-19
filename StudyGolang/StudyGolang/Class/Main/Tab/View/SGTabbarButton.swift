//
//  SGTabbarButton.swift
//  SG
//
//  Created by Mac on 2017/4/18.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit

class SGTabbarButton: UIButton {

    var item: UITabBarItem {
        get {
            return UITabBarItem.init()
        }
        set {
            self.item = newValue
            self.setTitle(self.item.title, for: UIControlState.normal)
            self.setImage(self.item.image, for: UIControlState.normal)
            self.setImage(self.item.selectedImage, for: UIControlState.selected)
        }
    }
    
    convenience init() {
        self.init()
    }
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        self.imageView?.contentMode = UIViewContentMode.center
        self.titleLabel?.textAlignment = NSTextAlignment.center
        self.titleLabel?.font = UIFont.systemFont(ofSize: 13.0)
        self.setTitleColor(UIColor.gray, for: UIControlState.normal)
        self.setTitleColor(UIColor.orange, for: UIControlState.selected)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func imageRect(forContentRect contentRect: CGRect) -> CGRect
    {
        return CGRect.init(x: (self.width - 25) * 0.5, y: 5, width: 25, height: 23)
    }
    
    override func titleRect(forContentRect contentRect: CGRect) -> CGRect
    {
        return CGRect.init(x: 0, y: self.height * 0.65, width: self.width, height: self.height * 0.35)
    }
    
}



//
//  SGTabbarButton.swift
//  SG
//
//  Created by Mac on 2017/4/18.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit

class SGTabbarButton: UIButton {
     var item: UITabBarItem = UITabBarItem.init() {
        didSet {
            self.setTitle(self.item.title, for: .normal)
            self.setTitle(self.item.title, for: .selected)
            self.setImage(self.item.image, for: .normal)
            self.setImage(self.item.selectedImage, for: .selected)
        }
    }
     override init(frame: CGRect) {
        super.init(frame: frame)
        self.imageView?.contentMode = UIViewContentMode.center
        self.titleLabel?.textAlignment = NSTextAlignment.center
        self.titleLabel?.font = UIFont.systemFont(ofSize: 13.0)
         self.setTitleColor(SGTextColor1, for: .normal)
        self.setTitleColor(SGThemeColor, for: .selected)
     }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
     override func imageRect(forContentRect contentRect: CGRect) -> CGRect {
        if self.tag - 1212 == 1 {
            return CGRect.init(x: (self.width - 27) * 0.5, y: (self.height - 27) * 0.5, width: 27, height: 27)
        } else {
            return CGRect.init(x: (self.width - 20) * 0.5, y: 5, width: 20, height: 20)
        }
    }
     override func titleRect(forContentRect contentRect: CGRect) -> CGRect {
        if self.tag - 1212 == 1 {
            return CGRect.init(x: 0, y: self.height * 0.65, width: self.width, height:0)
         } else {
            return CGRect.init(x: 0, y: self.height * 0.6, width: self.width, height: self.height * 0.35)
         }
    }
 }



//
//  SGTabbar.swift
//  SG
//
//  Created by Mac on 2017/4/18.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit


protocol SGTabbarProtocol {
     func didSelectidx(tabbar:SGTabbar?,index:Int);
}

class SGTabbar: UIView {

    var delegate:SGTabbarProtocol?
    var curBtn:SGTabbarButton?
    private var buttons = [SGTabbarButton]()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.init(hex: 0xf5f5f5)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addTabbarItem(item:UITabBarItem) {
        let btn = SGTabbarButton.init()
        btn.addTarget(self, action: #selector(btnClick(btn:)), for: .touchUpInside)
        btn.item = item
        btn.tag = self.buttons.count + 1212
        self.addSubview(btn)
        self.buttons.append(btn)
        if 1 == self.buttons.count {
            let b1 = self.buttons.first
            self.btnClick(btn:b1!)
        }
    }
    
    func selectFirstItem() {
        if self.buttons.count > 0 {
            let btn:SGTabbarButton = self.buttons[0]
            self.btnClick(btn: btn)
        }
    }
    
    @objc private func btnClick(btn:SGTabbarButton) {
        self.curBtn = btn
        for b1 in self.buttons {
           b1.isSelected = false
        }
        self.curBtn?.isSelected = true
        if self.delegate != nil {
            self.delegate?.didSelectidx(tabbar: self, index: btn.tag - 1212)
        }
     }
     override func layoutSubviews() {
        super.layoutSubviews()
        let cnt = self.buttons.count
        let height = self.height
        let wid = Int(kScreenWidth) / cnt
        for i in 0..<cnt {
            let btn = self.buttons[i]
            btn.width = CGFloat(wid)
            btn.height = CGFloat(height)
            btn.x = CGFloat(i * wid)
            btn.y = 0.0
        }
    }
}



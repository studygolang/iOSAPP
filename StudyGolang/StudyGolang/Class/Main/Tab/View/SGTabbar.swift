//
//  SGTabbar.swift
//  SG
//
//  Created by Mac on 2017/4/18.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit


@objc protocol SGTabbarProtocol {
    @objc optional func didSelectidx(tabbar:SGTabbar?,index:Int);
}

class SGTabbar: UIView {

    var delegate:SGTabbarProtocol?
    var curBtn:SGTabbarButton?
    
    private var buttons = [SGTabbarButton]()
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addTabbarItem(item:UITabBarItem) {
        let btn = SGTabbarButton.init()
        btn.addTarget(self, action: #selector(self.btnClick(btn:)), for: UIControlEvents.touchUpInside)
        btn.item = item
        btn.name = "hiuxhuibx"
        btn.isSelected = false;
        btn.tag = self.buttons.count + 1212
        self.addSubview(btn)
        self.buttons.insert(btn, at: self.buttons.count)
        if 1 == self.buttons.count {
            let b1 = self.buttons[0]
            self.btnClick(btn:b1)
        }
    }
    
    func selectFirstItem() {
        if self.buttons.count > 0 {
            let btn:SGTabbarButton = self.buttons[0]
            self.btnClick(btn: btn)
        }
    }
    
    func selectCurIdx(index:NSInteger) {
        let btn:SGTabbarButton = self.viewWithTag(1212+index) as! SGTabbarButton
        self.curBtn = btn
        for item in self.buttons {
            let b1 = item
            if b1 == self.curBtn {
                b1.isSelected = true
            }
            else {
                b1.isSelected = false
            }
        }
    }
    
    @objc private func btnClick(btn:SGTabbarButton) {
        self.curBtn = btn
        for item in self.buttons {
            let b1 = item
            if b1 == self.curBtn {
                b1.isSelected = true
            }
            else {
                b1.isSelected = false
            }
        }
        self.delegate?.didSelectidx!(tabbar: self, index: btn.tag - 1212)
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



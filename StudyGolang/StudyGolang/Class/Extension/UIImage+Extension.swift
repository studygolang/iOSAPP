//
//  UIImage+Extension.swift
//  YY
//
//  Created by Mac on 2017/4/14.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit
import CoreGraphics

extension UIImage
{
    open class func cutImage(size:CGSize,img:UIImage) ->UIImage
    {
        var retImg = UIImage.init()
        let locker = NSLock.init()
        locker.lock()
        var newImgSize = CGSize.zero
        let imgVSize = size
        let originImgSize = img.size
        if (originImgSize.width / originImgSize.height) > (imgVSize.width / imgVSize.height)
        {
            // imageView的宽高比 > image的宽高比
            newImgSize.width = originImgSize.width
            newImgSize.height = imgVSize.height * (originImgSize.width / imgVSize.width)
            retImg = UIImage.init(cgImage: img.ciImage?.cropped(to: CGRect.init(origin: CGPoint.init(x: 0, y: fabs(0.5 * (originImgSize.height - newImgSize.height))), size: newImgSize)) as! CGImage)
        }
        else
        {
            newImgSize.height = originImgSize.height
            newImgSize.width = imgVSize.width * (originImgSize.height / imgVSize.height)
            retImg = UIImage.init(cgImage: img.ciImage?.cropped(to: CGRect.init(origin: CGPoint.init(x: fabs(originImgSize.width - newImgSize.width) * 0.5, y: 0), size: newImgSize)) as! CGImage)
        }
        locker.unlock()
        return retImg;
    }
    
}




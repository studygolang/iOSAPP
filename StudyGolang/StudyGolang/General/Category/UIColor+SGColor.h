//
//  UIColor+SGColor.h
//  StudyGolang
//
//  Created by deadvia on 2016/12/19.
//  Copyright © 2016年 tilink. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (SGColor)

/**
 *  将16进制字符串转换成UIColor
 */
+ (UIColor *)colorWithHexString:(NSString *)color;

/**
 *  将16进制字符串转换成UIColor
 */
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

@end

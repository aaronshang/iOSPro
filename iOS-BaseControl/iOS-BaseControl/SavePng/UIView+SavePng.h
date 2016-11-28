//
//  UIView+SavePng.h
//  iOS-BaseControl
//
//  Created by aaron on 16/11/28.
//  Copyright © 2016年 aaron. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, NSPictureType){
    NSPictureTypePNG,
    NSPictureTypeJPG
};

@interface UIView (SavePng)

/*!
 *  @author SK, 16-11-28 22:11:24
 *
 *  @brief 保存当前UIView为图片
 *
 *  @param path 存放路径
 *  @param type 类型
 */
- (void)clipScreenWithPath:(NSString *)path type:(NSPictureType)type;

@end

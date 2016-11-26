//
//  MoveView.h
//  MoveLabel
//
//  Created by kai.shang on 16/10/31.
//  Copyright © 2016年 SK.com All rights reserved.
//

/**
 *  @author SK, 16-11-08 10:11
 *
 *  @brief 先实现基本功能
            1 View的拖动
            2 水平改变宽度
            3 上下改变高度
            4 背景加矩形框
         
         对内
            1 先实现创建
            2 实现反转
            3 实现贴图，或是基于此控件
 
    精细化控制：
        图片模式：
            1 左右拖动范围，[0.5~2]
            2 上下拖动范围，[0.5~2]
 */

#import <UIKit/UIKit.h>

@interface MoveView : UIView

/**
 *  @author SK, 16-11-09 15:11
 *
 *  @brief 位置关系 0，1，2，3-【原始位置、顺时针90、顺时针180、顺时针270】
 */
@property (nonatomic, assign) NSUInteger position;

/*!
 *  @author SK, 16-11-26 10:11:17
 *
 *  @brief 旋转View
 */
-(void) rotateView;

@end

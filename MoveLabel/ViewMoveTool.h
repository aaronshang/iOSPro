//
//  ViewMoveTool.h
//  MoveLabel
//
//  Created by 温春宇 on 16/7/26.
//  Copyright © 2016年 wcy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ViewMoveTool : NSObject

/** 单利 */
+ (instancetype)sharedViewMoveTool;

- (UIView *)addMoveCorner:(UIView *)view;
@end

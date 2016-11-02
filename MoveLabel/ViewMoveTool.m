
//
//  ViewMoveTool.m
//  MoveLabel
//
//  Created by 温春宇 on 16/7/26.
//  Copyright © 2016年 wcy. All rights reserved.
//

#import "ViewMoveTool.h"
#import "BaseMoveView.h"


@implementation ViewMoveTool

static  ViewMoveTool *_INSTANCE;
+ (instancetype)sharedViewMoveTool {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        if (!_INSTANCE) {
            _INSTANCE = [[ViewMoveTool alloc]init];
        }
        
    });
    return _INSTANCE;
}

- (UIView *)addMoveCorner:(UIView *)view {
//    [];
    //调用baseview的方法,添加四个角
    BaseMoveView *baseMoveView = [[BaseMoveView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
//    [view addSubview:baseMoveView];
    
    return nil;
}
@end

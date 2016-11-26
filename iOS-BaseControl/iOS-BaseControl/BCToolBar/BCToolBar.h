//
//  BCToolBar.h
//  ToolBar
//
//  Created by aaron on 16/11/26.
//  Copyright © 2016年 aaron. All rights reserved.
//
/*!
 *  @author SK, 16-11-26 20:11:28
 *
 *  @brief 可滚动的工具栏
 *
 *  how to use
 *
 *   NSArray *nameAry = @[];
 
    BCToolBar *bcToolBar = [[BCToolBar alloc] initWithFrame:CGRectMake(0, 200, 375, 44)];
    [bcToolBar setTitleAry:nameAry];
    [self.view addSubview:bcToolBar];
     
    bcToolBar.clickBlock=^(NSInteger index){};
 */



#import <UIKit/UIKit.h>

typedef void(^ClickBlock)(NSInteger index);

@interface BCToolBar : UIScrollView

@property (nonatomic, copy) ClickBlock clickBlock;

-(void) setTitleAry:(NSArray*) ary;

@end

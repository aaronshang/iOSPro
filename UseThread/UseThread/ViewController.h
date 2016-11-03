//
//  ViewController.h
//  UseThread
//
//  Created by kai.shang on 16/11/3.
//  Copyright © 2016年 SK. All rights reserved.
//

/**
 *  @brief 验证iOS下多线程的使用
    1 多线程并发
    2 互斥操作
    3 顺序排队
    4 基类调用动作
 
    场景 A
    以售票为例，三个线程共卖出100张票。
 *
 */


#import <UIKit/UIKit.h>

@interface ViewController : UIViewController


-(IBAction)test:(id)sender;

@end


//
//  House.h
//  OS-Objective-C
//
//  Created by kai.shang on 16/12/21.
//  Copyright © 2016年 SK. All rights reserved.
//
/**
 *  @author SK, 16-12-21 14:12
 *
 *  @brief  验证OC下内存使用，MAC OS下看同样验证
 *  
    发现的问题：若为属性变量，Analyze不能检测到问题。
 
 *  @return
 */



#import <Foundation/Foundation.h>

@interface House : NSObject

-(void) runCar;

@end

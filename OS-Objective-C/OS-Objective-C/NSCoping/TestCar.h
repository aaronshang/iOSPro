//
//  TestCar.h
//  OS-Objective-C
//
//  Created by kai.shang on 2017/2/6.
//  Copyright © 2017年 SK. All rights reserved.
//

/*
 完成对象拷贝
 1 需要对象实现协议方法‘allocWithZone’，并且初始化
 2 设置属性值
 3 如果是子类实现‘拷贝协议’，只需调用父类的‘copyWithZone’
 */


#import <Foundation/Foundation.h>

@interface TestCar : NSObject

-(void) testCopyObject;

@end

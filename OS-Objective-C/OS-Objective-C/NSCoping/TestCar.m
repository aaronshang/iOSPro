//
//  TestCar.m
//  OS-Objective-C
//
//  Created by kai.shang on 2017/2/6.
//  Copyright © 2017年 SK. All rights reserved.
//

#import "TestCar.h"
#import "RedCar.h"

@implementation TestCar

-(void) testCopyObject{

    RedCar *car = [[RedCar alloc] init];
    
    for(int i=0; i<4; i++){
        AllWeatherRadial *radialTire = [[AllWeatherRadial alloc] init];
        [radialTire setName:[NSString stringWithFormat:@"Tire index %d", (i+1)]];
        [radialTire setPressure:(0.25*(i+1))];
        [car.tireAry addObject:radialTire];
    }
    
    [car printInfo];
    
    /*
     完成对象拷贝
     1 需要对象实现协议方法‘allocWithZone’，并且初始化
     2 设置属性值
     3 如果是子类实现‘拷贝协议’，只需调用父类的‘copyWithZone’
     */
    RedCar *copyCar =[car copy];
    
    [copyCar printInfo];
}


@end

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
    
//    [car printInfo];
    
    RedCar *copyCar =[car copy];
    [copyCar printInfo];
}


@end

//
//  House.m
//  OS-Objective-C
//
//  Created by kai.shang on 16/12/21.
//  Copyright © 2016年 SK. All rights reserved.
//

#import "House.h"
#import "Car.h"

@implementation House

-(void) runCar{

    @autoreleasepool {
        Car *car = [[Car alloc] init];
        [car runRedLight];
    }

}


@end

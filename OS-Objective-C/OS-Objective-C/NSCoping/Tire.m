//
//  Tire.m
//  OS-Objective-C
//
//  Created by kai.shang on 2017/2/6.
//  Copyright © 2017年 SK. All rights reserved.
//

#import "Tire.h"

@implementation Tire

-(id)copyWithZone:(NSZone *)zone{
    
    Tire *copyTire = [[[self class] allocWithZone:zone] init];
    [copyTire setPressure:_pressure];
    [copyTire setName:_name];
    return copyTire;
}

@end

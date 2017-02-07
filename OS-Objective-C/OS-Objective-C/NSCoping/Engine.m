//
//  Engine.m
//  OS-Objective-C
//
//  Created by kai.shang on 2017/2/6.
//  Copyright © 2017年 SK. All rights reserved.
//

#import "Engine.h"

@implementation Engine

-(id) copyWithZone:(NSZone *)zone{

    Engine *copyEngine = [[[self class] allocWithZone:zone] init];
    return copyEngine;
}

@end

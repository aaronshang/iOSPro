//
//  Car.m
//  OS-Objective-C
//
//  Created by kai.shang on 16/12/21.
//  Copyright © 2016年 SK. All rights reserved.
//

#import "Car.h"

@implementation Car

-(instancetype)init{
    
    self = [super init];
    if(self){
        _nameAry = [NSMutableArray arrayWithCapacity:10];
    }
    
    return self;
}


-(void) dealloc{
    
//    NSLog(@"Car dealloc %ld", nameAry.retainCount);
    [_nameAry release];
    [super dealloc];
}


-(void) runRedLight{

    NSLog(@"nameAry retain count %ld", _nameAry.retainCount);
    
    NSMutableArray *lightAry = [[NSMutableArray alloc] init];
    [lightAry addObject:@"Red"];
    
    [lightAry release];
    lightAry = [[NSMutableArray alloc] init];
    NSLog(@"lightAry %ld", lightAry.retainCount);
    [lightAry release];
    
     _nameAry = [[NSMutableArray alloc] init];
    
}

@end

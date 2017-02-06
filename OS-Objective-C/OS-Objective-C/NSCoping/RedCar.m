//
//  Car.m
//  OS-Objective-C
//
//  Created by kai.shang on 2017/2/6.
//  Copyright © 2017年 SK. All rights reserved.
//

#import "RedCar.h"

@implementation RedCar


-(instancetype) init{
    
    self = [super init];
    if(self) {
        _engine = [[Engine alloc] init];
        _tireAry = [[NSMutableArray alloc] initWithCapacity:4];
    }
    return self;
}

- (id)copyWithZone:(nullable NSZone *)zone{
    
    RedCar *copyCar = [[self class] allocWithZone:zone];
    return copyCar;
}

-(void) printInfo{
    
    NSMutableString *infoStr = [[NSMutableString alloc] initWithCapacity:10];
    [infoStr appendString:self.engine.className];
    [infoStr appendString:@"\n"];
    
    for (Tire *tire in self.tireAry) {
        [infoStr appendString:[NSString stringWithFormat:@"%@  pressure: %.2f", tire.name, tire.pressure]];
        [infoStr appendString:@"-"];
    }
    
    NSLog(@"Car: [%@]", infoStr);
}

@end

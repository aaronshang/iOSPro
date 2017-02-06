//
//  Car.h
//  OS-Objective-C
//
//  Created by kai.shang on 2017/2/6.
//  Copyright © 2017年 SK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AllWeatherRadial.h"
#import "Engine.h"

@interface RedCar : NSObject<NSCopying>{
    
}

@property(nonatomic, strong) NSMutableArray *tireAry;
@property(nonatomic, strong) Engine *engine;

-(void) printInfo;

@end

//
//  Tire.h
//  OS-Objective-C
//
//  Created by kai.shang on 2017/2/6.
//  Copyright © 2017年 SK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tire : NSObject<NSCopying>

@property(nonatomic, assign) float pressure;
@property(nonatomic, copy) NSString *name;

@end

//
//  MyClass.h
//  OS-runtime
//
//  Created by kai.shang on 16/12/22.
//  Copyright © 2016年 SK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BasicClass : NSObject

@end

@interface MyClass : BasicClass

@property (nonatomic, strong)NSString *name;
@property (nonatomic, strong)NSString *hobbit;

-(void) runFunction;
@end

//
//  GCDThread.m
//  UseThread
//
//  Created by kai.shang on 16/11/3.
//  Copyright © 2016年 SK. All rights reserved.
//

#import "GCDThread.h"

@interface GCDThread()

@property(nonatomic, strong) NSLock *ticketLock;
@end


@implementation GCDThread

-(instancetype)init{

    self = [super init];
    if (self) {
        _ticketLock = [[NSLock alloc] init];
    }
    return self;
}


/**
 *  @brief 卖票
 */
-(void) sellTicket{
    [_ticketLock lock];
    static int ticketCount = 100;
    [_ticketLock unlock];
    
    while (ticketCount>=0) {
        
       [_ticketLock lock];
        if (ticketCount>0) {
            NSLog(@"[Thread %@] sell %d", [NSThread currentThread].name, ticketCount);
            ticketCount--;
        }
        [_ticketLock unlock];
    }
    
}

-(void) testAScene{

    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [[NSThread currentThread] setName:@"A"];
        [self sellTicket];
    });
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [[NSThread currentThread] setName:@"B"];
        [self sellTicket];
    });
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [[NSThread currentThread] setName:@"C"];
        [self sellTicket];
    });
}


@end

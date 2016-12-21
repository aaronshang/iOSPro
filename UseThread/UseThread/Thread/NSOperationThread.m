//
//  NSOperationThread.m
//  UseThread
//
//  Created by kai.shang on 16/12/19.
//  Copyright © 2016年 SK. All rights reserved.
//

#import "NSOperationThread.h"

@implementation NSOperationThread


-(void) demoBlock{
    
    NSBlockOperation *op = [[NSBlockOperation alloc] init];
    [op addExecutionBlock:^{
       
        [[NSThread currentThread] setName:@"T1"];
        int i=0;
        while(i<10){
            NSLog(@"%@ %d", [NSThread currentThread].name, i);
            i++;
        }
    }];
    
    [op addExecutionBlock:^{
        [[NSThread currentThread] setName:@"T2"];
        int i=0;
        while(i<10){
            NSLog(@"%@ %d", [NSThread currentThread].name, i);
            i++;
        }
    }];
    
    [op start];
    
    NSLog(@"dog %d", [op isAsynchronous]);
}

-(void) demoQueue{
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"download1----%@", [NSThread  currentThread]);
    }];
    
    NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
        [[NSThread currentThread] setName:@"T2"];
        int i=0;
        while(i<10){
            NSLog(@"%@ %d", [NSThread currentThread].name, i);sleep(1);
            i++;
        }
    }];
    
    NSBlockOperation *op3 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"download3----%@", [NSThread  currentThread]);
    }];
    
    
    [op1 addDependency:op3];
    
    [queue addOperation:op1];
    [queue addOperation:op2];
    [queue addOperation:op3];
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
       
        sleep(2);
        
//        sleep(3);
//        [op2 ];
    });
}

-(void) test{
    [self demoQueue];
}


@end

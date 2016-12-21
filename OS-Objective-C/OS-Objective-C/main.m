//
//  main.m
//  OS-Objective-C
//
//  Created by kai.shang on 16/12/21.
//  Copyright © 2016年 SK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "House.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
    
        NSBlockOperation *op = [NSBlockOperation blockOperationWithBlock:^{
            
            int i=0;
            while (i<10) {
                House *house = [[House alloc] init];
                [house runCar];
                sleep(1);
                i++;
            }
        }];
        
        [op start];
    }
    return 0;
}

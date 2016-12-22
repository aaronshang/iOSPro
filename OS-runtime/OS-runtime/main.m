//
//  main.m
//  OS-runtime
//
//  Created by kai.shang on 16/12/22.
//  Copyright © 2016年 SK. All rights reserved.
//
#import "Test.h"

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");

        Test *test = [[Test alloc] init];
        
//        [test testBasicClassInfo];
        
        [test createClassDynamicly];
    }
    return 0;
}

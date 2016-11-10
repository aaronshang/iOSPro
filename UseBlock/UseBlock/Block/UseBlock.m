//
//  UseBlock.m
//  UseBlock
//
//  Created by kai.shang on 16/11/10.
//  Copyright © 2016年 SK. All rights reserved.
//

#import "UseBlock.h"

@implementation UseBlock


-(void) testBlockWithParam{

    [self getStudentFullName:^NSString *(NSString *firstName) {
        return [NSString stringWithFormat:@"%@ Aaron", firstName];
    }];
}

/**
 *  @author SK, 16-11-10 17:11
 *
 *  @brief 带返回值的Block，可以在Block中做些处理。
 *
 *  @param block <#block description#>
 */
-(void) getStudentFullName:(GetFullName) block{
    
    NSString *str = block(@"SK");
    NSLog(@"FullName: %@", str);
}

@end

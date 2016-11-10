//
//  UseBlock.h
//  UseBlock
//
//  Created by kai.shang on 16/11/10.
//  Copyright © 2016年 SK. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NSString* (^GetFullName)(NSString *firstName);

@interface UseBlock : NSObject

/**
 *  @author SK, 16-11-10 17:11
 *
 *  @brief 验证带参数及返回值的Block
 */
-(void) testBlockWithParam;

@end

//
//  TextActionProxy.h
//  IOS-JsAndNativeDemo
//
//  Created by zhangPeng on 16/8/22.
//  Copyright © 2016年 ZhangPeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol TestJSObjectProtocol <JSExport>

- (NSString *)getVersion;

JSExportAs(getSum, - (NSInteger)getNumsumNumber1:(id)num1 number2:(id)num2 number3:(id)num3);

- (void)showNotice;

@end

@interface TestActionProxy : NSObject<TestJSObjectProtocol>

@end

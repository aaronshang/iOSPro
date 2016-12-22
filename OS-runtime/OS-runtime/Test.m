//
//  Test.m
//  OS-runtime
//
//  Created by kai.shang on 16/12/22.
//  Copyright © 2016年 SK. All rights reserved.
//

#import "Test.h"
#import <objc/runtime.h>
#import "MyClass.h"

@implementation Test


-(void) createClassDynamicly{

    MyClass *myClass = [[MyClass alloc] init];
    Class cls = myClass.class;
    
    //动态创建类
    Class subcls = objc_allocateClassPair(cls, "MySubClass", 0);
    class_addMethod(subcls, @selector(subMethod1), (IMP)imp_subMethod1, "v@:");
    objc_registerClassPair(subcls);
    
    id instance = [[subcls alloc] init];
    [instance performSelector:@selector(subMethod1) withObject:nil];
}

-(void)subMethod1{
    
    NSLog(@"subMethod1 work");
}

void imp_subMethod1(id self, SEL _cmd)
{
    // implementation ....
    NSLog(@"imp_subMethod1 work");
}

-(void) testBasicClassInfo{
    
    MyClass *myClass = [[MyClass alloc] init];
    Class cls = myClass.class;
    
    //获取类名、父类名
    NSLog(@"class name: %s", class_getName(myClass.class));
    NSLog(@"super class: %s", class_getName(class_getSuperclass(myClass.class)));
    
    //成员变量
    unsigned int outCount = 0;
    Ivar *ivars = class_copyIvarList(cls, &outCount);
    for (int i=0; i<outCount; i++) {
        Ivar ivar = ivars[i];
        NSLog(@"instance variable's name: %s", ivar_getName(ivar));
    }
    free(ivars);
    
    //属性
    objc_property_t *properties = class_copyPropertyList(cls, &outCount);
    for (int i=0; i<outCount; i++) {
        objc_property_t property = properties[i];
        NSLog(@"property's name %s", property_getName(property));
    }
    free(properties);
    
    //某个特定属性
    objc_property_t hobbit = class_getProperty(cls, "hobbit");
    if (hobbit!=NULL) {
        NSLog(@"-property's name %s", property_getName(hobbit));
    }
}

@end

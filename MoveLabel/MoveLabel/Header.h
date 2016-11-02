//
//  Header.h
//
//
//  Copyright (c) 2015年 . All rights reserved.
//

/**
 *  头文件
 */
#import "Header.h"
#ifndef Huidu_Header_h
#define Huidu_Header_h


#pragma mark 屏幕
//------获取设备大小------

//导航栏的高度
#define NavigationBar_Height_1 44
#define NavigationBar_Height_2 64
//工具栏高度
#define TabBar_Height_1 49
#define TabBar_Height_2 73
//状态栏高度
#define State_Height_1 20
#define State_Height_2 27

#define ScreenBounds [[UIScreen mainScreen] bounds]         //屏幕bounds
#define WIDTH [[UIScreen mainScreen] bounds].size.width     //屏幕width
#define HEIGHT [[UIScreen mainScreen] bounds].size.height   //屏幕height
//获取屏幕的大小
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
//------获取设备大小------

#pragma mark 类名

#define VC @"UIViewController"
#define NUM @"NSNumber"
#define ARR @"NSArray"
#define STR @"NSString"

//开屏广告相关
#define OPEN_SPLASH_DATA @"open splash data"
#define OPEN_SPLASH_DURATION @"duration"


//推送相关

#pragma mark 打印日志
//------打印日至---------
//DEBUG 模式下打印日至，当前行
#ifdef DEBUG
# define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
# define DLog(...)
#endif

//重写NSLog,Debug模式下打印日志和当前行数
#if DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"\nfunction:%s line:%d content:%s\n", __FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(FORMAT, ...) nil
#endif

//DEBUG  模式下打印日志,当前行 并弹出一个警告
#ifdef DEBUG
#   define ULog(fmt, ...)  { UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%s\n [Line %d] ", __PRETTY_FUNCTION__, __LINE__] message:[NSString stringWithFormat:fmt, ##__VA_ARGS__]  delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil]; [alert show]; }
#else
#   define ULog(...)
#endif
//------打印日至---------


#pragma mark - 获取机型/设备/系统
//------机型/设备/系统----------
//获取系统版本
#define IOS_VERSION  [[[UIDevice currentDevice] systemVersion] floatValue]
#define CurrentSystemVersion   [[UIDevice currentDevice] systemVersion]
//判断是否是 Retina屏，设备是否是iPhone5，6，是否是iphone6+
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_RETINA ([[UIScreen mainScreen] scale] >= 2.0)


#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))

#define IS_IPHONE_4_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
#define IS_IPHONE_5 (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE_6 (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE_6P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)

//判断是真机还是模拟器
#if TARGET_OS_IPHONE
#endif
#if TARGET_IPHONE_SIMULATOR
#endif

//------机型/设备/系统----------



#pragma mark - 常用方法
//------常用方法---------
#pragma mark 颜色
#define HDColorMake(r, g, b, a) [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:(a)]
//rgb颜色转换
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define RGBAP(r, g, b, a) [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:(a)]
#define RGB(r,g,b) RGBAP(r,g,b,1.0f)

//------常用方法---------






#pragma mark - 各类控件Tag基数
//---------各类控件的Tag值基数----------
#define TABLEVIEWTAG 100


//---------各类控件的Tag值基数----------


#pragma mark------------------------BYDailyNews-master------------
//-------频道导航栏相关---------

#pragma mark------------------------BYDailyNews-master------------

#define kStatusHeight 20
#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height
#define RGBColor(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define RGBColorAlpha(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
#define kItemFont ((IS_IPHONE_6P) ? 16 : ((IS_IPHONE_6)?14:11))

//夜间模式
#define IsNight @"isNight"

typedef enum{
    AnimationEditNone = 0,        //无
    AnimationEditFadeIn = 1,      //淡入
    AnimationEditMoveIn = 2,      //移入
    AnimationEditScaleBig = 3,    //放大
    AnimationEditRevolve = 4,     //旋转
    AnimationEditFlipOver = 5,    //翻转
    AnimationEditShake = 6,       //悬摆
    AnimationEditFadeOut = 7,     //淡出
    AnimationEditFlipOverDisappear = 8 //翻转消失
    
} animateEditType;

//-------频道导航栏相关---------

#pragma mark 版本

#define HDDeviceVersion [[[UIDevice currentDevice] systemVersion] floatValue]


#pragma mark-----网络接口相关




#endif

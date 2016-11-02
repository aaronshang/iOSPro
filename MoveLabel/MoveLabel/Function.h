//
//  Function.h
//  Huidu
//
//  Created by xx on 15/10/24.
//  Copyright (c) from internet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <objc/message.h>

/**
 *  工具类
 */
@interface Function : NSObject

/**
 *  验证对象类类型
 *
 *  @param objc 待验证对象
 *  @param cla  验证类类名
 *
 *  @return 验证结果
 */
+ (BOOL)verifyObject:(id)objc isClass:(NSString *)cla;

#pragma mark - UIView
//UIView
+ (UIView*)createViewWithFrame:(CGRect)frame backgroundColor:(UIColor *)color;
+ (UIView*)createViewWithBackGroundColor:(UIColor *)color;
#pragma mark - UILable
//UILabel
+ (UILabel*)createLabelWithFrame:(CGRect)frame font:(CGFloat)font Text:(NSString*)text;

/**
 *  masonry下的创建方法,frame的大小另行设置
 *
 *  @param text      <#text description#>
 *  @param font      <#font description#>
 *  @param bgColor   背景色
 *  @param textColor 字体颜色
 *
 *  @return <#return value description#>
 */
+ (UILabel*)createLabelWithText:(NSString *)text font:(CGFloat)font backgroundColor:(UIColor*)bgColor textColor:(UIColor*)textColor;
/**
 * 返回label的高度
 * @param label  需要返回高度的label
 * @param width  the width of label
 */
+(CGFloat)returnHeightOfLabel:(UILabel *)label withWidth:(CGFloat)width;
/**
 * 返回label的高度  已知label的frame
 * @param label   需要返回高度的label
 */
+(CGFloat)returnHeightOfLabel:(UILabel *)label;



#pragma mark - UIButton
/**
 *  带frame的button
 *
 *  @param frame         <#frame description#>
 *  @param title         <#title description#>
 *  @param color         <#color description#>
 *  @param bgImageName   <#bgImageName description#>
 *  @param selectedTitle <#selectedTitle description#>
 *  @param selectedColor <#selectedColor description#>
 *  @param selectedImage <#selectedImage description#>
 *  @param target        <#target description#>
 *  @param method        <#method description#>
 *
 *  @return <#return value description#>
 */
+ (UIButton*)createButtonWithFrame:(CGRect)frame title:(NSString*)title titleColor:(UIColor *)color bgImageName:(NSString*)bgImageName selectedTitle:(NSString*)selectedTitle selectedTitleColor:(UIColor*)selectedColor selectedBgImageName:(NSString*)selectedImage target:(id)target method:(SEL)method;

/**
 *  不带frame 的button 用于masonry约束
 *
 *  @param title         <#title description#>
 *  @param color         <#color description#>
 *  @param bgImageName   <#bgImageName description#>
 *  @param selectedTitle <#selectedTitle description#>
 *  @param selectedColor <#selectedColor description#>
 *  @param selectedImage <#selectedImage description#>
 *  @param target        <#target description#>
 *  @param method        <#method description#>
 *
 *  @return <#return value description#>
 */
+ (UIButton*)createButtonWithTitle:(NSString *)title titleColor:(UIColor *)color bgImageName:(NSString *)bgImageName selectedTitle:(NSString *)selectedTitle selectedTitleColor:(UIColor *)selectedColor selectedBgImageName:(NSString *)selectedImage target:(id)target method:(SEL)method;
//设置填充图片
+(UIButton*)createButtonWithbgImage:(NSString *)bgImageName selectedBgImageName:(NSString *)selectedImage target:(id)target method:(SEL)method;
//设置背景图片
+(UIButton *)createButtonWithBackGroundImage:(NSString *)bgImageName selectedBgImageName:(NSString *)selectedImage target:(id)target method:(SEL)method;


#pragma mark - UIImageVIew
/**
 *  带frame的
 *
 *  @param frame     <#frame description#>
 *  @param imageName <#imageName description#>
 *
 *  @return <#return value description#>
 */
+ (UIImageView*)createImageViewWithFrame:(CGRect)frame imageName:(NSString*)imageName;
/**
 *
 *
 *  @param color     <#color description#>
 *  @param imageName <#imageName description#>
 *
 *  @return <#return value description#>
 */
+ (UIImageView*)createImageViewWithBackgruandColor:(UIColor*)color imageName:(NSString *)imageName;

#pragma mark - UIImage
/**
 * @param name   name description
 * @param type   image description
 */
+(UIImage*)CreatedImageFromFile:(NSString *)name ofType:(NSString *)type;
+(UIImage*)createdimageWithName:(NSString *)name;

#pragma mark - UITextField

+ (UITextField*)createTextFieldWithFrame:(CGRect)frame target:(id)target placeholder:(NSString*)placeholder font:(CGFloat)font secureTextEntry:(BOOL)secureTextEntry clearButton:(BOOL)clearButton;

+(UITextField *)createTextFieldWithTarget:(id)target placeholder:(NSString *)placeholder font:(CGFloat)font secureTextEntry:(BOOL)secureTextEntry clearButton:(BOOL)clearButton;

#pragma mark - NSUserDefault

/*
 * 保存default信息
 * @param srt:需保存的文字
 * @param key:关键字
 */
+(void)SaveDefaultInfo:(id)str Key:(NSString*)_key;
/*
 * 获得保存default信息
 * @param key:关键字
 */
+(id)GetDefaultInfo:(NSString*)_key;
/*
 * @param str:需显示的信息
 */
/**
 *@param obj : 获取值得对象
 *@param key : key
 *@param type: 目标类型
 */
+(id)parseObject:(id)obj withKey:(NSString *)key andType:(NSString *)type;

//适配屏幕UI的方法
+ (CGFloat)fitViewLengthWithiPhone6Length:(CGFloat)iPhone6ViewLength;

@end

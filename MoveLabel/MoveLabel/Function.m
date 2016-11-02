//
//  Function.m
//  Huidu
//
//  Created by xx on 15/10/24.
//  Copyright (c) from internet. All rights reserved.
//

#import "Function.h"
#import "Header.h"

@implementation Function

+ (BOOL)verifyObject:(id)objc isClass:(NSString *)cla
{
    if ([objc isKindOfClass:NSClassFromString(cla)])
        return YES;
    return NO;
}


#pragma mark - UIView
+(UIView*)createViewWithFrame:(CGRect)frame backgroundColor:(UIColor *)color{
    UIView*view=[[UIView alloc]initWithFrame:frame];
    view.backgroundColor = color;
    return view;
}

+(UIView*)createViewWithBackGroundColor:(UIColor *)color
{
    UIView * view = [[UIView alloc] init];
    if (color != nil) {
        view.backgroundColor = color;
    }
    return view;
}
#pragma mark - UILable
/**
 *  带frame的lable
 *
 *  @return <#return value description#>
 */
+ (UILabel*)createLabelWithFrame:(CGRect)frame font:(CGFloat)font Text:(NSString*)text{
    
    UILabel*label=[[UILabel alloc]initWithFrame:frame];
    label.font=[UIFont systemFontOfSize:font];
    label.text=text;
    
    return label;
}

/**
 *  不带frame的Lable
 *
 *
 *  @return <#return value description#>
 */
+ (UILabel*)createLabelWithText:(NSString *)text font:(CGFloat)font backgroundColor:(UIColor *)bgColor textColor:(UIColor *)textColor{
    
    UILabel*label=[UILabel new];
    label.font=[UIFont systemFontOfSize:font];
    label.text=text;
    label.textColor = textColor;
    label.backgroundColor = bgColor;
    label.numberOfLines = 0;
    return label;
}


/**
 * 返回label的高度
 * @param label  需要返回高度的label
 * @param width  the width of label
 */
+(CGFloat)returnHeightOfLabel:(UILabel *)label withWidth:(CGFloat)width
{
    if (label.text.length < 1) {
        return 0.0f;
    }
    NSAttributedString *attributedText = [[NSAttributedString alloc] initWithString:label.text attributes:@{NSFontAttributeName: label.font}];
    CGRect rect = [attributedText boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin context:nil];
    return ceil(rect.size.height);
}
/**
 * 返回label的高度
 * @param label  需要返回高度的label
 */
+(CGFloat)returnHeightOfLabel:(UILabel *)label
{
    if (label.text.length < 1) {
        return 0.0f;
    }
    NSAttributedString *attributedText = [[NSAttributedString alloc] initWithString:label.text attributes:@{NSFontAttributeName: label.font}];
    CGRect rect = [attributedText boundingRectWithSize:CGSizeMake(label.frame.size.width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin context:nil];
    return ceil(rect.size.height);
    
}

#pragma mark - UIButton
/**
 *  带frame的UIButton
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
+ (UIButton*)createButtonWithFrame:(CGRect)frame title:(NSString *)title titleColor:(UIColor *)color bgImageName:(NSString *)bgImageName selectedTitle:(NSString *)selectedTitle selectedTitleColor:(UIColor *)selectedColor selectedBgImageName:(NSString *)selectedImage target:(id)target method:(SEL)method{
    
    UIButton*button=[UIButton buttonWithType:UIButtonTypeCustom];
    button.frame=frame;
    // normal 下的
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:color forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:bgImageName] forState:UIControlStateNormal];
    // selected
    [button setTitle:selectedTitle forState:UIControlStateSelected];
    [button setTitleColor:selectedColor forState:UIControlStateSelected];
    [button setBackgroundImage:[UIImage imageNamed:selectedImage] forState:UIControlStateSelected];
    
    [button addTarget:target action:method forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}
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
+ (UIButton*)createButtonWithTitle:(NSString *)title titleColor:(UIColor *)color bgImageName:(NSString *)bgImageName selectedTitle:(NSString *)selectedTitle selectedTitleColor:(UIColor *)selectedColor selectedBgImageName:(NSString *)selectedImage target:(id)target method:(SEL)method{
    
    UIButton*button=[UIButton buttonWithType:UIButtonTypeCustom];
    // normal 下的
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:color forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:bgImageName] forState:UIControlStateNormal];
    // selected
    [button setTitle:selectedTitle forState:UIControlStateSelected];
    [button setTitleColor:selectedColor forState:UIControlStateSelected];
    [button setBackgroundImage:[UIImage imageNamed:selectedImage] forState:UIControlStateSelected];
    
    [button addTarget:target action:method forControlEvents:UIControlEventTouchUpInside];
    
    return button;
    
}
//设置填充图片
+(UIButton*)createButtonWithbgImage:(NSString *)bgImageName selectedBgImageName:(NSString *)selectedImage target:(id)target method:(SEL)method
{
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[Function createdimageWithName:bgImageName] forState:UIControlStateNormal];
    [button setImage:[Function createdimageWithName:selectedImage] forState:UIControlStateSelected];
    [button addTarget:target action:method forControlEvents:UIControlEventTouchUpInside];
    return button;
}

+(UIButton *)createButtonWithBackGroundImage:(NSString *)bgImageName selectedBgImageName:(NSString *)selectedImage target:(id)target method:(SEL)method
{
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[Function createdimageWithName:bgImageName] forState:UIControlStateNormal];
    [button setBackgroundImage:[Function createdimageWithName:selectedImage] forState:UIControlStateSelected];
    [button addTarget:target action:method forControlEvents:UIControlEventTouchUpInside];
    return button;

}
#pragma mark - UIImageView
/**
 *
 *
 *  @param frame     <#frame description#>
 *  @param imageName <#imageName description#>
 *
 *  @return <#return value description#>
 */
+ (UIImageView*)createImageViewWithFrame:(CGRect)frame imageName:(NSString*)imageName{
    
    UIImageView*imageView=[[UIImageView alloc]initWithFrame:frame];
    imageView.userInteractionEnabled=YES;
    imageView.image=[UIImage imageNamed:imageName];
    
    return imageView;
}
/**
 *
 *
 *  @param color     <#color description#>
 *  @param imageName <#imageName description#>
 *
 *  @return <#return value description#>
 */
+ (UIImageView*)createImageViewWithBackgruandColor:(UIColor *)color imageName:(NSString *)imageName{
    
    UIImageView *imageView = [UIImageView new];
    if(imageName != nil){
        imageView.image = [UIImage imageNamed:imageName];
    }
    imageView.backgroundColor = color;
    return imageView;
}

#pragma mark - UIImage

/**
 * @param name   name description
 * @param type   image description
 */
+(UIImage*)CreatedImageFromFile:(NSString *)name ofType:(NSString *)ext
{
    //return [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:name ofType:ext]];
    return [UIImage imageNamed:[NSString stringWithFormat:@"%@.%@",name,ext]];
}

+(UIImage*)createdimageWithName:(NSString *)name
{
    return [UIImage imageNamed:name];
}

#pragma  mark - UITextfield
/**
 *  带frame 的方法
 *
 *  @param frame           <#frame description#>
 *  @param target          <#target description#>
 *  @param placeholder     <#placeholder description#>
 *  @param font            <#font description#>
 *  @param secureTextEntry <#secureTextEntry description#>
 *  @param clearButton     <#clearButton description#>
 *
 *  @return <#return value description#>
 */
+ (UITextField*)createTextFieldWithFrame:(CGRect)frame target:(id)target placeholder:(NSString*)placeholder font:(CGFloat)font secureTextEntry:(BOOL)secureTextEntry clearButton:(BOOL)clearButton{
    
    UITextField *textField = [[UITextField alloc] initWithFrame:frame];
    textField.delegate = target;
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.placeholder =placeholder;
    textField.font = [UIFont systemFontOfSize:font];
    textField.secureTextEntry = secureTextEntry;
    
    if (clearButton) {
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    }
    return textField;
}

+(UITextField *)createTextFieldWithTarget:(id)target placeholder:(NSString *)placeholder font:(CGFloat)font secureTextEntry:(BOOL)secureTextEntry clearButton:(BOOL)clearButton
{
    UITextField *textField = [[UITextField alloc] init];
    textField.delegate = target;
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.placeholder =placeholder;
    textField.font = [UIFont systemFontOfSize:font];
    textField.secureTextEntry = secureTextEntry;
    
    if (clearButton) {
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    }
    return textField;
    
}

#pragma mark - NSUserdefaults
/*
 *保存default信息
 *srt:需保存的文字
 *key:关键字
 */
+(void)SaveDefaultInfo:(id)str Key:(NSString*)_key
{
    NSUserDefaults *standardUserDefault = [NSUserDefaults standardUserDefaults];
    [Function ExplainInfoByClass:str];
    [standardUserDefault setValue:str forKey:_key];
    
    [standardUserDefault synchronize];
}
/*
 *通过各种类型将null变为变字符串
 */
+(void)ExplainInfoByClass:(id)sender
{
    if( [sender isKindOfClass:[NSDictionary class]] )
    {
        NSArray* tempArray  =   [sender allKeys];
        for( NSString* key in tempArray )
        {
            if( [sender objectForKey:key] == [NSNull null])
            {
                [sender setObject:@"" forKey:key];
                
            }else if( [[sender objectForKey:key] isKindOfClass:[NSDictionary class]] )
            {
                [Function ExplainInfoByClass:[sender objectForKey:key]];
            }
        }
        
    }else if( [sender isKindOfClass:[NSArray class]] )
    {
        for (int i = 0; i < [sender count]; i++) {
            NSDictionary* dict   =   [sender objectAtIndex:i];
            [Function ExplainInfoByClass:dict];
        }
        
    }else if( [sender isKindOfClass:[NSNull class]])
    {
        [sender setObject:@"" forKey:sender];
    }
}

/*
 *获得保存default信息
 *key:关键字
 */
+(id)GetDefaultInfo:(NSString*)_key
{
    id temp  =     [[NSUserDefaults standardUserDefaults] objectForKey:_key];
    if(  temp == nil )
    {
        return nil;
    }
    return temp;
}

+(id)parseObject:(id)obj withKey:(NSString *)key andType:(NSString *)type
{
    
    id resObj = [[obj valueForKey:key] isKindOfClass:NSClassFromString(type)]? [obj valueForKey:key]: nil;
    if (resObj != nil) {
        return resObj;
    }else{
        
        if ([type isEqualToString:@"NSString"]) {
            return [NSString string];
        }else if ([type isEqualToString:@"NSArray"]){
            return [NSArray array];
        }else if([type isEqualToString:@"NSDictionary"]){
            return [NSDictionary dictionary];
        }else if ([type isEqualToString:@"NSNumber"]){
            return [NSNumber numberWithFloat:CGFLOAT_MAX];
        }else{
            return nil;
        }
        
    }
    
}


//适配不同屏幕控件大小
+ (CGFloat)fitViewLengthWithiPhone6Length:(CGFloat)iPhone6ViewLength
{
    CGFloat length;
    
    if (IS_IPHONE_4_OR_LESS || IS_IPHONE_5) {
        
        length = iPhone6ViewLength * (320.0 / 375.0);
        
    }else if (IS_IPHONE_6){
        
        length = iPhone6ViewLength;
        
    }else if (IS_IPHONE_6P){
        
        length = iPhone6ViewLength * (736.0 / 667.0);
        
    }else{
    
        length = iPhone6ViewLength * (320.0 / 375.0);

    }
    
    return length;
}

@end

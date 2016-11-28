//
//  UIView+SavePng.m
//  iOS-BaseControl
//
//  Created by aaron on 16/11/28.
//  Copyright © 2016年 aaron. All rights reserved.
//

#import "UIView+SavePng.h"

@implementation UIView (SavePng)

/**
 *  把一个UIView生成PNG或者JPG格式的图片,保存在指定路径
 *
 *  @param path   图片要保存到的路径
 *  @param type   图片的格式png或者jpg
 *  @param UIView 要转成图片的UIView
 */
- (void)clipScreenWithPath:(NSString *)path type:(NSPictureType)type;
{
    
    //1.开启一个和传进来的View大小一样的位图上下文
    UIGraphicsBeginImageContextWithOptions(self.bounds.size,NO,0);
    //2.把控制器的View绘制到上下文当中
    //想把UIView上面的东西绘制到上下文当中,必须得使用渲染的方式
    //renderInContext:就是渲染的方式
    CGContextRef ctx= UIGraphicsGetCurrentContext();
    [self.layer renderInContext:ctx ];
    //3从上下文当中生成一张图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    //4.关闭上下文
    UIGraphicsEndImageContext();
    //5.把生成的图片写入到桌面(以文件的方式进行传输:二进制流NSData,即把图片转为二进制流)
    
    NSData *data;
    if (type == NSPictureTypePNG) {
        //生成PNG格式的图片
        data = UIImagePNGRepresentation(newImage);
    }
    else if (type == NSPictureTypeJPG){
        //5.1把图片转为二进制流(第一个参数是图片,第2个参数是图片压缩质量:1是最原始的质量)
        data = UIImageJPEGRepresentation(newImage,1);
    }
    
    [data writeToFile:path atomically:YES];
}

@end

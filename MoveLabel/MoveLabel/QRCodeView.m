//
//  QRCodeView.m
//  MoveLabel
//
//  Created by kai.shang on 16/11/2.
//  Copyright © 2016年 wcy. All rights reserved.
//

#import "QRCodeView.h"

@implementation QRCodeView

-(instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        _bgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        _bgView.image = [UIImage imageNamed:@"book.png"];
        _bgView.contentMode = UIViewContentModeScaleToFill;
        [self setAutoresizesSubviews:YES];
        _bgView.autoresizingMask=UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self addSubview:_bgView];
    }
    
    return self;
}



@end

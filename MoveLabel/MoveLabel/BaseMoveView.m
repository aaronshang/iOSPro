//
//  BaseMoveView.m
//  MoveLabel
//
//  Created by 温春宇 on 16/7/26.
//  Copyright © 2016年 wcy. All rights reserved.
//

#import "BaseMoveView.h"
#import "Header.h"
#import "Function.h"

@interface BaseMoveView() {
    
    //记录左上角箭头移动的起始位置
    CGPoint startPoint1;
    //记录右上角箭头移动的起始位置
    CGPoint startPoint2;
    //记录左下角箭头移动的起始位置
    CGPoint startPoint3;
    //记录右下角箭头移动的起始位置
    CGPoint startPoint4;
    //记录透明区域移动的起始位置
    CGPoint startPointMoveView;
}

@property (nonatomic, strong) UIView *rectangleView;

/** 左上角 左右滑动手势 */
@property (nonatomic, strong) UIImageView *arrow1;
/** 右上角 点击关闭 */
@property (nonatomic, strong) UIImageView *arrow2;
/** 左下角 上下滑动手势 */
@property (nonatomic, strong) UIImageView *arrow3;
/** 右下角 斜角移动手势 */
@property (nonatomic, strong) UIImageView *arrow4;

@property (nonatomic, assign) BOOL isShowLine;

@end

@implementation BaseMoveView
//箭头的宽度
#define ARROWWIDTH 15
//箭头的高度
#define ARROWHEIGHT 15
//两个相邻箭头之间的最短距离
#define ARROWMINIMUMSPACE 10
//箭头单边的宽度
#define ARROWBORDERWIDTH 15
//imageview的左右缩进
#define PADDING 10
//裁剪区域的边框宽度
#define CROPVIEWBORDERWIDTH 2.0f
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {

        
        self.backgroundColor = [UIColor grayColor];
        UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(moveRectangleView:)];
        [self addGestureRecognizer:panGesture];
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(moveRectangleClick:)];
        
        [self addGestureRecognizer:tapGesture];
        
    }
    return self;
}
//暂时可以不用
//- (void)drawRect:(CGRect)rect {
//    //    [super drawRect:rect];
//    
//    if (self.isShowLine) {
//        //1
//        CGContextRef ctx = UIGraphicsGetCurrentContext();
//        //2
//        CGContextAddRect(ctx, CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height));
//        CGContextSetLineWidth(ctx, 2.0);
//        UIColor * aColor = [UIColor blueColor];//blue蓝色
//        CGContextSetStrokeColorWithColor(ctx, aColor.CGColor);//线框颜色
//        //3
//        CGContextStrokePath(ctx);
//    }
//    
//
//    
//}
- (void)showLine {
    
    
//    [self setNeedsDisplay];//调用重绘方法时候刷新
    
    //metnhod one --可添加虚线
    self.borderType = BorderTypeSolid;
    self.borderWidth = 2;
    self.borderColor = [UIColor redColor];
////
    
    //虚线
//    self.borderType = BorderTypeDashed;
//    self.dashPattern = 8;
//    self.spacePattern = 8;
//    self.borderWidth = 4;
//    self.cornerRadius = 20;
    
    //methond two
//    self.layer.borderColor = [UIColor blueColor].CGColor;
//    self.layer.borderWidth = 2.0f;
}
- (void)hiddenLine {
    
    self.borderType = BorderTypeSolid;
    self.borderWidth = 0;
    self.borderColor = [UIColor clearColor];
}

- (void)setupUI {
    

    [self addSubview:self.arrow1];
    [self addSubview:self.arrow2];
    [self addSubview:self.arrow3];
    [self addSubview:self.arrow4];
    
    self.rectangleView.frame = (self.frame);
    self.arrow1.frame = CGRectMake(-15, -15, 30, 30);
    self.arrow2.frame = CGRectMake(225, -15, 30, 30);
    self.arrow3.frame = CGRectMake(-15, 45, 30, 30);
    self.arrow4.frame = CGRectMake(225, 45, 30, 30);
}
- (void)setupUI2 {
    
    [self.superview addSubview:self.arrow1];
    [self.superview addSubview:self.arrow2];
    [self.superview addSubview:self.arrow3];
    [self.superview addSubview:self.arrow4];
    
    CGRect rect = self.frame;
    
    CGFloat x1 = rect.origin.x;
    CGFloat y1 = rect.origin.y;
    CGFloat w = rect.size.width;
    CGFloat h = rect.size.height;
    
    self.rectangleView.frame = (self.frame);
    self.arrow1.frame = CGRectMake(x1-15, y1-15, 30, 30);
    self.arrow2.frame = CGRectMake(x1+w-15, y1-15, 30, 30);
    self.arrow3.frame = CGRectMake(x1-15, y1+h-15, 30, 30);
    self.arrow4.frame = CGRectMake(x1+w-15, y1+h-15, 30, 30);

}
- (void)removeSetupUI {
    [self.arrow1 removeFromSuperview];
    [self.arrow2 removeFromSuperview];
    [self.arrow3 removeFromSuperview];
    [self.arrow4 removeFromSuperview];
}
- (void)moveRectangleClick:(UITapGestureRecognizer *)tapGesture {
    
    //0.黑色小三角工具栏
    //1.添加边框线
    //2.添加四个角
    
    //添加对应四个按钮和显示蓝色边框
    
    if (self.isShowLine) {
        
         [self cancelLineAndCorner];
    }else{
        [self registerLineAndCorner];
    }
    
}
- (void)registerLineAndCorner {
    self.isShowLine = YES;
    [self showLine];
    [self setupUI2];
}
- (void)cancelLineAndCorner {
    self.isShowLine = NO;
    [self hiddenLine];
    [self removeSetupUI];
    
}
- (void)moveRectangleView:(UIPanGestureRecognizer *)panGesture {
    
//        CGFloat minX = 0;
//        CGFloat maxX = WIDTH -CGRectGetWidth(self.frame);
//        CGFloat minY = 64;
//        CGFloat maxY = HEIGHT -CGRectGetHeight(self.frame);
    
    CGFloat minX = CGRectGetMinX(self.superview.frame);
    CGFloat maxX = CGRectGetMaxX(self.superview.frame) - CGRectGetWidth(self.frame);
    CGFloat minY = CGRectGetMinY(self.superview.frame) + 64;
    CGFloat maxY = CGRectGetMaxY(self.superview.frame) - CGRectGetHeight(self.frame);
    
    if(panGesture.state == UIGestureRecognizerStateBegan) {
        
        startPointMoveView = [panGesture locationInView:[self.rectangleView superview]];
//        self.arrow1.userInteractionEnabled = NO;
//        self.arrow2.userInteractionEnabled = NO;
//        self.arrow3.userInteractionEnabled = NO;
//        self.arrow4.userInteractionEnabled = NO;
    }
    else if(panGesture.state == UIGestureRecognizerStateEnded) {
        self.arrow1.userInteractionEnabled = YES;
        self.arrow2.userInteractionEnabled = YES;
        self.arrow3.userInteractionEnabled = YES;
        self.arrow4.userInteractionEnabled = YES;
    }
    else if(panGesture.state == UIGestureRecognizerStateChanged) {
        CGPoint endPoint = [panGesture locationInView:[self.rectangleView superview]];
        CGRect frame = panGesture.view.frame;
        frame.origin.x += endPoint.x - startPointMoveView.x;
        frame.origin.y += endPoint.y - startPointMoveView.y;
        frame.origin.x = MIN(maxX, MAX(frame.origin.x, minX));
        frame.origin.y = MIN(maxY, MAX(frame.origin.y, minY));
        panGesture.view.frame = frame;
        startPointMoveView = endPoint;
    }
    
        [self resetAllArrows];
}
/**
 *移动四个箭头的手势处理
 */
- (void)moveCorner:(UIPanGestureRecognizer *)panGesture {
    
    //设置起始值
    CGPoint *startPoint = NULL;
    //获取当前点击view的范围
    //    CGFloat minX = -ARROWBORDERWIDTH;
    //    CGFloat maxX = WIDTH + ARROWWIDTH + ARROWBORDERWIDTH;
    //    CGFloat minY = -ARROWBORDERWIDTH;
    //    CGFloat maxY = HEIGHT + ARROWHEIGHT + ARROWBORDERWIDTH;
    CGFloat minX = CGRectGetMinX(self.superview.frame) - ARROWBORDERWIDTH;
    CGFloat maxX = CGRectGetMaxX(self.superview.frame) - ARROWWIDTH + ARROWBORDERWIDTH;
    CGFloat minY = CGRectGetMinY(self.superview.frame) - ARROWBORDERWIDTH;
    CGFloat maxY = CGRectGetMaxY(self.superview.frame) - ARROWHEIGHT + ARROWBORDERWIDTH;
    
    //判断对应图像角标(计算原理根据当前点的最大XY轴方向)
    if(panGesture.view == self.arrow1) {
        startPoint = &startPoint1;
        maxY = CGRectGetMinY(self.arrow3.frame) - ARROWHEIGHT - ARROWMINIMUMSPACE;
        maxX = CGRectGetMinX(self.arrow2.frame) - ARROWWIDTH - ARROWMINIMUMSPACE;
    }
    else if(panGesture.view == self.arrow2) {
        startPoint = &startPoint2;
        maxY = CGRectGetMinY(self.arrow4.frame) - ARROWHEIGHT - ARROWMINIMUMSPACE;
        minX = CGRectGetMaxX(self.arrow1.frame) + ARROWMINIMUMSPACE;
    }
    else if(panGesture.view == self.arrow3) {
        startPoint = &startPoint3;
        minY = CGRectGetMaxY(self.arrow1.frame) + ARROWMINIMUMSPACE;
        maxX = CGRectGetMinX(self.arrow4.frame) - ARROWWIDTH - ARROWMINIMUMSPACE;
    }
    else if(panGesture.view == self.arrow4) {
        startPoint = &startPoint4;
        minY = CGRectGetMaxY(self.arrow2.frame) + ARROWMINIMUMSPACE;
        minX = CGRectGetMaxX(self.arrow3.frame) + ARROWMINIMUMSPACE;
    }
    //手势状态->开始点击
    if(panGesture.state == UIGestureRecognizerStateBegan) {
        *startPoint = [panGesture locationInView:self.superview];
        self.superview.userInteractionEnabled = NO;
    }//手势状态->点击停止
    else if(panGesture.state == UIGestureRecognizerStateEnded) {
        self.superview.userInteractionEnabled = YES;
    }//手势状态->值变化
    else if(panGesture.state == UIGestureRecognizerStateChanged) {
        CGPoint endPoint = [panGesture locationInView:self.superview];
        CGRect frame = panGesture.view.frame;
        frame.origin.x += endPoint.x - startPoint->x;
        frame.origin.y += endPoint.y - startPoint->y;
        frame.origin.x = MIN(maxX, MAX(frame.origin.x, minX));
        frame.origin.y = MIN(maxY, MAX(frame.origin.y, minY));
        panGesture.view.frame = frame;
        *startPoint = endPoint;
    }
    //传递点击的手势所在view
    [self resetArrowsFollow: panGesture.view];
    [self resetCropView];
    //    [self resetSuperViewFrame];
    
}

- (void)resetCropView {
    
    self.frame = CGRectMake(CGRectGetMinX(self.arrow1.frame) + ARROWBORDERWIDTH, CGRectGetMinY(self.arrow1.frame) + ARROWBORDERWIDTH, CGRectGetMaxX(self.arrow2.frame) - CGRectGetMinX(self.arrow1.frame) - ARROWBORDERWIDTH * 2, CGRectGetMaxY(self.arrow3.frame) - CGRectGetMinY(self.arrow1.frame) - ARROWBORDERWIDTH * 2);
}
/**
 *根据当前移动的箭头的位置重新设置与之一起变化位置的箭头的位置
 */
- (void)resetArrowsFollow: (UIView *)arrow {
    //根据当前点,对角线的点把持不变,改变都是相邻点的framecenter

    if(arrow == self.arrow1) {
   
            self.arrow2.center = CGPointMake(self.arrow2.center.x, self.arrow1.center.y);
            self.arrow3.center = CGPointMake(self.arrow1.center.x, self.arrow3.center.y);
        
    }
    else if(arrow == self.arrow2) {
        
            self.arrow1.center = CGPointMake(self.arrow1.center.x, self.arrow2.center.y);
            self.arrow4.center = CGPointMake(self.arrow2.center.x, self.arrow4.center.y);
    
    }
    else if(arrow == self.arrow3) {
        
            self.arrow1.center = CGPointMake(self.arrow3.center.x, self.arrow1.center.y);
            self.arrow4.center = CGPointMake(self.arrow4.center.x, self.arrow3.center.y);
       
    }
    else if(arrow == self.arrow4) {
        
            self.arrow2.center = CGPointMake(self.arrow4.center.x, self.arrow2.center.y);
            self.arrow3.center = CGPointMake(self.arrow3.center.x, self.arrow4.center.y);
    }
    
}
/**
 *根据当前裁剪区域的位置重新设置所有角的位置
 */
- (void)resetAllArrows {

    
    self.arrow1.center = CGPointMake(CGRectGetMinX(self.frame) - ARROWBORDERWIDTH + ARROWWIDTH, CGRectGetMinY(self.frame) - ARROWBORDERWIDTH + ARROWHEIGHT );
    self.arrow2.center = CGPointMake(CGRectGetMaxX(self.frame) + ARROWBORDERWIDTH - ARROWWIDTH/2.0, CGRectGetMinY(self.frame) - ARROWBORDERWIDTH + ARROWHEIGHT/2.0);
    self.arrow3.center = CGPointMake(CGRectGetMinX(self.frame) - ARROWBORDERWIDTH + ARROWWIDTH/2.0, CGRectGetMaxY(self.frame) + ARROWBORDERWIDTH - ARROWHEIGHT/2.0);
    self.arrow4.center = CGPointMake(CGRectGetMaxX(self.frame) + ARROWBORDERWIDTH - ARROWWIDTH/2.0, CGRectGetMaxY(self.frame) + ARROWBORDERWIDTH - ARROWHEIGHT/2.0);
    [self layoutIfNeeded];
}


- (UIImageView *)arrow1 {
    if (!_arrow1) {
        _arrow1 = [Function createImageViewWithBackgruandColor:[UIColor clearColor] imageName:@"elementBorder0.png"];
        
        UIPanGestureRecognizer *tapGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(moveCorner:)];
        [_arrow1 addGestureRecognizer:tapGesture];
    }
    return _arrow1;
}
- (UIImageView *)arrow2 {
    if (!_arrow2) {
        _arrow2 = [Function createImageViewWithBackgruandColor:[UIColor clearColor] imageName:@"elementBorder1.png"];
        UIPanGestureRecognizer *tapGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(moveCorner:)];
        [_arrow2 addGestureRecognizer:tapGesture];
    }
    return _arrow2;
}
- (UIImageView *)arrow3 {
    if (!_arrow3) {
        _arrow3 = [Function createImageViewWithBackgruandColor:[UIColor clearColor] imageName:@"elementBorder2.png"];
        UIPanGestureRecognizer *tapGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(moveCorner:)];
        [_arrow3 addGestureRecognizer:tapGesture];
    }
    return _arrow3;
}
- (UIImageView *)arrow4 {
    if (!_arrow4) {
        _arrow4 = [Function createImageViewWithBackgruandColor:[UIColor clearColor] imageName:@"elementBorder3.png"];
        UIPanGestureRecognizer *tapGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(moveCorner:)];
        [_arrow4 addGestureRecognizer:tapGesture];
    }
    return _arrow4;
}

@end

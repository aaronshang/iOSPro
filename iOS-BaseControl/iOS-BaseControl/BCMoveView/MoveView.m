//
//  MoveView.m
//  MoveLabel
//
//  Created by kai.shang on 16/10/31.
//  Copyright © 2016年 SK.com All rights reserved.
//

#import "MoveView.h"

@interface MoveView()

typedef NS_OPTIONS(NSUInteger, NSArrowState){
    NSArrowStateWidth = 0,
    NSArrowStateHeight,
    NSArrowStateUnknown
};

/**
 *  @author SK, 16-11-17 15:11
 *
 *  @brief 定义图片的方向
 */
typedef NS_ENUM(NSInteger, NSViewForward) {
 
    NSViewForwardHeight=0,
    NSViewForwardWidth,
    NSViewForwardHeightAndWidth
};

//是否可编辑（编辑状态，显示边框及大小调整按钮）
@property(nonatomic, assign) BOOL editable;

//调整高度的按钮（vertical）
@property(nonatomic, strong) UIImageView *arrowHeight;

//调整宽度的按钮 (horizontal)
@property(nonatomic, strong) UIImageView *arrowWidth;

//拖动开始时，起始位置点
@property(nonatomic, assign) CGPoint startPiont;

//拖动开始时，Frame
@property(nonatomic, assign) CGRect startFrameBeginDrag;

//绘制边框的ShapeLayer
@property(nonatomic, strong) CAShapeLayer *borderShapeLayer;

//旋转次数
@property (nonatomic, assign) NSUInteger countRotate;

#pragma mark =============== Private Method ===============

/**
 *  @author SK, 16-11-08 10:11
 *
 *  @brief 绘制边框
 */
-(void) drawBorder;


@end


@implementation MoveView

-(instancetype) initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor lightGrayColor];
        
        UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(dragView:)];
        [self addGestureRecognizer:panGesture];
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapView:)];
        [self addGestureRecognizer:tapGesture];
        
        _editable = NO;
        _borderShapeLayer = nil;
        _countRotate = 0;
        
        [self addObserver:self forKeyPath:@"transform" options:NSKeyValueObservingOptionNew context:nil];
        
    }
    return self;
}

-(void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    
    [self adjustArrowPosition];
}

-(void) dealloc{
    [self removeObserver:self forKeyPath:@"transform"];
}

#pragma mark =============== Operation ===============
/**
 *  @brief 拖动View移动
 *
 *  @param panGesture 拖动手势
 */
-(void) dragView:(UIPanGestureRecognizer *)panGesture{
    
    if(panGesture.state == UIGestureRecognizerStateBegan){
    
    }
    else if(panGesture.state == UIGestureRecognizerStateEnded){
    
    }
    else if(panGesture.state == UIGestureRecognizerStateChanged){
        
        CGPoint offset = [panGesture translationInView:self.superview];
        panGesture.view.center = CGPointMake(panGesture.view.center.x+offset.x, panGesture.view.center.y+offset.y);

        [panGesture setTranslation:CGPointMake(0, 0) inView:self.superview];
        [self adjustArrowPosition];
    }
}

/**
 *  @brief 点击View
 *
 *  @param tapGesture 点击手势
 */
-(void) tapView:(UITapGestureRecognizer *)tapGesture{

    if (!self.editable) {
        
        [self drawBorder];
        
        [self showArrow];
        _editable = YES;
    }
    else{
        
        [self.borderShapeLayer removeFromSuperlayer];
        
        [self hideArrow];
        _editable = NO;
    }

}

-(void) rotateView{
    
    _countRotate++;
    
    NSUInteger forward = self.countRotate%4;
    
    CGAffineTransform transfrom = CGAffineTransformIdentity;
    
    self.position = forward;
    switch (forward) {
        case 0:
            transfrom =  CGAffineTransformMakeRotation(0 *M_PI / 180.0);
            break;
        case 1:
            transfrom =  CGAffineTransformMakeRotation(90 *M_PI / 180.0);
            break;
        case 2:
            transfrom =  CGAffineTransformMakeRotation(180 *M_PI / 180.0);
            break;
        case 3:
            transfrom =  CGAffineTransformMakeRotation(270 *M_PI / 180.0);
            break;
        default:
            break;
    }
    self.transform = transfrom;
}


-(void) showArrow{
    
    [self.superview addSubview:self.arrowWidth];
    [self.superview addSubview:self.arrowHeight];
    [self adjustArrowPosition];
}

/**
 *  @brief 隐藏按钮
 */
-(void) hideArrow{
    [self.arrowHeight removeFromSuperview];
    [self.arrowWidth removeFromSuperview];
}

/**
 *  @brief 根据UIView位置，动态调整按钮的位置
 */
-(void) adjustArrowPosition{
    
    CGRect currentFrame = self.frame;
    CGFloat frameWidth = currentFrame.size.width;
    CGFloat frameHeight = currentFrame.size.height;

    CGFloat arrowHeight = 24;
    CGRect arrowHeightFrame = CGRectMake(currentFrame.origin.x+frameWidth/2-arrowHeight/2,
                                         currentFrame.origin.y+frameHeight,
                                         arrowHeight, arrowHeight);
    self.arrowHeight.frame = arrowHeightFrame;
    
    CGRect arrowWidthFrame = CGRectMake(currentFrame.origin.x+frameWidth,
                                        currentFrame.origin.y+frameHeight/2-arrowHeight/2,
                                        arrowHeight, arrowHeight);
    self.arrowWidth.frame = arrowWidthFrame;
    
    //重绘边框
    if (self.editable) {
        [self drawBorder];
    }
    
}

#pragma mark =============== Drag Arrow ===============
/**
 *  @brief 点击箭头按钮，拖动视图
 *
 *  @param panGesture 拖动手势
 */
-(void) dragArrow:(UIPanGestureRecognizer *) panGesture{

    NSArrowState arrowType = NSArrowStateUnknown;
    
    if (panGesture.view == self.arrowHeight) {
        arrowType = NSArrowStateHeight;
    }
    else if(panGesture.view == self.arrowWidth){
        arrowType = NSArrowStateWidth;
    }else{
        return;
    }
    
    if (panGesture.state == UIGestureRecognizerStateBegan) {
        _startPiont = [panGesture locationInView:self.superview];
        _startFrameBeginDrag = self.frame;
    }
    else if(panGesture.state == UIGestureRecognizerStateEnded){
    
    }
    else if(panGesture.state == UIGestureRecognizerStateChanged){
        
        CGPoint endPoint = [panGesture locationInView:self.superview];
    
        if (arrowType == NSArrowStateHeight) {
            CGFloat offsetHeight = (endPoint.y - self.startPiont.y);
            CGRect newFrame = [self frameIncreaseHeight:self.frame offsetHeight:offsetHeight];
            self.frame = newFrame;
        }
        else if(arrowType == NSArrowStateWidth){
            CGFloat offsetWidth= (endPoint.x - self.startPiont.x);
            CGRect newFrame = [self frameIncreaseWidth:self.frame offsetWidth:offsetWidth];
            self.frame = newFrame;
        }
        
        [self adjustArrowPosition];
    }
}

/**
 *  @brief 高度调整，固定中心，上下同时增加或减少
 *
 *  @param frame 改变前位置
 *
 *  @return 调整后的位置
 */
-(CGRect) frameIncreaseHeight:(CGRect) frame offsetHeight:(CGFloat) offset{
    CGRect rvtFrame = _startFrameBeginDrag;
    CGFloat newOffset = [self offsetWidthAfterDraged:self.startFrameBeginDrag offset:offset forward:NSViewForwardHeight];
    rvtFrame.origin.y = rvtFrame.origin.y - newOffset;
    rvtFrame.size.height = rvtFrame.size.height + 2*newOffset;
    return rvtFrame;
}

-(CGRect) frameIncreaseWidth:(CGRect) frame offsetWidth:(CGFloat) offset{
    CGRect rvtFrame = _startFrameBeginDrag;
    CGFloat newOffset = [self offsetWidthAfterDraged:self.startFrameBeginDrag offset:offset forward:NSViewForwardWidth];
    rvtFrame.origin.x = rvtFrame.origin.x - newOffset;
    rvtFrame.size.width = rvtFrame.size.width + 2*newOffset;
    return rvtFrame;
}

-(void) drawBorder{
    
    if (_borderShapeLayer) {
        [_borderShapeLayer removeFromSuperlayer];
    }
    
    self.borderShapeLayer = [CAShapeLayer layer];
    CGRect curframe = self.bounds;
    CGRect frame = curframe;
    frame.size.width += 30;
    frame.size.height += 30;
    
    NSArray *gapAry = @[
                        @[@0, @0],
                        @[@0,@(-30)],
                        @[@(-30), @(-30)],
                        @[@(-30), @0]
                        ];
    
    NSArray *curGapAry = [gapAry objectAtIndex:self.position];
    frame.origin.x += [curGapAry[0] integerValue];
    frame.origin.y += [curGapAry[1] integerValue];
    
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGAffineTransform transform = CGAffineTransformIdentity;
    CGPathAddRect(path, &transform, frame);
    self.borderShapeLayer.path = path;
    CGPathRelease(path);
    
    self.borderShapeLayer.backgroundColor = [[UIColor clearColor] CGColor];
    self.borderShapeLayer.strokeColor = [[UIColor blueColor] CGColor];
    self.borderShapeLayer.fillColor = [[UIColor clearColor] CGColor];
    self.borderShapeLayer.lineWidth = 2.0f;
    self.borderShapeLayer.lineCap = kCALineCapSquare;
    self.borderShapeLayer.lineDashPattern = @[@3,@3];

    [self.layer addSublayer:_borderShapeLayer];
}

#pragma mark =============== Property ===============

-(UIImageView *) arrowHeight{
    if (!_arrowHeight) {
        
        NSString *strResourcesBundle = [[NSBundle mainBundle] pathForResource:@"MoveViewSettings"ofType:@"bundle"];
        // 找到对应images夹下的图片
        NSString *strPath = [[NSBundle bundleWithPath:strResourcesBundle] pathForResource:@"bc_arrow_height@2x" ofType:@"png" inDirectory:@"images"];
        
        UIImage *image = [UIImage imageWithContentsOfFile:strPath];
        _arrowHeight = [[UIImageView alloc] initWithImage:image];
        
        UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(dragArrow:)];
        [_arrowHeight addGestureRecognizer:panGesture];
        
        _arrowHeight.userInteractionEnabled = YES;
    }
    

    return _arrowHeight;
}

-(UIImageView *) arrowWidth{
    if (!_arrowWidth) {
        
        NSString *strResourcesBundle = [[NSBundle mainBundle] pathForResource:@"MoveViewSettings"ofType:@"bundle"];
        // 找到对应images夹下的图片
        NSString *strPath = [[NSBundle bundleWithPath:strResourcesBundle] pathForResource:@"bc_arrow_width@2x" ofType:@"png" inDirectory:@"images"];
        
        UIImage *image = [UIImage imageWithContentsOfFile:strPath];
        _arrowWidth = [[UIImageView alloc] initWithImage:image];
        
        UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(dragArrow:)];
        [_arrowWidth addGestureRecognizer:panGesture];
        _arrowWidth.userInteractionEnabled = YES;
    }

    return _arrowWidth;
}

#pragma mark =============== 私有算法 ===============

/**
 *  @author SK, 16-11-17 15:11
 *
 *  @brief 返回拖动后的偏移量，范围受控制
 *
 *  @param frame  变化前大小
 *  @param offset 偏移量
 *
 *  @return 算法校正后的偏移量
 */
-(CGFloat) offsetWidthAfterDraged:(CGRect) frame offset:(CGFloat) offset forward:(NSViewForward) forward{
    
    CGFloat rvtOffset = offset;
    const CGFloat max = 1;
    const CGFloat min = 0.5;
    if (forward == NSViewForwardHeight) {
        
        if (offset>0) {
            rvtOffset = (offset > max*frame.size.height)?max*frame.size.height:offset;
        }else{
            rvtOffset = (fabs(offset) > min*frame.size.height)?min*frame.size.height:offset;
        }
    
    }
    else if(forward == NSViewForwardWidth){
    
        if (offset>0) {
           rvtOffset = (offset > max*frame.size.width)?max*frame.size.width:offset;
        }else{
            rvtOffset = (fabs(offset) > min*frame.size.width)?min*frame.size.width:offset;
        }
    }
    return rvtOffset;
}

@end

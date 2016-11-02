//
//  MoveView.m
//  MoveLabel
//
//  Created by kai.shang on 16/10/31.
//  Copyright © 2016年 SK.com All rights reserved.
//

#import "MoveView.h"

@interface MoveView()

/**
 *  @brief 是否可编辑（编辑状态，显示边框及大小调整按钮）
 */
@property(nonatomic, assign) BOOL editable;

/**
 *  @brief 调整高度的按钮（vertical）
 */
@property(nonatomic, strong) UIImageView *arrowHeight;


/**
 *  @brief 调整宽度的按钮 (horizontal)
 */
@property(nonatomic, strong) UIImageView *arrowWidth;


@property(nonatomic, assign) CGPoint startPiont;
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
        CGPoint endPoint = [panGesture locationInView:self.superview];
        self.center = endPoint;
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
        self.layer.borderWidth = 2;
        self.layer.borderColor = [[UIColor blueColor] CGColor];
        
        [self showArrow];
        _editable = YES;
    }
    else{
        self.layer.borderWidth = 0;
        
        [self hideArrow];
        _editable = NO;
    }

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
}

/**
 *  @brief 点击箭头按钮，拖动视图
 *
 *  @param panGesture 拖动手势
 */
-(void) dragArrow:(UIPanGestureRecognizer *) panGesture{

    if (panGesture.view == self.arrowHeight) {
        
    }
    else if(panGesture.view == self.arrowWidth){
    
    }else{
        return;
    }
    
    if (panGesture.state == UIGestureRecognizerStateBegan) {
        _startPiont = [panGesture locationInView:self.superview];
    }
    else if(panGesture.state == UIGestureRecognizerStateEnded){
    
    }
    else if(panGesture.state == UIGestureRecognizerStateChanged){
        CGPoint endPoint = [panGesture locationInView:self.superview];
        CGFloat offsetHeight = (endPoint.y - self.startPiont.y)/4;
        CGRect newFrame = [self frameIncreaseHeight:self.frame offsetHeight:offsetHeight];
        self.frame = newFrame;
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
    CGRect rvtFrame = frame;
    rvtFrame.origin.y = rvtFrame.origin.y - offset;
    rvtFrame.size.height = rvtFrame.size.height + 2*offset;
    return rvtFrame;
}

#pragma mark =============== Property ===============

-(UIImageView *) arrowHeight{
    if (!_arrowHeight) {
        UIImage *image = [UIImage imageNamed:@"elementBorder2.png"];
        _arrowHeight = [[UIImageView alloc] initWithImage:image];
        
        UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(dragArrow:)];
        [_arrowHeight addGestureRecognizer:panGesture];
        
        _arrowHeight.userInteractionEnabled = YES;
    }
    

    return _arrowHeight;
}

-(UIImageView *) arrowWidth{
    if (!_arrowWidth) {
        UIImage *image = [UIImage imageNamed:@"elementBorder0.png"];
        _arrowWidth = [[UIImageView alloc] initWithImage:image];
        
        UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(dragArrow:)];
        [_arrowWidth addGestureRecognizer:panGesture];
        _arrowWidth.userInteractionEnabled = YES;
    }

    return _arrowWidth;
}

@end

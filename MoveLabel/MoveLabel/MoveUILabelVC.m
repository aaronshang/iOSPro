//
//  MoveUILabelVC.m
//  可以移动拖拽的四个角
//
//  Created by 温春宇 on 16/7/21.
//  Copyright © 2016年 wcy. All rights reserved.
//

#import "MoveUILabelVC.h"
//#import "Masonry.h"
#import "BaseMoveView.h"
#import "RectTextView.h"

#import "MoveView.h"

@interface MoveUILabelVC()

@property (nonatomic, strong) BaseMoveView *baseMoveView;

@property (nonatomic, strong) RectTextView *rectTextView;

@property (nonatomic, strong) MoveView *moveView;

@property(nonatomic, assign) NSUInteger countRotate;

@end

@implementation MoveUILabelVC


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];

    [self.view addSubview:self.rectTextView];
    self.rectTextView.frame = CGRectMake(50, 400, 240, 60);
    
    _moveView = [[MoveView alloc] initWithFrame: CGRectMake(50, 100, 240, 60)];
    
    [self.view addSubview:self.moveView];
    _countRotate = 0;
    
}

- (RectTextView *)rectTextView {
    if (!_rectTextView) {
        _rectTextView = [[RectTextView alloc]init];
        _rectTextView.backgroundColor = [UIColor greenColor];
    }
    return _rectTextView;
}


-(IBAction)rotate:(id)sender {
    
    _countRotate++;
    
    NSUInteger forward = self.countRotate%4;
    switch (forward) {
        case 0:
            self.moveView.transform =  CGAffineTransformMakeRotation(0 *M_PI / 180.0);
            break;
        case 1:
            self.moveView.transform =  CGAffineTransformMakeRotation(90 *M_PI / 180.0);
            break;
        case 2:
            self.moveView.transform =  CGAffineTransformMakeRotation(180 *M_PI / 180.0);
            break;
        case 3:
            self.moveView.transform =  CGAffineTransformMakeRotation(270 *M_PI / 180.0);
            break;
        default:
            break;
    }
    
    
}

@end
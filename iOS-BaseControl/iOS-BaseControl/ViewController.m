//
//  ViewController.m
//  iOS-BaseControl
//
//  Created by aaron on 16/11/26.
//  Copyright © 2016年 aaron. All rights reserved.
//

#import "ViewController.h"
#import "BCMoveView/MoveView.h"

@interface ViewController ()

@property (nonatomic, strong) MoveView *moveView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //加载图片
    _moveView = [[MoveView alloc] initWithFrame: CGRectMake(50, 100, 240, 60)];
    
    [self.view addSubview:self.moveView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)rotatePicture:(id)sender{
    
    [self.moveView rotateView];
}

@end

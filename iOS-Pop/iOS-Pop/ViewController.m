//
//  ViewController.m
//  iOS-Pop
//
//  Created by aaron on 16/11/19.
//  Copyright © 2016年 aaron. All rights reserved.
//

#import "ViewController.h"
#import "PopupView/LewPopupViewController.h"
#import "PopView.h"

#import "CusAlertViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view setBackgroundColor:[UIColor greenColor]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction) click:(id)sender{
    
    CusAlertViewController * alert = [[CusAlertViewController alloc] initWithNibName:@"CusAlertViewController" bundle:nil];
   
    [self lew_presentPopupView:alert.view animation:[LewPopupViewAnimationFade new]];
    
    [self addChildViewController:alert];

//    PopView *popView = [[PopView alloc] initWithFrame:CGRectMake(0, 0, 300, 500)];
//    popView.parentController = self;
//    
//    [self lew_presentPopupView:popView animation:[LewPopupViewAnimationFade new]];
}

@end

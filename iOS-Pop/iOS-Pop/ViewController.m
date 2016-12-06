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
#import <LMAlertView.h>

#import "CusAlertViewController.h"

@interface ViewController ()<UIAlertViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view setBackgroundColor:[UIColor lightGrayColor]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction) clickCustomAlert:(id)sender{
    
    LMAlertView *cardAlertView = [[LMAlertView alloc] initWithTitle:@"请输入工作篮" message:@"输入工作篮内容" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"OK", nil];
    [cardAlertView setSize:CGSizeMake(270.0, 200)];
    
    UIView *contentView = cardAlertView.contentView;
    
    CGFloat yOffset = 65.0;
    
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(10, yOffset, 250, 75)];
    textView.layer.cornerRadius = 5.0;
    textView.layer.masksToBounds = YES;
    textView.tag = 100;
    [contentView addSubview:textView];
    
    
    [cardAlertView show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSLog(@"click %ld", buttonIndex);
    
    if (buttonIndex ==1) {
        UITextView *textView = (UITextView*)[((LMAlertView*)alertView).contentView viewWithTag:100];
        NSLog(@"%@", textView.text);
    }
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

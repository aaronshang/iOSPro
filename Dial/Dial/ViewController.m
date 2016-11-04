//
//  ViewController.m
//  Dial
//
//  Created by kai.shang on 16/11/4.
//  Copyright © 2016年 SK. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)dial:(id)sender{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel:10086"]];
}

@end

//
//  ViewController.m
//  UseBlock
//
//  Created by kai.shang on 16/11/10.
//  Copyright © 2016年 SK. All rights reserved.
//

#import "ViewController.h"
#import "UseBlock.h"

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

-(IBAction)click:(id)sender{

    [[[UseBlock alloc] init] testBlockWithParam];
}

@end

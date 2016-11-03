//
//  ViewController.m
//  UseThread
//
//  Created by kai.shang on 16/11/3.
//  Copyright © 2016年 SK. All rights reserved.
//

#import "ViewController.h"
#import "GCDThread.h"

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
-(IBAction)test:(id)sender{
    
    GCDThread *gcdThread = [[GCDThread alloc] init];
    [gcdThread testAScene];
}
@end

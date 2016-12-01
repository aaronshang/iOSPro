//
//  ViewController.m
//  iOS-TableView
//
//  Created by kai.shang on 16/12/1.
//  Copyright © 2016年 SK. All rights reserved.
//

#import "ViewController.h"
#import "ListTableViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UINavigationController *nav;
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

    ListTableViewController *list = [[ListTableViewController alloc] initWithNibName:@"ListTableViewController" bundle:nil];
    
    self.nav = [[UINavigationController alloc] initWithRootViewController:list];
    
    [self.view addSubview:self.nav.view];
    [self addChildViewController:self.nav];
    
    __weak typeof(ViewController*) tmpSelf = self;
    __weak ListTableViewController *weak_list = list;
    list.backBlock=^(){
        
        [tmpSelf.nav.view removeFromSuperview];
        [weak_list removeFromParentViewController];
    };
}

@end

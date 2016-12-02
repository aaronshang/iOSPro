//
//  ViewController.m
//  iOS-StoryBoard
//
//  Created by kai.shang on 16/12/2.
//  Copyright © 2016年 SK. All rights reserved.
//

#import "ViewController.h"
#import "CustomTableViewCell.h"

@interface ViewController ()

@property (nonatomic, strong) NSMutableArray *sourceAry;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    _sourceAry = [NSMutableArray arrayWithArray:@[@"",@"", @""]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [self.sourceAry count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CustomCellID"];
    cell.cellIndex = indexPath;
    NSLog(@"%@", indexPath);
    
    __weak typeof(self) tmpSelf = self;
    cell.callBlock = ^(BOOL isDelete, NSIndexPath *indexPath){
        
        if (isDelete) {
            if (tmpSelf.sourceAry.count >= indexPath.row) {
                 [tmpSelf.sourceAry removeObjectAtIndex:indexPath.row];
                
                [tableView beginUpdates];
                [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
                [tableView endUpdates];
                
                [tableView reloadData];
            }

        }
    };
    
    return cell;
}

@end

//
//  ListTableViewController.m
//  iOS-TableView
//
//  Created by kai.shang on 16/12/1.
//  Copyright © 2016年 SK. All rights reserved.
//

#import "ListTableViewController.h"
#import <MJRefresh/MJRefresh.h>
#import "CustomTableViewCell.h"

@interface ListTableViewController ()

@property(nonatomic, strong) NSMutableArray *sourceAry;
@end

@implementation ListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.title = @"TableView Demo";
    [self back];
    
    _sourceAry = [NSMutableArray array];
    for (int i=0; i<30; i++) {
        [_sourceAry addObject:[NSString stringWithFormat:@"Apple%d", i]];
    }
    
    __weak ListTableViewController *tmpself = self;
    
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
           
            sleep(1);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [tmpself.tableView.mj_header endRefreshing];
            });
        });
        
    }];
    
    [header setTitle:@"拉下来更新" forState:MJRefreshStateIdle];
    [header setTitle:@"Loading" forState:MJRefreshStateRefreshing];
    [header setTitle:@"即将刷新" forState:MJRefreshStatePulling];
    header.lastUpdatedTimeLabel.hidden = YES;
    
    self.tableView.mj_header = header;
    
    [self.tableView.mj_header beginRefreshing];
    
    [self.tableView registerClass:[CustomTableViewCell class] forCellReuseIdentifier:@"CustomCellID"];
}

-(void) back{
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(backAction)];
    self.navigationItem.leftBarButtonItem = item;
}

-(void) backAction{
    
    if (self.backBlock) {
        self.backBlock();
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [self.sourceAry count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    static NSString *CELLID = @"ABDASFCELLID";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELLID];
//    
//    if (!cell) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CELLID];
//    }
//    cell.textLabel.text = self.sourceAry[indexPath.row];
//    return cell;
    
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CustomCellID" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld", indexPath.row];
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

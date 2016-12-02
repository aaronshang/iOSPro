//
//  ViewController.h
//  iOS-StoryBoard
//
//  Created by kai.shang on 16/12/2.
//  Copyright © 2016年 SK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) IBOutlet UITableView *tableView;
@end


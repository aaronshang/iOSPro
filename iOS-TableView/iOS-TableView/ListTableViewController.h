//
//  ListTableViewController.h
//  iOS-TableView
//
//  Created by kai.shang on 16/12/1.
//  Copyright © 2016年 SK. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^BackBlock)();

@interface ListTableViewController : UITableViewController

@property (nonatomic, copy) BackBlock backBlock;
@end

//
//  CustomTableViewCell.h
//  iOS-StoryBoard
//
//  Created by kai.shang on 16/12/2.
//  Copyright © 2016年 SK. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^CallBlock)(BOOL isDelete, NSIndexPath *indexPath);
@interface CustomTableViewCell : UITableViewCell

@property(nonatomic, strong) IBOutlet UIView *containerView;
@property(nonatomic, strong) NSIndexPath *cellIndex;
@property(nonatomic, copy) CallBlock callBlock;
@end

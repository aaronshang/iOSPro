//
//  CustomTableViewCell.m
//  iOS-TableView
//
//  Created by kai.shang on 2017/1/19.
//  Copyright © 2017年 SK. All rights reserved.
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    NSLog(@"CustomTableViewCell-awakeFromNib");
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    
    NSLog(@"CustomTableViewCell-initWithStyle");
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        //页面布局
        UIButton *button = [[UIButton alloc] init];
        [button setTitle:@"China" forState:UIControlStateNormal];
        button.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:button];
        [button setBackgroundColor:[UIColor redColor]];
        
        NSArray *constraints1 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[button]-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(button)];
        NSArray *constraints2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[button]-10-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(button)];
        [self.contentView addConstraints:constraints1];
        [self.contentView addConstraints:constraints2];
    }
    
    return self;
}


@end

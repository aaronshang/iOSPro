//
//  CustomTableViewCell.m
//  iOS-StoryBoard
//
//  Created by kai.shang on 16/12/2.
//  Copyright © 2016年 SK. All rights reserved.
//

#import "CustomTableViewCell.h"

@interface CustomTableViewCell(){
    UIView *snapView;
}

@end

@implementation CustomTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
    [self.containerView addGestureRecognizer:longPress];
}

-(void) handleGesture:(UILongPressGestureRecognizer*) gesture{
    
    CGPoint startPoint = CGPointZero;
    CGPoint changePiont = CGPointZero;
    CGPoint endPiont = CGPointZero;

    switch (gesture.state) {
        case UIGestureRecognizerStateBegan:
            NSLog(@"begin");
            snapView = [self.containerView snapshotViewAfterScreenUpdates:NO];
            startPoint = [gesture locationInView:self.contentView];
            
            snapView.frame = self.containerView.frame;
            snapView.transform = CGAffineTransformMakeRotation(M_PI/30);
            snapView.center = startPoint;
            [self.contentView addSubview:snapView];
            self.containerView.hidden = YES;
            break;
        case UIGestureRecognizerStateChanged:
            
            changePiont = [gesture locationInView:self.contentView];
            snapView.center = changePiont;
            break;
        case UIGestureRecognizerStateEnded:
            NSLog(@"end");
            endPiont = [gesture locationInView:self.contentView];
            
            if (endPiont.x >self.containerView.bounds.size.width-50) {
                if (self.callBlock) {
                    self.callBlock(YES, self.cellIndex);
                }
            }
            
            [snapView removeFromSuperview];
            self.containerView.hidden = NO;
            break;
        default:
            break;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

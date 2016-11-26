//
//  BCToolBar.m
//  ToolBar
//
//  Created by aaron on 16/11/26.
//  Copyright © 2016年 aaron. All rights reserved.
//

#import "BCToolBar.h"

@interface BCToolBar()

@property (nonatomic, strong) UIToolbar *toolBar;

@end


@implementation BCToolBar

-(instancetype) initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        _toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        [self addSubview:self.toolBar];
        self.bounces = NO;
    }
    return self;
}

-(void) setTitleAry:(NSArray*) ary{
    
    NSMutableArray *barItemMAry = [[NSMutableArray alloc] init];
   
    UIBarButtonItem *fixItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    NSInteger tag = 0;
    for (NSString *name in ary) {
        UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithTitle:name style:UIBarButtonItemStylePlain target:self action:@selector(clickItem:)];
        barItem.tag = tag;
        [barItemMAry addObject:barItem];
        [barItemMAry addObject:fixItem];
        tag+=1;
    }
    [barItemMAry removeLastObject];
    
    self.toolBar.frame = [self extendWidth:self.toolBar.frame titleNum:ary.count];
    self.contentSize = self.toolBar.frame.size;
    [self.toolBar setItems:barItemMAry];
}

-(void) clickItem:(id) sender{
    
    UIBarButtonItem *item = (UIBarButtonItem *)sender;
    if (self.clickBlock) {
        self.clickBlock(item.tag);
    }
}

-(CGRect) extendWidth:(CGRect) frame titleNum:(NSInteger) count{
    
    CGRect tmframe = frame;
    NSInteger newWidth = count * 70;
    tmframe.size.width = (newWidth > tmframe.size.width)?newWidth:tmframe.size.width;
    return tmframe;
}

@end

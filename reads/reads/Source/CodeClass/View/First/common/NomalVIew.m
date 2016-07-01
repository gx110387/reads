//
//  NomalVIew.m
//  reads
//
//  Created by lanou3g on 15/11/5.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "NomalVIew.h"

@implementation NomalVIew

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self p_setupView];
    }
    return self;
}



-(void)p_setupView
{
    // 滚动视图
    self.backgroundColor = [UIColor colorWithRed:251/255.0 green:247/255.0 blue:237/255.0 alpha:1];

    self.backScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(10, 10, CGRectGetWidth(self.frame)-20, CGRectGetHeight(self.bounds)-20)];
    
    self.backScrollView.contentSize = CGSizeMake(CGRectGetWidth(self.frame)-20,CGRectGetHeight(self.bounds)-20);
    self.backScrollView.backgroundColor =[UIColor colorWithRed:251/255.0 green:247/255.0 blue:237/255.0 alpha:1];

    
    [self addSubview:self.backScrollView];
    
    // 标题名字
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.frame = CGRectMake(10, 5, CGRectGetWidth(self.backScrollView.frame)-20, 60);
    self.titleLabel.text = @"揭审\"大老虎\"之后法官的去向";
    self.titleLabel.backgroundColor = [UIColor clearColor];
    self.titleLabel.font = [UIFont systemFontOfSize:24];
    [self.backScrollView addSubview:self.titleLabel];
    
    // 时间以及来源
    self.sourceLabel = [[UILabel alloc] init];
    self.sourceLabel.frame = CGRectMake(CGRectGetMinX(self.titleLabel.frame), CGRectGetMaxY(self.titleLabel.frame)+5, CGRectGetWidth(self.titleLabel.frame), 30);
    self.sourceLabel.text =@"广州日报 2015-11-05 10:41";
    self.sourceLabel.backgroundColor = [UIColor clearColor];
    [self.backScrollView addSubview:self.sourceLabel];
    
    // 内容
    
    
    self.bodyLabel = [[UILabel alloc] init];
    self.bodyLabel.frame = CGRectMake(CGRectGetMinX(self.titleLabel.frame), CGRectGetMaxY(self.sourceLabel.frame)+5, CGRectGetWidth(self.titleLabel.frame), 30);
    self.bodyLabel.backgroundColor = [UIColor colorWithRed:251/255.0 green:247/255.0 blue:237/255.0 alpha:1];

    self.bodyLabel.numberOfLines = 0;
    [self.backScrollView addSubview:self.bodyLabel];
    
    
}
@end

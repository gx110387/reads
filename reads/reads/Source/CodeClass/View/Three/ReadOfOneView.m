//
//  ReadOfOneView.m
//  reads
//
//  Created by lanou3g on 15/11/11.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "ReadOfOneView.h"
#define  g30 CGRectGetHeight(self.frame)/22
#define g20 CGRectGetHeight(self.frame)/33
#define g10 CGRectGetHeight(self.frame)/66.7
@implementation ReadOfOneView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self G_setupView];
    }
    return self;
}
-(void)G_setupView
{
//    @property(nonatomic,strong)UILabel *myVolLabel;
//    @property(nonatomic,strong)UIImageView *myImageBack;
//    @property(nonatomic,strong)UILabel *myTitleLabel;
//    @property(nonatomic,strong)UILabel *myAuthorLabel;
//    @property(nonatomic,strong)UILabel *myContentLabel;
//    @property(nonatomic,strong)UILabel *myMonthLabel;
// 30 22
    // 20 33
   // DoLog(@"%f",CGRectGetHeight(self.frame));
   // 唯一标识
    self.myVolLabel = [[UILabel alloc] init];
    //self.myVolLabel.backgroundColor = [UIColor yellowColor];
    self.myVolLabel.frame = CGRectMake(g20, g10, CGRectGetWidth(self.frame)-g20*2, g30);
    self.myVolLabel.font = [UIFont systemFontOfSize:17];
    self.myVolLabel.text =@"VOL.1130";
    [self addSubview:self.myVolLabel];
    
    // 收藏
    self.myStart = [[UIImageView alloc] init];
    self.myStart.frame = CGRectMake(CGRectGetWidth(self.myVolLabel.frame)-g10, CGRectGetMinY(self.myVolLabel.frame), CGRectGetHeight(self.myVolLabel.frame), CGRectGetHeight(self.myVolLabel.frame));
   // self.myStart.backgroundColor = [UIColor cyanColor];
    [self addSubview:self.myStart];
    
    // 图片
    self.myImageBack = [[UIImageView alloc] init];
    self.myImageBack.frame = CGRectMake(CGRectGetMinX(self.myVolLabel.frame), CGRectGetMaxY(self.myVolLabel.frame)+g10, CGRectGetWidth(self.myVolLabel.frame), CGRectGetHeight(self.frame)/2-g30-g20);
    //self.myImageBack.backgroundColor = [UIColor yellowColor];
    [self addSubview:self.myImageBack];
    
    //一句话
    self.myTitleLabel = [[UILabel alloc] init];
   // self.myTitleLabel.backgroundColor = [UIColor yellowColor];
    self.myTitleLabel.frame = CGRectMake(CGRectGetMinX(self.myImageBack.frame), CGRectGetMaxY(self.myImageBack.frame)+g10, CGRectGetWidth(self.myImageBack.frame), g30);
    self.myTitleLabel.font = [UIFont systemFontOfSize:17];
    self.myTitleLabel.text =@"我将抵达梦中花园，那里也有你的梦 ";
    self.myTitleLabel.textAlignment = NSTextAlignmentRight;
    [self addSubview:self.myTitleLabel];
   
    // 作者
    self.myAuthorLabel  = [[UILabel alloc] init];
    self.myAuthorLabel.frame = CGRectMake(CGRectGetMinX(self.myTitleLabel.frame), CGRectGetMaxY(self.myTitleLabel.frame), CGRectGetWidth(self.myTitleLabel.frame), g30);
   // self.myAuthorLabel.backgroundColor = [UIColor yellowColor];
    self.myAuthorLabel.font = [UIFont systemFontOfSize:17];
    self.myAuthorLabel.text = @"牟林童 作品";
    self.myAuthorLabel.textAlignment = NSTextAlignmentRight;
    [self addSubview:self.myAuthorLabel];
    
    // 月份
    
    self.myMonthLabel = [[UILabel alloc] init];
    self.myMonthLabel.frame = CGRectMake(CGRectGetMinX(self.myAuthorLabel.frame), CGRectGetMaxY(self.myAuthorLabel.frame)+g10/2, CGRectGetWidth(self.frame)/7, CGRectGetHeight(self.myAuthorLabel.frame)*3);
    //self.myMonthLabel.backgroundColor = [UIColor yellowColor];
    self.myMonthLabel.font =[UIFont systemFontOfSize:17];
    self.myMonthLabel.numberOfLines = 2;
    self.myMonthLabel.text =@"11";
    [self addSubview:self.myMonthLabel];
    
    // 内容
    self.myContentLabel = [[UILabel alloc] init];
    self.myContentLabel.backgroundColor = [UIColor colorWithRed:185/255.0 green:172/255.0 blue:124/255.0 alpha:1];

    self.myContentLabel.frame = CGRectMake(CGRectGetMaxX(self.myMonthLabel.frame), CGRectGetMinY(self.myMonthLabel.frame), CGRectGetWidth(self.myAuthorLabel.frame)-CGRectGetWidth(self.myMonthLabel.frame), CGRectGetHeight(self.myMonthLabel.frame));
    self.myContentLabel.font = [UIFont systemFontOfSize:14];
    self.myContentLabel.text = @"应该的事有很多，牙刷应该放在牙缸里，枕头应该放在床上，西瓜应该切开再吃，炒菜应该最后放盐，可是，在一起，却未必。 by 烟波人长安";
    self.myContentLabel.numberOfLines = 0;
    [self addSubview:self.myContentLabel];
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

@end

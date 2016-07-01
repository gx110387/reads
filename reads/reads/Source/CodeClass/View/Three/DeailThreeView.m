//
//  DeailThreeView.m
//  reads
//
//  Created by lanou3g on 15/11/11.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "DeailThreeView.h"

#define Gheight 30
@implementation DeailThreeView

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
    
  // 滑动
    self.myScrollView = [[UIScrollView alloc] init];
    self.myScrollView.frame =CGRectMake(10, 0, CGRectGetWidth(self.frame)-20, CGRectGetHeight(self.frame));
    self.myScrollView.backgroundColor = gbgcontentcolor;
    [self addSubview:self.myScrollView];
    
    
    // 时间
    self.myTimeLabel = [[UILabel alloc] init];
    self.myTimeLabel.frame =CGRectMake(0, 10, CGRectGetWidth(self.myScrollView.frame), Gheight);
    self.myTimeLabel.text =@"2015-11-11";
    self.myTimeLabel.font = [UIFont systemFontOfSize:17];
   // self.myTimeLabel.backgroundColor = [UIColor cyanColor];
    [self.myScrollView addSubview:self.myTimeLabel];
    
    //地点
    
    self.myConTitleLabel = [[UILabel alloc] init];
    self.myConTitleLabel.frame =CGRectMake(CGRectGetMinX(self.myTimeLabel.frame), CGRectGetMaxY(self.myTimeLabel.frame)+5, CGRectGetWidth(self.myTimeLabel.frame), Gheight);
   // self.myConTitleLabel.backgroundColor = [UIColor cyanColor];
    self.myConTitleLabel.font = [UIFont systemFontOfSize:24];
    self.myConTitleLabel.text =@"七月公园";
    [self.myScrollView addSubview:self.myConTitleLabel];
    
    // 作者
    self.myContAuthorLabel = [[UILabel alloc] init];
    self.myContAuthorLabel.frame = CGRectMake(CGRectGetMinX(self.myConTitleLabel.frame), CGRectGetMaxY(self.myConTitleLabel.frame)+5, CGRectGetWidth(self.myConTitleLabel.frame), Gheight/1.5);
    self.myContAuthorLabel.font = [UIFont systemFontOfSize:14];
    //self.myContAuthorLabel.backgroundColor = [UIColor cyanColor];
    self.myContAuthorLabel.text =@"凉炘";
    [self.myScrollView addSubview:self.myContAuthorLabel];
    
    //内容
    self.myContentLabel = [[UILabel alloc] init];
    self.myContentLabel.frame = CGRectMake(CGRectGetMinX(self.myContAuthorLabel.frame), CGRectGetMaxY(self.myContAuthorLabel.frame)+5, CGRectGetWidth(self.myContAuthorLabel.frame), 100);
     self.myContentLabel.numberOfLines = 0;
   // self.myContentLabel.backgroundColor = [UIColor cyanColor];
    self.myContentLabel.font = [UIFont systemFontOfSize:17];
    self.myContentLabel.text = @"内容\n 高ing";
   
    [self.myScrollView addSubview: self.myContentLabel];
    
    
    //
    self.myContentLabel2 = [[UILabel alloc] init];
    self.myContentLabel2.frame = CGRectMake(CGRectGetMinX(self.myContentLabel.frame), CGRectGetMaxY(self.myContentLabel.frame), CGRectGetWidth(self.myContentLabel.frame), 100);
    self.myContentLabel2.numberOfLines = 0;
   // self.myContentLabel2.backgroundColor = [UIColor cyanColor];
    self.myContentLabel2.font = [UIFont systemFontOfSize:17];
    self.myContentLabel2.text = @"内容\n 高ing";
    
    [self.myScrollView addSubview: self.myContentLabel2];
    
    //作者
    self.myContAuthorLabel2 = [[UILabel alloc] init];
    self.myContAuthorLabel2.frame = CGRectMake(CGRectGetMinX(self.myContentLabel2.frame), CGRectGetMaxY(self.myContentLabel2.frame)+10, Gheight*2, Gheight);
   // self.myContAuthorLabel2.backgroundColor = [UIColor cyanColor];
    self.myContAuthorLabel2.font = [UIFont systemFontOfSize:20];
    self.myContAuthorLabel2.text =@"凉炘";
    [self.myScrollView addSubview:self.myContAuthorLabel2];
    
    // @作者
    self.myContAuthorWithLabel = [[UILabel alloc] init];
    self.myContAuthorWithLabel.frame = CGRectMake(CGRectGetMaxX(self.myContAuthorLabel2.frame), CGRectGetMinY(self.myContAuthorLabel2.frame), Gheight*3, Gheight);
  //  self.myContAuthorWithLabel.backgroundColor = [UIColor redColor];
    self.myContAuthorWithLabel.font = [UIFont systemFontOfSize:13];
    self.myContAuthorWithLabel.text =@"@凉炘Nary";
    [self.myScrollView addSubview:self.myContAuthorWithLabel];
    
    // 作者
    self.myAuthLabel = [[UILabel alloc] init];
    self.myAuthLabel.frame = CGRectMake(CGRectGetMinX(self.myContentLabel2.frame), CGRectGetMaxY(self.myContAuthorLabel2.frame), CGRectGetWidth(self.myContentLabel2.frame), Gheight*2);
    self.myAuthLabel.font = [UIFont systemFontOfSize:15];
    self.myAuthLabel.numberOfLines = 0;
  //  self.myAuthLabel.backgroundColor = [UIColor cyanColor];
    self.myAuthLabel.text =@"凉炘，「ONE·一个」常驻作者。已在「ONE·一个」App发表《兰州莎莎》、《另一把羊角匕首》、《蝉的歌》等文章。";
    
    [self.myScrollView addSubview:self.myAuthLabel];
    
    
    
    }

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.myScrollView.frame =CGRectMake(10, 0, CGRectGetWidth(self.frame)-20, CGRectGetHeight(self.frame));
     self.myTimeLabel.frame =CGRectMake(0, 10, CGRectGetWidth(self.myScrollView.frame), Gheight);
     self.myConTitleLabel.frame =CGRectMake(CGRectGetMinX(self.myTimeLabel.frame), CGRectGetMaxY(self.myTimeLabel.frame)+5, CGRectGetWidth(self.myTimeLabel.frame), Gheight);
    
     self.myContAuthorLabel.frame = CGRectMake(CGRectGetMinX(self.myConTitleLabel.frame), CGRectGetMaxY(self.myConTitleLabel.frame)+5, CGRectGetWidth(self.myConTitleLabel.frame), Gheight/1.5);
    
   // self.myContentLabel.frame = CGRectMake(CGRectGetMinX(self.myContAuthorLabel.frame), CGRectGetMaxY(self.myContAuthorLabel.frame)+5, CGRectGetWidth(self.myContAuthorLabel.frame), 300);
     self.myContAuthorLabel2.frame = CGRectMake(CGRectGetMinX(self.myContentLabel2.frame), CGRectGetMaxY(self.myContentLabel2.frame)+10, Gheight*2, Gheight);
    
     self.myContAuthorWithLabel.frame = CGRectMake(CGRectGetMaxX(self.myContAuthorLabel2.frame), CGRectGetMinY(self.myContAuthorLabel2.frame), Gheight*3, Gheight);
    
    self.myAuthLabel.frame = CGRectMake(CGRectGetMinX(self.myContentLabel2.frame), CGRectGetMaxY(self.myContAuthorLabel2.frame), CGRectGetWidth(self.myContentLabel2.frame), Gheight*2);

}



@end

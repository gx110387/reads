//
//  DesTripsSectonSecondTableViewCell.m
//  ZouZou
//
//  Created by lanou3g on 15/10/22.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "FirstTableViewCell.h"

@implementation FirstTableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self G_setupView];
    }
    return self;
}
-(void)G_setupView
{
   
    
//  self.backgroundColor  = gbgcontentcolor;
    self.backgroundColor  = [UIColor whiteColor];
    
    // 白色背景
    self.myBackgroundView = [[UIView alloc] init];
    self.myBackgroundView.frame = CGRectMake(10, 0, CGRectGetWidth(self.frame)-20, CGRectGetHeight(self.frame));
    self.myBackgroundView.layer.cornerRadius = 10;
    self.myBackgroundView.layer.masksToBounds = YES;
    self.myBackgroundView.backgroundColor = [UIColor whiteColor];

    [self addSubview:self.myBackgroundView];
    
    // 图片
    
    self.myImage = [[UIImageView alloc] init];
    self.myImage.frame = CGRectMake(10, 10, CGRectGetWidth(self.myBackgroundView.frame)/3, CGRectGetHeight(self.myBackgroundView.frame)-20);
    //self.myImage.backgroundColor = [UIColor cyanColor];
    
    
    [self.myBackgroundView addSubview:self.myImage];
    
    //标题
    
    self.myNameLabel = [[UILabel alloc] init];
    self.myNameLabel.frame = CGRectMake(CGRectGetMaxX(self.myImage.frame)+10, CGRectGetMinY(self.myImage.frame), CGRectGetWidth(self.myBackgroundView.frame)-CGRectGetWidth(self.myImage.frame)-20, 30);
   // self.myNameLabel.backgroundColor = [UIColor redColor];
    self.myNameLabel.numberOfLines = 2;

    self.myNameLabel.font = [UIFont systemFontOfSize:14];
 
    
    [self.myBackgroundView addSubview:self.myNameLabel];
    
        // 多少人看过
    
    self.myRatingLabel = [[UILabel alloc] init];
  //  self.myRatingLabel.backgroundColor = [UIColor redColor];
    self.myRatingLabel.frame = CGRectMake( CGRectGetMaxX(self.myImage.frame)+10, CGRectGetMaxY(self.myNameLabel.frame), CGRectGetWidth(self.myNameLabel.frame)-43, 20);
    self.myRatingLabel.textAlignment = NSTextAlignmentRight;
    self.myRatingLabel.font = [UIFont systemFontOfSize:12];
    
    [self.myBackgroundView addSubview:self.myRatingLabel];
    
    // 收藏
    
    self.dianzanButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.dianzanButton.frame = CGRectMake( CGRectGetMaxX(self.myRatingLabel.frame)+3, CGRectGetMaxY(self.myNameLabel.frame), 20, 20);
    // self.dianzanButton.backgroundColor = [UIColor cyanColor];
    [self.dianzanButton setBackgroundImage:[UIImage imageNamed:@"like_wl"] forState:UIControlStateNormal];
    [self .myBackgroundView addSubview:self.dianzanButton];
    // 描述
    
    self.myDescriptionLabel = [[UILabel alloc] init];
  //self.myDescriptionLabel.backgroundColor = [UIColor purpleColor];
    self.myDescriptionLabel.frame = CGRectMake(CGRectGetMinX(self.myNameLabel.frame), CGRectGetMaxY(self.myRatingLabel.frame), CGRectGetWidth(self.myRatingLabel.frame)+30, 30);
    self.myDescriptionLabel.numberOfLines = 3;
    
  // self.myDescriptionLabel.text =@"'ddddd";
     self.myDescriptionLabel.font = [UIFont systemFontOfSize:12];
    [self.myBackgroundView addSubview:self.myDescriptionLabel];
    }

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.myBackgroundView.frame = CGRectMake(10, 0, CGRectGetWidth(self.frame)-20, CGRectGetHeight(self.frame));
        // 图片
    self.myImage.frame = CGRectMake(10, 10, CGRectGetWidth(self.myBackgroundView.frame)/3, CGRectGetHeight(self.myBackgroundView.frame)-20);
    //时间
    self.myNameLabel.frame = CGRectMake(CGRectGetMaxX(self.myImage.frame)+10, CGRectGetMinY(self.myImage.frame), CGRectGetWidth(self.myBackgroundView.frame)-CGRectGetWidth(self.myImage.frame)-20, 30);
    // 多少人看过
    
   
    self.myRatingLabel.frame = CGRectMake( CGRectGetMaxX(self.myImage.frame)+10, CGRectGetMaxY(self.myNameLabel.frame), CGRectGetWidth(self.myNameLabel.frame)-43, 20);
    
    self.dianzanButton.frame = CGRectMake( CGRectGetMaxX(self.myRatingLabel.frame)+3, CGRectGetMaxY(self.myNameLabel.frame), 20, 20);
    // 描述
     self.myDescriptionLabel.frame = CGRectMake(CGRectGetMinX(self.myNameLabel.frame), CGRectGetMaxY(self.myRatingLabel.frame), CGRectGetWidth(self.myRatingLabel.frame)+30, 30);
    }
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

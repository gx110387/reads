//
//  FirstPhotoTableViewCell.m
//  reads
//
//  Created by lanou3g on 15/11/5.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "FirstPhotoTableViewCell.h"

@implementation FirstPhotoTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self G_setupView];
    }
    return self;
}
-(void)G_setupView
{
   // self.backgroundColor =gbgcontentcolor;
    
       self.backgroundColor  = [UIColor whiteColor];
    // 背景图片
    self.myBackgroundImage = [[UIImageView alloc] init];
    self.myBackgroundImage.frame = CGRectMake(20, 10, CGRectGetWidth(self.frame)-40, CGRectGetHeight(self.frame)-20);
    
    self.myBackgroundImage.layer.cornerRadius = 10;
    self.myBackgroundImage.layer.masksToBounds = YES;
    self.myBackgroundImage.backgroundColor = [UIColor cyanColor];
    [self addSubview:self.myBackgroundImage];
    
    
    // 名字
    self.myNameLabel = [[UILabel alloc] init];
    self.myNameLabel.frame = CGRectMake(20, CGRectGetHeight(self.myBackgroundImage.frame)-40, CGRectGetWidth(self.myBackgroundImage.frame)-40, 30);
    self.myNameLabel.textColor = [UIColor whiteColor];
    
    self.myNameLabel.font = [UIFont systemFontOfSize:20];
    //self.myNameLabel.backgroundColor = [UIColor redColor];
    [self.myBackgroundImage addSubview:self.myNameLabel];
    

    // 时间
    self.myDataLabel = [[UILabel alloc] init];
    self.myDataLabel.frame = CGRectMake(CGRectGetMinX(self.myNameLabel.frame), CGRectGetMinY(self.myNameLabel.frame)-20, CGRectGetWidth(self.myNameLabel.frame), 20);
    self.myDataLabel.textColor = [UIColor whiteColor];
   
   // self.myDataLabel.backgroundColor = [UIColor redColor];
    self.myDataLabel.font = [UIFont systemFontOfSize:13];
    [self.myBackgroundImage addSubview:self.myDataLabel];
    
    
    
    
    
    
    
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.myBackgroundImage.frame = CGRectMake(20, 10, CGRectGetWidth(self.frame)-40, CGRectGetHeight(self.frame)-20);
    
    self.myNameLabel.frame = CGRectMake(20, CGRectGetHeight(self.myBackgroundImage.frame)-40, CGRectGetWidth(self.myBackgroundImage.frame)-40, 30);    self.myDataLabel.frame = CGRectMake(CGRectGetMinX(self.myNameLabel.frame), CGRectGetMaxY(self.myNameLabel.frame)+10, CGRectGetWidth(self.myNameLabel.frame)/2/1.5, 20);
    
    self.myDataLabel.frame = CGRectMake(CGRectGetMinX(self.myNameLabel.frame), CGRectGetMinY(self.myNameLabel.frame)-20, CGRectGetWidth(self.myNameLabel.frame), 20);
    
    
    
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end

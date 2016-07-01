//
//  MovieTableViewCell.m
//  UI综合_豆瓣
//
//  Created by lanou3g on 15/9/17.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "MovieTableViewCell.h"
#define Gframe  [UIScreen mainScreen].bounds
@implementation MovieTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self p_setupView];
    }
    return self;
}
- (void)p_setupView
{
  

    self.photoImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 0, CGRectGetWidth(Gframe)/3, CGRectGetWidth(Gframe)/4)];
    self.photoImage.image = bgPhoto;
  // self.photoImage.backgroundColor = [UIColor cyanColor];
    [self addSubview:_photoImage];
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.photoImage.frame)+10, CGRectGetMinY(self.photoImage.frame), CGRectGetWidth(Gframe)-CGRectGetMaxY(self.photoImage.frame), CGRectGetWidth(Gframe)/4/2)];
  // self.titleLabel.backgroundColor = [UIColor cyanColor];
    [self addSubview:_titleLabel];
    
    
    self.deatilLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(_titleLabel.frame), CGRectGetMaxY(_titleLabel.frame),CGRectGetWidth(self.titleLabel.frame), CGRectGetWidth(Gframe)/4/2)];
   //  self.deatilLabel.backgroundColor = [UIColor cyanColor];
    [self addSubview:_deatilLabel];
   
    
    
    
}
 
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

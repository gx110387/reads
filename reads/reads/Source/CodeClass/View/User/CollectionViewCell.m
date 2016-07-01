//
//  CollectionViewCell.m
//  ZouZou
//
//  Created by lanou3g on 15/10/16.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:self.bounds]) {
        [self gett];
    }
    return self;
}

-(void)gett
{
  
    self.myImage = [[UIImageView alloc] init];
    self .myImage.frame =CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds)/2.2, CGRectGetWidth([UIScreen mainScreen].bounds)/2.1);
   self.myImage.backgroundColor = gbgcontentcolor;
    self.myImage.userInteractionEnabled = YES;
    self.myImage.layer.cornerRadius = 5;
    self.myImage.layer.masksToBounds = YES;
    //self.myImage .image = [UIImage imageNamed:@"1.jpg"];
    [self.contentView addSubview:_myImage];
    
    
    self.nameLabel = [[UILabel alloc] init];
    self.nameLabel.frame = CGRectMake(10, CGRectGetHeight(self.myImage.frame)/2, CGRectGetWidth(self.myImage.frame)-20, CGRectGetHeight(self.myImage.frame)/2);
    self.nameLabel.textAlignment = NSTextAlignmentLeft;
     self.nameLabel.textColor = [UIColor whiteColor];
  // self.nameLabel.backgroundColor = [UIColor cyanColor];
    self.nameLabel.numberOfLines = 0;
    [self.myImage addSubview:_nameLabel];

}

-(UIImageView *)myImageImage
{
    if (_myImageImage == nil) {
        _myImageImage = [[UIImageView alloc] init];
        _myImageImage.frame = CGRectMake(10, CGRectGetHeight(self.myImage.frame)-CGRectGetHeight(self.myImage.frame)/2-CGRectGetWidth(self.myImage.frame)/3/2, CGRectGetWidth(self.myImage.frame)/3, CGRectGetWidth(self.myImage.frame)/3);
         _myImageImage.backgroundColor = [UIColor clearColor];
        [self.myImage addSubview:_myImageImage];
        
    }
    return _myImageImage;
    
    
}
-(void)layoutSubviews
{
     [super layoutSubviews];
   // self .myImage.frame =CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds)/2.2,CGRectGetWidth([UIScreen mainScreen].bounds)/2.1);
   self.nameLabel.frame = CGRectMake(10, CGRectGetHeight(self.myImage.frame)/2, CGRectGetWidth(self.myImage.frame)-20, CGRectGetHeight(self.myImage.frame)/2);

}

@end

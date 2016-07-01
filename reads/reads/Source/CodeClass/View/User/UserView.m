//
//  UserView.m
//  ZouZou
//
//  Created by lanou3g on 15/10/23.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "UserView.h"
#define Gwidth CGRectGetWidth(self.frame)/3
@interface UserView ()


@end

@implementation UserView

-(UIImageView*)G_UserImage
{
    if (_G_UserImage ==nil) {
        _G_UserImage = [[UIImageView alloc] init];
        _G_UserImage.image = [UIImage imageNamed:@"picholder"];
        [self addSubview:_G_UserImage];
        
    }
    return _G_UserImage;
}


-(UIButton *)G_UserLoginOrRegistButton
{
    if (_G_UserLoginOrRegistButton ==nil) {
        _G_UserLoginOrRegistButton = [[UIButton alloc] init];
        [self addSubview:_G_UserLoginOrRegistButton];
        [_G_UserLoginOrRegistButton setTitle:@"登陆//注册" forState:UIControlStateNormal];
        [_G_UserLoginOrRegistButton addTarget:self action:@selector(ButtonAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _G_UserLoginOrRegistButton;
    
}

-(UITextField *)G_UserStartLabel
{
    if (_G_UserStartLabel ==nil) {
        _G_UserStartLabel = [[UITextField alloc] init];
         
        _G_UserStartLabel.placeholder =@"今天天气真好~睡个懒觉";
        _G_UserStartLabel.textAlignment = NSTextAlignmentCenter;
        
        [self addSubview:_G_UserStartLabel];
    }
    
    return _G_UserStartLabel;
    
}
#define Gfont [UIFont systemFontOfSize:14];
-(UserImageView *)G_startimageView
{
    if (_G_startimageView ==nil) {
        _G_startimageView = [[ UserImageView alloc] init];
        
        _G_startimageView.myImage.frame = CGRectMake(Gwidth/2-15, 10, 30, 30);
        _G_startimageView.myImage.image = [UIImage imageNamed:@"icon_star"];
        _G_startimageView. myImage.layer.cornerRadius = 15;
         _G_startimageView.myImage.userInteractionEnabled = YES;
        UITapGestureRecognizer *gnizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(shoucang)];
        [_G_startimageView.myImage addGestureRecognizer:gnizer];
      
      //  _G_startimageView.myImage.backgroundColor = [UIColor yellowColor];
        _G_startimageView.myLabel.frame = CGRectMake(Gwidth/2-35, 43, 70, 14);
        _G_startimageView.myLabel.text =@"我的收藏";
        _G_startimageView.myLabel.font = Gfont
        _G_startimageView.myLabel.tintColor = [UIColor whiteColor];
       // _G_startimageView.myLabel.backgroundColor = [UIColor cyanColor];
        [self addSubview:_G_startimageView];
    }
    return _G_startimageView;
    
}

-(UserImageView *)G_jiluimageView
{
    if (_G_jiluimageView ==nil) {
        _G_jiluimageView = [[ UserImageView alloc] init];
        _G_jiluimageView.myImage.frame = CGRectMake(Gwidth/2-15, 10, 30, 30);
        _G_jiluimageView.myImage.image = [UIImage imageNamed:@"top_navigation_more"];
        _G_jiluimageView.myImage.layer.cornerRadius = 5;
        _G_jiluimageView.myImage.userInteractionEnabled = YES;
        UITapGestureRecognizer *gnizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(jilu)];
        [_G_jiluimageView.myImage addGestureRecognizer:gnizer];
       // _G_jiluimageView.myImage.backgroundColor = [UIColor redColor];
        _G_jiluimageView.myLabel.frame = CGRectMake(Gwidth/2-35, 43, 70, 14);
        _G_jiluimageView.myLabel.text =@"浏览记录";
        _G_jiluimageView.myLabel.font = Gfont
         _G_jiluimageView.myLabel.tintColor = [UIColor whiteColor];
      //  _G_jiluimageView.myLabel.backgroundColor = [UIColor cyanColor];
        [self addSubview:_G_jiluimageView];
    }
    return _G_jiluimageView;
    
}
-(UserImageView *)G_psdimageView
{
    if (_G_psdimageView ==nil) {
        _G_psdimageView = [[ UserImageView alloc] init];
        _G_psdimageView.myImage.frame = CGRectMake(Gwidth/2-15, 10, 30, 30);
        _G_psdimageView.myImage.image = [UIImage imageNamed:@"top_navigation_infoicon"];
        _G_psdimageView. myImage.layer.cornerRadius = 15;
         _G_psdimageView.myImage.userInteractionEnabled = YES;
        UITapGestureRecognizer *gnizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(psd)];
        [_G_psdimageView.myImage addGestureRecognizer:gnizer];
      //  _G_psdimageView.myImage.backgroundColor = [UIColor yellowColor];
        _G_psdimageView.myLabel.frame = CGRectMake(Gwidth/2-35, 43, 70, 14);
        _G_psdimageView.myLabel.text =@"修改密码";
        _G_psdimageView.myLabel.font = Gfont
         _G_psdimageView.myLabel.tintColor = [UIColor whiteColor];
       // _G_psdimageView.myLabel.backgroundColor = [UIColor redColor];
        [self addSubview:_G_psdimageView];
    }
    return _G_psdimageView;
    
}

-(void)ButtonAction
{
    [self.delegate loginButton];
    
}

-(void)shoucang
{
    
    [self.delegate myStart];
}
-(void)jilu
{
    [self.delegate jilu];
}
-(void)psd
{
    [self.delegate psdXiuGai];
}
@end

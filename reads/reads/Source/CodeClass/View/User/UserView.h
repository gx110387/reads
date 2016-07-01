//
//  UserView.h
//  ZouZou
//
//  Created by lanou3g on 15/10/23.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
@class UserImageView;
@protocol UserViewDelegate <NSObject>

-(void)loginButton;

-(void)psdXiuGai;

-(void)myStart;

-(void)jilu;

@end

@interface UserView : UIView
@property(nonatomic,strong)UIImageView *G_UserImage;
@property(nonatomic,strong)UIImageView *G_backgroundImage;
@property(nonatomic,strong)UIButton *G_UserLoginOrRegistButton;

@property(nonatomic,strong)UITextField *G_UserStartLabel;
@property(nonatomic,weak)id<UserViewDelegate>delegate;

@property(nonatomic,strong)UserImageView *G_startimageView;
@property(nonatomic,strong)UserImageView *G_jiluimageView;
@property(nonatomic,strong)UserImageView *G_psdimageView;


@end

//
//  LoginView.m
//  UI综合_豆瓣
//
//  Created by lanou3g on 15/9/18.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "LoginView.h"

@implementation LoginView
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
   self.backgroundColor = [UIColor whiteColor];
    
//   self.backView = [[UIView alloc]init];
//    self.backView.frame = CGRectMake(0, 从供热传统, kScreenWidth - 60, (kScreenWidth - 60)/1.75);
//   self.backView.layer.cornerRadius = 9;
//   [self addSubview:self.backView];
    //
    self.myImage = [[UIImageView alloc] initWithFrame:self.frame];
    self.myImage.image = [UIImage imageNamed:@"QingTian"];
    self.myImage.userInteractionEnabled = YES;
    [self addSubview:self.myImage];
    
    
    
    
    self.loginLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, 80, 40)];
    //self.loginLabel.backgroundColor = [UIColor cyanColor];
    self.loginLabel.text = @"用户名:";
    [self addSubview:_loginLabel];
    //
    self.passLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.loginLabel.frame), CGRectGetMaxY(self.loginLabel.frame)+20, CGRectGetWidth(self.loginLabel.frame), CGRectGetHeight(self.loginLabel.frame))];
    self.passLabel.text =@"密码:";
   // self.loginLabel.backgroundColor = [UIColor cyanColor];
    [self addSubview:_passLabel];
    //
    self.loginTextField = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.loginLabel.frame), CGRectGetMinY(self.loginLabel.frame), CGRectGetWidth(self.frame)-CGRectGetWidth(self.loginLabel.frame)-60, CGRectGetHeight(self.loginLabel.frame))];
    self.loginTextField.placeholder =@"请输入用户名";
    self.loginTextField.clearsOnBeginEditing = YES;
    self.loginTextField.keyboardType =UIKeyboardTypeEmailAddress;
    self.loginTextField.borderStyle= UITextBorderStyleRoundedRect;
    self.loginTextField.returnKeyType = UIReturnKeyDone;
    [self addSubview:_loginTextField];
    
    //
    self.passTextField = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.loginTextField.frame), CGRectGetMinY(self.passLabel.frame), CGRectGetWidth(self.loginTextField.frame), CGRectGetHeight(self.passLabel.frame))];
    self.passTextField.placeholder =@"请输入密码";
    self.passTextField.clearsOnBeginEditing = YES;
    self.passTextField.keyboardType = UIKeyboardTypeEmailAddress;
    self.passTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.passTextField.returnKeyType = UIReturnKeyDone;
    [self addSubview:_passTextField];
    
    
    self.myForgetButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.myForgetButton.frame = CGRectMake(CGRectGetMaxX(self.passTextField.frame)-CGRectGetWidth(self.passTextField.frame)/1.2, CGRectGetMaxY(self.passTextField.frame)+10, CGRectGetWidth(self.passTextField.frame), 17);
    //self.myForgetButton.backgroundColor = gbgcontentcolor;
    self.myForgetButton.tintColor = [UIColor whiteColor];
    [self.myForgetButton setTitle:@"忘记密码?找回密码" forState:UIControlStateNormal];
    self.myForgetButton.layer.cornerRadius = 5;
    [self addSubview:_myForgetButton];
    
    
    // 登录
    self.loginButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.loginButton.frame = CGRectMake(CGRectGetMaxX(self.passTextField.frame)-(CGRectGetWidth(self.passLabel.frame)+40), CGRectGetMaxY(self.passLabel.frame)+60, CGRectGetWidth(self.passLabel.frame)+40, 40);
    self.loginButton.tintColor = [UIColor colorWithRed:0/255.0 green:175/255.0 blue:240/255.0 alpha:1];
    self.loginButton.backgroundColor = gbgcontentcolor;
    [self.loginButton setTitle: @"登录" forState:UIControlStateNormal];
     self.loginButton.layer.cornerRadius = 10;
    // [self.loginButton setTitle:@"登陆" forState:UIControlStateNormal];
    [self addSubview:_loginButton];
    
    
    //注册
    self.regiBUtton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.regiBUtton.frame = CGRectMake(CGRectGetMinX(self.loginButton.frame)-20-CGRectGetWidth(self.loginButton.frame), CGRectGetMinY(self.loginButton.frame), CGRectGetWidth(self.loginButton.frame), CGRectGetHeight(self.loginButton.frame));
    //[self.regiBUtton setBackgroundImage:[UIImage imageNamed:@"register_button.png"] forState:UIControlStateNormal];
    self.regiBUtton.backgroundColor = gbgcontentcolor;
    self.regiBUtton.tintColor = [UIColor colorWithRed:0/255.0 green:175/255.0 blue:240/255.0 alpha:1];
    self.regiBUtton.layer.cornerRadius = 10;
    [self.regiBUtton setTitle:@"注册" forState:UIControlStateNormal];
    [self addSubview:_regiBUtton];

    
}
@end

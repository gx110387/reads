//
//  RegiView.m
//  UI综合_豆瓣
//
//  Created by lanou3g on 15/9/18.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "RegiView.h"

@implementation RegiView

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
    //
    self.myImage = [[UIImageView alloc] initWithFrame:self.frame];
    self.myImage.image = [UIImage imageNamed:@"QingTian"];
    self.myImage.userInteractionEnabled = YES;
    [self addSubview:self.myImage];
    
    self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, 80, 40)];
    // self.loginLabel.backgroundColor = [UIColor cyanColor];
    self.nameLabel.text = @"用户名:";
    [self addSubview:_nameLabel];
    //
    //
    self.nameTextField = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.nameLabel.frame)+20, CGRectGetMinY(self.nameLabel.frame), CGRectGetWidth(self.frame)-CGRectGetWidth(self.nameLabel.frame)-60, CGRectGetHeight(self.nameLabel.frame))];
    self.nameTextField.placeholder =@"请输入用户名";
    self.nameTextField.clearsOnBeginEditing = YES;
    
    self.nameTextField.keyboardType =UIKeyboardTypeEmailAddress;
    self.nameTextField.borderStyle= UITextBorderStyleRoundedRect;
      self.nameTextField.returnKeyType = UIReturnKeyDone;
    [self addSubview:_nameTextField];
//
    
    
    self.passLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.nameLabel.frame), CGRectGetMaxY(self.nameLabel.frame)+20, CGRectGetWidth(self.nameLabel.frame), CGRectGetHeight(self.nameLabel.frame))];
    self.passLabel.text =@"密码:";
    // self.loginLabel.backgroundColor = [UIColor cyanColor];
    [self addSubview:_passLabel];
    //
    
    self.passTextField = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.nameTextField.frame), CGRectGetMinY(self.passLabel.frame), CGRectGetWidth(self.nameTextField.frame), CGRectGetHeight(self.passLabel.frame))];
    self.passTextField.placeholder =@"请输入密码";
    self.passTextField.clearsOnBeginEditing = YES;
    self.passTextField.keyboardType = UIKeyboardTypeEmailAddress;
    self.passTextField.borderStyle = UITextBorderStyleRoundedRect;
      self.passTextField.returnKeyType = UIReturnKeyDone;
    [self addSubview:_passTextField];
    
    //
    
    self.passagainLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.passLabel.frame), CGRectGetMaxY(self.passLabel.frame)+20, CGRectGetWidth(self.passLabel.frame), CGRectGetHeight(self.passLabel.frame))];
    self.passagainLabel.text =@"确认密码:";
    // self.loginLabel.backgroundColor = [UIColor cyanColor];
    [self addSubview:_passagainLabel];
    //
    
    self.passaginTextField = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.passTextField.frame), CGRectGetMinY(self.passagainLabel.frame), CGRectGetWidth(self.passTextField.frame), CGRectGetHeight(self.passagainLabel.frame))];
    self.passaginTextField.placeholder =@"再次输入密码";
    self.passaginTextField.clearsOnBeginEditing = YES;
    self.passaginTextField.keyboardType = UIKeyboardTypeEmailAddress;
    self.passaginTextField.borderStyle = UITextBorderStyleRoundedRect;
      self.passaginTextField.returnKeyType = UIReturnKeyDone;
    [self addSubview:_passaginTextField];
    
//
    
    self.emilLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.passagainLabel.frame), CGRectGetMaxY(self.passagainLabel.frame)+20, CGRectGetWidth(self.passagainLabel.frame), CGRectGetHeight(self.passagainLabel.frame))];
    self.emilLabel.text =@"邮箱:";
    // self.loginLabel.backgroundColor = [UIColor cyanColor];
    [self addSubview:_emilLabel];
    //
    
    self.emilTextField = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.passaginTextField.frame), CGRectGetMinY(self.emilLabel.frame), CGRectGetWidth(self.passaginTextField.frame), CGRectGetHeight(self.emilLabel.frame))];
    self.emilTextField.placeholder =@"请输入邮箱";
    self.emilTextField.clearsOnBeginEditing = YES;
    self.emilTextField.keyboardType = UIKeyboardTypeEmailAddress;
    self.emilTextField.borderStyle = UITextBorderStyleRoundedRect;
      self.emilTextField.returnKeyType = UIReturnKeyDone;
    [self addSubview:_emilTextField];
    

    //
    
    self.teleLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.emilLabel.frame), CGRectGetMaxY(self.emilLabel.frame)+20, CGRectGetWidth(self.emilLabel.frame), CGRectGetHeight(self.emilLabel.frame))];
    self.teleLabel.text =@"联系方式:";
    // self.loginLabel.backgroundColor = [UIColor cyanColor];
    [self addSubview:_teleLabel];
    //
    
    self.teleTextField = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.emilTextField.frame), CGRectGetMinY(self.teleLabel.frame), CGRectGetWidth(self.emilTextField.frame), CGRectGetHeight(self.teleLabel.frame))];
    self.teleTextField.placeholder =@"请输入联系方式";
    self.teleTextField.clearsOnBeginEditing = YES;
    self.teleTextField.keyboardType = UIKeyboardTypeNamePhonePad;
    self.teleTextField.borderStyle = UITextBorderStyleRoundedRect;
      self.teleTextField.returnKeyType = UIReturnKeyDone;
    [self addSubview:_teleTextField];
    
    self.mainButton =[ UIButton buttonWithType:UIButtonTypeSystem];
    self.mainButton.frame = CGRectMake(CGRectGetWidth(self.frame)- CGRectGetMaxX(self.teleTextField.frame)/1.5, CGRectGetMaxY(self.teleTextField.frame)+ 20, 200, 20);
    self.mainButton.tintColor = [UIColor whiteColor];
    //self.mainButton.font = [UIFont systemFontOfSize:20];
    [self.mainButton setTitle:@"我已阅读:用户注册隐私协议" forState:UIControlStateNormal];
    [self addSubview:self.mainButton];
    
    
    
    // 是否看过
    self.isReadSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.mainButton.frame)-CGRectGetWidth( self.mainButton.frame)/4, CGRectGetMinY(self.mainButton.frame)-5, CGRectGetWidth( self.mainButton.frame)/2, 20)];
   // self.isReadSwitch.backgroundColor = [UIColor redColor];
    self.isReadSwitch.on = NO;
    [self addSubview:self.isReadSwitch];
    
    //注册
    self.regisetButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.regisetButton.frame = CGRectMake(CGRectGetMinX(self.mainButton.frame), CGRectGetMaxY(self.mainButton.frame)+20, CGRectGetWidth(self.teleTextField.frame)/2, 40);
    self.regisetButton.backgroundColor = gbgcontentcolor;
    self.regisetButton.tintColor = [UIColor colorWithRed:0/255.0 green:175/255.0 blue:240/255.0 alpha:1];
    self.regisetButton.layer.cornerRadius = 10;
    [self.regisetButton setTitle:@"注册" forState:UIControlStateNormal];
    [self addSubview: _regisetButton];
    
    
    
    
    
    
    
    
}

@end

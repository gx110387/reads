//
//  User.h
//  leanCloud
//
//  Created by lanou3g on 15/10/10.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserLoginModel : NSObject

@property(nonatomic,strong)NSString *username;
@property(nonatomic,strong)NSString *password;
@property(nonatomic,strong)NSString *email;
@property(nonatomic,strong)NSString *phone;
///
@property(nonatomic,strong)NSString *url;
@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)NSString *tags;
@property(nonatomic,strong)NSString *ptime;
@property(nonatomic,strong)NSString *dpcid;
@property(nonatomic,strong)NSString *skipID;
@property(nonatomic,strong)NSString *skipType;
@end

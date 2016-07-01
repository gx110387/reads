//
//  ShareView.h
//  TYAlertControllerDemo
//
//  Created by tanyang on 15/10/26.
//  Copyright © 2015年 tanyang. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol ShareViewDelegate <NSObject>

// 微博
-(void)sinaShare;
// qq
-(void)QQShare;
//qq空间
-(void)QQZoneShare;
//微信
-(void)WeChatShare;
//微信空间
-(void)WeChatZoneShare;
//腾讯微博
-(void)tencentWb;

// 短信
-(void)snsShare;

//邮件
-(void)emailShare;


@end

@interface ShareView : UIView
@property (weak, nonatomic) IBOutlet UIButton *QQ;
@property (weak, nonatomic) IBOutlet UIButton *QQZone;
@property (weak, nonatomic) IBOutlet UIButton *WeChat;
@property (weak, nonatomic) IBOutlet UIButton *WeChatZone;
@property (weak, nonatomic) IBOutlet UIButton *OtherShare;


@property(nonatomic,weak)id<ShareViewDelegate>delegate;
@end

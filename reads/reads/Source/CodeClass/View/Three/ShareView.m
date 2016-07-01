//
//  ShareView.m
//  TYAlertControllerDemo
//
//  Created by tanyang on 15/10/26.
//  Copyright © 2015年 tanyang. All rights reserved.
//

#import "ShareView.h"
#import "UIView+TYAlertView.h"

@interface ShareView ()

@end

@implementation ShareView

- (IBAction)cancleAction:(id)sender {
    // hide view,or dismiss controller
    [self hideView];
}
- (IBAction)sinaShare:(id)sender {
  
    DoLog(@"gaoxing");
    [self.delegate sinaShare];
}

- (IBAction)QQShare:(UIButton  *)sender {
    
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"mqq://"]]) {
        
        [self.delegate QQShare];
        
     }else{
         
        // 如果QQ不存在 但是微信存在 (过)
        
        if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"weixin://"]]) {
            
            [self.delegate WeChatShare];
            
        }else {
            [self.delegate snsShare];
            
        }
        
        
    }
//    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"mqq://"]]) {
//       
//      [self.delegate QQShare];
//        
//    }else{
//        
//        [self.delegate snsShare];
//           }
    
}

- (IBAction)QQZoneShare:(id)sender {
   
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"mqq://"]]) {
        
        [self.delegate QQZoneShare];
      }else{
        // 如果QQ不存在 但是微信存在 (过)
        
        if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"weixin://"]]) {
            
            [self.delegate WeChatZoneShare];
            
        }else {
            [self.delegate tencentWb];
            
        }
        
        
    }

    
//    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"mqq://"]]) {
//        
//        [self.delegate QQZoneShare];
//        
//    }else{
//        [self.delegate tencentWb];
//       
//        NSLog(@"no---");
//    }
}

- (IBAction)WeChatShare:(id)sender {
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"mqq://"]]) {
        
              // 如果qq存在 那么就判断微信是否存在
        if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"weixin://"]]) {
            // 如果微信存在 那么就执行这个方法, (过)
            [self.delegate WeChatShare];
            
        }else{
            // 微信好友改成腾讯微博 (过)
            [self.delegate tencentWb];
            
        }
    }else{
        // 如果QQ不存在 但是微信存在 (过)
        
        if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"weixin://"]]) {
            
            [self.delegate tencentWb];
            
        }else {
            [self.delegate emailShare];
            
        }
        
        
    }

//    
//    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"weixin://"]]) {
//        
//         [self.delegate WeChatShare];
//        
//    }else{
//        [self.delegate emailShare];
//        
//        NSLog(@"no---");
//    }
//
}

- (IBAction)WeChatZoneShare:(id)sender {
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"mqq://"]]) {
        
        
        // 如果qq存在 那么就判断微信是否存在
        if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"weixin://"]]) {
            // 如果微信存在 那么就执行这个方法, (过)
            [self.delegate WeChatZoneShare];
        }else{
            // 微信好友改成腾讯微博 (过)
            [self.delegate snsShare];
            
        }
    }else{
        // 如果QQ不存在 但是微信存在 (过)
        
        if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"weixin://"]]) {
            
            [self.delegate snsShare];
            
        }else {
           
            
        }
        
        
    }

    
//    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"weixin://"]]) {
//        
//        [self.delegate WeChatZoneShare];
//        
//    }else{
//      
//        
//        NSLog(@"no---");
//    }

}
- (IBAction)OtherShareAboutTent:(id)sender {
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"mqq://"]]) {
        
       
        // 如果qq存在 那么就判断微信是否存在
        if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"weixin://"]]) {
            // 如果微信存在 那么就执行这个方法, (过)
            [self.delegate tencentWb];
        }else{
            // 微信好友改成腾讯微博 (过)
            [self.delegate emailShare];
            
        }
    }else{
        // 如果QQ不存在 但是微信存在 (过)
        
        if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"weixin://"]]) {
            
            [self.delegate emailShare];
            
        }else {
            
            
        }
        
        
    }
    
    //    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"mqq://"]]&&[[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"weixin://"]]) {
    //
    //       [self.delegate emailShare];
    //
    //    }else{
    //
    //
    //        NSLog(@"no---");
    //    }
    
}



@end

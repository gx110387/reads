//
//  VideoViewController.h
//  reads
//
//  Created by lanou3g on 15/11/8.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
@class KrVideoPlayerController;
 typedef void(^Info)(NSInteger num);
@interface VideoViewController : UIViewController
@property(nonatomic,strong)NSString *url;
@property(nonatomic,copy)Info num;
@property (nonatomic, strong) KrVideoPlayerController *movieViewController;
@end

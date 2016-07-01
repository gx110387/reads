//
//  AppDelegate.h
//  reads
//
//  Created by lanou3g on 15/11/2.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FirstViewController.h"
#import "FLSideSlipViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UINavigationController *TourBarController;
@property (strong, nonatomic) UINavigationController *TakeBarController;
@property (strong, nonatomic) UINavigationController *ActivityBarController;
@property (strong, nonatomic) UINavigationController *DestinationBarController;
@property(nonatomic,strong) FirstViewController  *tourMainViewController;
@property (retain,nonatomic)FLSideSlipViewController *menuViewController;
@property(nonatomic,strong)UITabBarController *tab;

@end


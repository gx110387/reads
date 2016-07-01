//
//  AppDelegate.m
//  reads
//
//  Created by lanou3g on 15/11/2.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "AppDelegate.h"

#import "UMSocialQQHandler.h"
 #import "UMSocialWechatHandler.h"

@interface AppDelegate ()<CoreStatusProtocol>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
   
     [CoreStatus beginNotiNetwork:self];
    
    NSString * statusString = [CoreStatus currentNetWorkStatusString];
    
 
    
    [AlertShow alertShowWithContent:statusString Seconds:1.f];
    
    [AVOSCloud setApplicationId:@"NfjnKroYaf7ujTES9Y03PjDs"
                      clientKey:@"DLR4y5VRKgMa0W4KpbjLQel2"];
    [AVAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
 
    
    
    [UMSocialData setAppKey:@"56486f4067e58e3bd4002d1f"];
    //设置分享到QQ/Qzone的应用Id，和分享url 链接
     [UMSocialQQHandler setQQWithAppId:@"1104898517" appKey:@"ggjIoPyhN6hR3Avu" url:@"http://www.umeng.com/social"];
    
        //    //设置支持没有客户端情况下使用SSO授权
    [UMSocialQQHandler setSupportWebView:YES];

    
    //设置微信AppId、appSecret，分享url wx5b966afa36b56660  d4624c36b6795d1d99dcf0547af5443d
    [UMSocialWechatHandler setWXAppId:@"wx653516bddf647e92" appSecret:@"d4624c36b6795d1d99dcf0547af5443d" url:@"http://www.umeng.com/social"];
    
    
    
    
 
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] ;
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    
[self G_data];

   
    
    
    [[NSUserDefaults standardUserDefaults]setBool:YES   forKey:@"Xsport1"];
    [[NSUserDefaults standardUserDefaults]setBool:NO forKey:[NSString stringWithFormat:@"%@phtoto",[tools getUserLogin]]];
    return YES;
}

//- (BOOL)shouldAutorotate
//{
//    return NO;
//}
//// 支持屏幕方向
//- (NSUInteger)supportedInterfaceOrientations
//{
//    return UIInterfaceOrientationMaskPortrait;
//}
//// 默认屏幕旋转
//- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
//{
//    return UIInterfaceOrientationPortrait;
//}
////- (NSUInteger)supportedInterfaceOrientations
////{
////    return UIInterfaceOrientationMaskPortrait;
////

//===============10.1
- (NSUInteger)application:(UIApplication*)application supportedInterfaceOrientationsForWindow:(UIWindow*)window {
    return UIInterfaceOrientationMaskPortrait;
}

-(void)coreNetworkChangeNoti:(NSNotification *)noti{
    
    NSString * statusString = [CoreStatus currentNetWorkStatusString];
    
    NSLog(@"%@\n\n\n\n=========================\n\n\n\n%@",noti,statusString);
    
    [AlertShow alertShowWithContent:statusString Seconds:1.f];
    
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    DoLog(@"dddd");
    return  [UMSocialSnsService handleOpenURL:url];
}
- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation
{
     DoLog(@"ddddCCCC");
    return  [UMSocialSnsService handleOpenURL:url];
}


#pragma mark - tarbar
-(void)G_data
{
    if([[[UIDevice currentDevice] systemVersion] doubleValue] >= 7.0){
        [[UINavigationBar appearance] setTranslucent:NO];
    }
    
   UIColor * color = [UIColor whiteColor];
   NSDictionary * dict=[NSDictionary dictionaryWithObject:color forKey:UITextAttributeTextColor];
 // self.navigationController.navigationBar.titleTextAttributes = dict;
   [[UINavigationBar appearance] setTitleTextAttributes:dict];
    
    
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
  [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:0/255.0 green:175/255.0 blue:240/255.0 alpha:1]];
    //设置字体颜色
    UIColor *titleNormalColor = [UIColor blackColor];
    UIColor *titleSelectedColor = [UIColor blackColor];
    
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                       titleNormalColor, NSForegroundColorAttributeName,
                                                       nil] forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                       titleSelectedColor, NSForegroundColorAttributeName,
                                                       nil] forState:UIControlStateSelected];
    
    ////四个模块：新闻:   自媒体:    每日一读:     我的:
    
    //介绍
    self.tourMainViewController= [[FirstViewController alloc] init];
    
    
    
    
    
    //带你玩:
    SecondViewController *takeMainViewController = [[SecondViewController alloc] init];
    UITabBarItem *item2 = [[UITabBarItem alloc] initWithTitle:@"自媒体" image:nil tag:2];
    item2.image = [[UIImage imageNamed:@"discover_black.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item2.selectedImage = [[UIImage imageNamed:@"discover_on.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    takeMainViewController.tabBarItem = item2;
    
    
    //附近:
    
    ThreeViewController *activityMainController = [[ThreeViewController alloc] init];
    UITabBarItem *item3 = [[UITabBarItem alloc] initWithTitle:@"每日一读" image:nil tag:3];
    item3.image = [[UIImage imageNamed:@"VIP_black.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item3.selectedImage = [[UIImage imageNamed:@"VIP_on.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    activityMainController.tabBarItem = item3;
    
    // 目的地:
    UserViewController *destinationMainController = [[UserViewController alloc] init];
    UITabBarItem *item5 = [[UITabBarItem alloc] initWithTitle:@"个人信息" image:nil tag:4];
    item5.image = [[UIImage imageNamed:@"User_black.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item5.selectedImage = [[UIImage imageNamed:@"User_on.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    destinationMainController.tabBarItem = item5;
    
    
    
    //导航栏
    self.TourBarController = [[UINavigationController alloc] initWithRootViewController:self.tourMainViewController];
    
    
    _menuViewController = [[FLSideSlipViewController alloc]initWithRootViewController:self.TourBarController];
    _menuViewController.leftDistance = 100;//设置滑动距离
    _menuViewController.scaleSize = 1;//设置缩小比例
    _menuViewController.animationType = AnimationTransition;//设置动画类型
    _menuViewController.canSlideInPush = NO;
    
    LeftViewController *leftController = [[LeftViewController alloc] init];
    
    _menuViewController.leftViewController = leftController;
    
    
    UITabBarItem *item1 = [[UITabBarItem alloc] initWithTitle:@"今日头条" image:nil tag:1];
    item1.image = [[UIImage imageNamed:@"Main_Black.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];//忽略tabBar.tintColor
    item1.selectedImage = [[UIImage imageNamed:@"Main_on.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    _menuViewController.tabBarItem = item1;
    
    
    self.TakeBarController = [[UINavigationController alloc] initWithRootViewController:takeMainViewController];
    self.ActivityBarController = [[UINavigationController alloc] initWithRootViewController:activityMainController];
    self.DestinationBarController = [[UINavigationController alloc] initWithRootViewController:destinationMainController];
    self.tab = [[UITabBarController alloc] init];
    NSArray *arr = [NSArray arrayWithObjects:_menuViewController,_TakeBarController,_ActivityBarController,_DestinationBarController, nil];
    self.tab.viewControllers =arr; //
    self.tab.selectedIndex = 0;
    
    
    self.window.rootViewController =self.tab;

}


//- (void)scrollViewDidScroll:(UIScrollView *)scrollView{    CGFloat y = scrollView.contentOffset.y;        if (y >=5) {        [self hideTabBar];    }else{        [self showTabBar];    }}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
   
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
   
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
   
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
   
    
}

- (BOOL)shouldAutorotate
{
    return NO;
}
// 支持屏幕方向
- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}
// 默认屏幕旋转
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationPortrait;
}

@end

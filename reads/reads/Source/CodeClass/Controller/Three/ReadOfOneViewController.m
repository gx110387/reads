//
//  ReadOfOneViewController.m
//  reads
//
//  Created by lanou3g on 15/11/11.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "ReadOfOneViewController.h"

@interface ReadOfOneViewController ()<UMSocialUIDelegate,XSportLightDelegate>
@property(nonatomic,strong)ReadOfOneView *rv;
@property(nonatomic,strong) ReadOfOneModel *rm;
@property(nonatomic,assign)BOOL isflog;
@property (nonatomic, strong) UIButton *rightBtn;

@end

@implementation ReadOfOneViewController

-(void)viewWillAppear:(BOOL)animated
{
    
    
    [self showTabBar];
    AVUser *currentUser = [AVUser currentUser];
    if (currentUser != nil) {
        if (self.rm !=nil) {
            [self G_navitiaon];
        }
    }else
    {
        self.rv.myStart.image = [UIImage imageNamed:@"like_wl"];
    }
    
}
- (void)viewDidLoad {
    [super viewDidLoad];

    
    self.rv = [[ReadOfOneView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.view addSubview: self.rv];
    // Do any additional setup after loading the view from its nib.
    self.rv.backgroundColor =[UIColor colorWithRed:232/255.0 green:239/255.0 blue:185/255.0 alpha:1];
    self.rv.myStart.image = [UIImage imageNamed:@"like_wl"];
    self.rv.myImageBack.userInteractionEnabled = YES;
    self.rv.myImageBack.tag = 2;
    self.rv.myStart.userInteractionEnabled = YES;
    
    
    // 给图片设置手势,用来收藏
    UITapGestureRecognizer *tapHideImage=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(start:)];
    [self.rv.myStart addGestureRecognizer: tapHideImage];
    
    //保存图片
    
    UILongPressGestureRecognizer *tapSaveImage=[[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(Save:)];
    tapSaveImage.minimumPressDuration = 1.0;
    [self.rv.myImageBack addGestureRecognizer:tapSaveImage];
    // 单例方法,用来获取数据
    
 
    
    if (self.isStart  == YES ) {
        
        [tools G_getThreeDataInfoStart:self.ptime  passValue:^(NSMutableArray *array) {
            self.rm = array[0];
            [self G_navitiaon];
            self.rv.myVolLabel.text = self.rm.strHpTitle;
            [self.rv.myImageBack sd_setImageWithURL:[NSURL URLWithString:self.rm.strOriginalImgUrl] placeholderImage:bgPhoto];
            // 数组存放被切割的像素
            NSArray *pixel = [self.rm.strAuthor componentsSeparatedByString:@"&"];
            self.rv.myTitleLabel.text =   [pixel firstObject];
            self.rv.myAuthorLabel.text  = [pixel lastObject];
            NSString *s = [self.rm.strMarketTime substringToIndex:4];
            NSString *s2 = [self.rm.strMarketTime substringFromIndex:5];
            self.rv.myMonthLabel.text = [NSString stringWithFormat:@" %@\n %@",s2,s];
            self.rv.myContentLabel.text =[NSString stringWithFormat:@"    %@",self.rm.strContent];
            
        }];
        
    }else
    {
        self.rv.myImageBack.userInteractionEnabled = YES;
        // 给图片设置手势,用来跳转到下一页
        UITapGestureRecognizer *TapmMyStart=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(enter:)];
        [self.rv.myImageBack addGestureRecognizer: TapmMyStart];
        [tools G_getThreeDataInfo:^(NSMutableArray *array) {
            
           
            
            self.rm = array[0];
            [self G_navitiaon];
            self.rv.myVolLabel.text = self.rm.strHpTitle;
            [self.rv.myImageBack sd_setImageWithURL:[NSURL URLWithString:self.rm.strOriginalImgUrl] placeholderImage:bgPhoto];
            // 数组存放被切割的像素
            NSArray *pixel = [self.rm.strAuthor componentsSeparatedByString:@"&"];
            self.rv.myTitleLabel.text =   [pixel firstObject];
            self.rv.myAuthorLabel.text  = [pixel lastObject];
            NSString *s = [self.rm.strMarketTime substringToIndex:4];
            NSString *s2 = [self.rm.strMarketTime substringFromIndex:5];
            self.rv.myMonthLabel.text = [NSString stringWithFormat:@"%@\n%@",s2,s];
            self.rv.myContentLabel.text =[NSString stringWithFormat:@"    %@",self.rm.strContent];
            
            
            
            //////////////////////////
            if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"Xsport"]  isEqual: @(YES)]) {
                return;
            }
            XSportLight *sport = [[XSportLight alloc] init];
            
            
            sport.messageArray = @[@"单击图片...进入阅读",
                                   @"长按图片...保存或者分享图片"
                                   ];
            
            sport.rectArray = @[
                                [NSValue valueWithCGRect:CGRectMake(CGRectGetWidth(self.view.frame)/4,CGRectGetHeight(self.view.frame)/3, 50, 50)],
                                [NSValue valueWithCGRect:CGRectMake(CGRectGetWidth(self.view.frame)/2, CGRectGetHeight(self.view.frame)/2.5, 80, 80)],
                                ];
            sport.delegate = self;
            
            [self presentViewController:sport   animated:(YES) completion:nil];
            
           
            ///////////////////////////
            
            
        }];
    }
    
    //////////////////////////
    if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"Xsport1"]  isEqual: @(NO)]) {
        return;
    }
    XSportLight *sport = [[XSportLight alloc] init];
    
    
    sport.messageArray = @[@"划一下 进入阅读"
                           
                           ];
    
    sport.rectArray = @[
                        [NSValue valueWithCGRect:CGRectMake(CGRectGetWidth(self.view.frame)/3, CGRectGetHeight(self.view.frame)/2, 50, 50)]
                        ];
    sport.delegate = self;
    
    [self presentViewController:sport   animated:(YES) completion:nil];
    
    
    ///////////////////////////
    
}

-(void)rightBtnAction
{
    
    NSLog(@"gaoxing");
}
-(void)XSportLightClicked:(NSInteger)index
{
    
    [[NSUserDefaults standardUserDefaults]setBool:NO   forKey:@"Xsport1"];
    
 
    if (index == 1) {
       
        
       
    }
    if (index == 2) {
        [[NSUserDefaults standardUserDefaults]setBool:YES   forKey:@"Xsport"];
        
    }
}
gscroll
#pragma mark - 跳转到下一个页面
-(void)enter:(UITapGestureRecognizer *)sender
{
    DoLog(@">>>>><<<<%d",tools.num+1);
    [tools G_getThreeDataInfo:tools.num+1 passValue:^(NSMutableArray *array) {
        
        [self hideTabBar];
        DeailThreeViewController *deailVC = [[DeailThreeViewController alloc] init];
        deailVC.title = self.rm.strHpTitle;
        deailVC.G_dataArr = array;
        [self.navigationController pushViewController:deailVC animated:YES];
    }];
    
    
    
    // NSLog(@"跳转未做");
}

#pragma mark - 保存图片
-(void)Save:(UITapGestureRecognizer *)sender
{
    UIImageView *imageView=(UIImageView*)[sender.view viewWithTag:2];
    DoLog(@"nn");
    NSString *contentString = [NSString stringWithFormat:@"%@\n图片来源:\n%@",self.rm.strContent,self.rm.strAuthor];
    NSLog(@"%@",[tools getUserLogin]);
    NSString *NameString = [NSString string];
    if ([tools getUserLogin]==NULL) {
        NSLog(@"1");
        NameString =@"悦读新闻";
    }else
    {
        NSLog(@"2");
          NameString =[tools getUserLogin];
    }
    
    
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"mqq://"]]) {
        
        
        if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"weixin://"]]) {
            // 如果微信存在 那么就执行这个方法, (过)
            [UIAlertController showAlertInViewController:self
                                               withTitle:@"提示"
                                                 message:@"是否保存图片到相册" cancelButtonTitle:@"取消" destructiveButtonTitle:@"确定" otherButtonTitles:@[@"分享图片到微博", @"分享图片到QQ空间" , @"分享图片到微信好友",@"分享图片到微信空间"] tapBlock:^(UIAlertController * _Nonnull controller, UIAlertAction * _Nonnull action, NSInteger buttonIndex) {
                                                     
                                                     if (buttonIndex == controller.cancelButtonIndex) {
                                                         
                                                     } else if (buttonIndex == controller.destructiveButtonIndex) {
                                                         
                                                         UIImageWriteToSavedPhotosAlbum(imageView.image, nil, nil, nil);
                                                         [AlertShow alertShowWithContent:@"图片保存成功" Seconds:1.f];
                                                         
                                                         
                                                     }else if (buttonIndex >= controller.firstOtherButtonIndex) {
                                                         
                                                         // NSLog(@"Other Button Index %ld", (long)buttonIndex - controller.firstOtherButtonIndex);
                                                         
                                                         if (((long)buttonIndex - controller.firstOtherButtonIndex)== 0) {
                                                             
                                                             [[UMSocialControllerService defaultControllerService] setShareText:contentString shareImage:imageView.image socialUIDelegate:self];        //设置分享内容和回调对象
                                                             [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToSina].snsClickHandler(self,[UMSocialControllerService defaultControllerService],YES);
                                                             
                                                         }else if(((long)buttonIndex - controller.firstOtherButtonIndex)== 1)
                                                         {
//                                                             [UMSocialData defaultData].extConfig.qqData.title =[NSString stringWithFormat:@"QQ_%@向你分享",[tools getUserLogin]];
//                                                             [UMSocialData defaultData].extConfig.qqData.url = gUrl;
//                                                             [[UMSocialDataService defaultDataService]  postSNSWithTypes:@[UMShareToQQ] content:contentString image:imageView.image location:nil urlResource:nil presentedController:self completion:^(UMSocialResponseEntity *response){
//                                                                 if (response.responseCode == UMSResponseCodeSuccess) {
//                                                                     NSLog(@"分享成功！");
//                                                                 }
//                                                             }];
                                                             [UMSocialData defaultData].extConfig.qzoneData.title = [NSString stringWithFormat:@"Qzone_%@向你分享",NameString] ;
                                                             [UMSocialData defaultData].extConfig.qzoneData.url = gUrl;
                                                             [[UMSocialDataService defaultDataService]  postSNSWithTypes:@[UMShareToQzone] content:contentString image:imageView.image location:nil urlResource:nil presentedController:self completion:^(UMSocialResponseEntity *response){
                                                                 if (response.responseCode == UMSResponseCodeSuccess) {
                                                                     NSLog(@"分享成功！");
                                                                 }
                                                             }];

                                                             
                                                         }
                                                         else if(((long)buttonIndex - controller.firstOtherButtonIndex)== 2)
                                                         {
                                                             [UMSocialData defaultData].extConfig.wechatSessionData.title = [NSString stringWithFormat:@"微信好友_%@向你分享",NameString];
                                                             [UMSocialData defaultData].extConfig.wechatSessionData.url = gUrl;
                                                             [[UMSocialDataService defaultDataService]  postSNSWithTypes:@[UMShareToWechatSession] content:contentString image:imageView.image location:nil urlResource:nil presentedController:self completion:^(UMSocialResponseEntity *response){
                                                                 if (response.responseCode == UMSResponseCodeSuccess) {
                                                                     NSLog(@"分享成功！");
                                                                 }
                                                             }];
                                                         }else if(((long)buttonIndex - controller.firstOtherButtonIndex)== 3)
                                                         {
                                                             
                                                             // [UMSocialData defaultData].extConfig.wechatTimelineData.title = [NSString stringWithFormat:@"微信朋友圈_%@向你分享",NameString];
                                                             [UMSocialData defaultData].extConfig.wechatTimelineData.url = gUrl;
                                                             [[UMSocialDataService defaultDataService]  postSNSWithTypes:@[UMShareToWechatTimeline] content:contentString image:[UIImage imageNamed:@"myheadimage"]  location:nil urlResource:nil presentedController:self completion:^(UMSocialResponseEntity *response){
                                                                 if (response.responseCode == UMSResponseCodeSuccess) {
                                                                     NSLog(@"分享成功！");
                                                                 }
                                                             }];
                                                             
                                                         }
                                                         
                                                         
                                                     }
                                                     
                                                     
                                                 }];
            
        }
        else
        {
            // 微信好友改成腾讯微博 (过)
            
            [UIAlertController showAlertInViewController:self
                                               withTitle:@"提示"
                                                 message:@"是否保存图片到相册" cancelButtonTitle:@"取消" destructiveButtonTitle:@"确定" otherButtonTitles:@[@"分享图片到微博",@"分享图片到QQ空间"] tapBlock:^(UIAlertController * _Nonnull controller, UIAlertAction * _Nonnull action, NSInteger buttonIndex) {
                                                     
                                                     if (buttonIndex == controller.cancelButtonIndex) {
                                                         
                                                     } else if (buttonIndex == controller.destructiveButtonIndex) {
                                                         
                                                         UIImageWriteToSavedPhotosAlbum(imageView.image, nil, nil, nil);
                                                         [AlertShow alertShowWithContent:@"图片保存成功" Seconds:1.f];
                                                         
                                                         
                                                     }else if (buttonIndex >= controller.firstOtherButtonIndex) {
                                                         
                                                         // NSLog(@"Other Button Index %ld", (long)buttonIndex - controller.firstOtherButtonIndex);
                                                         
                                                         if (((long)buttonIndex - controller.firstOtherButtonIndex)== 0) {
                                                             
                                                             [[UMSocialControllerService defaultControllerService] setShareText:contentString shareImage:imageView.image socialUIDelegate:self];        //设置分享内容和回调对象
                                                             [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToSina].snsClickHandler(self,[UMSocialControllerService defaultControllerService],YES);
                                                             
                                                         }else if(((long)buttonIndex - controller.firstOtherButtonIndex)== 1)
                                                         {
                                                             [UMSocialData defaultData].extConfig.qzoneData.title = [NSString stringWithFormat:@"Qzone_%@向你分享",NameString] ;
                                                             [UMSocialData defaultData].extConfig.qzoneData.url = gUrl;
                                                             [[UMSocialDataService defaultDataService]  postSNSWithTypes:@[UMShareToQzone] content:contentString image:imageView.image location:nil urlResource:nil presentedController:self completion:^(UMSocialResponseEntity *response){
                                                                 if (response.responseCode == UMSResponseCodeSuccess) {
                                                                     NSLog(@"分享成功！");
                                                                 }
                                                             }];
                                                             
                                                         }
                                                         
                                                     }
                                                 }];
        }
    }
    else
    {
        // 如果QQ不存在 但是微信存在 (过)
        
        if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"weixin://"]]) {
            
            
            [UIAlertController showAlertInViewController:self
                                               withTitle:@"提示"
                                                 message:@"是否保存图片到相册" cancelButtonTitle:@"取消" destructiveButtonTitle:@"确定" otherButtonTitles:@[@"分享图片到微博",@"分享图片到微信好友",@"分享图片到微信空间"] tapBlock:^(UIAlertController * _Nonnull controller, UIAlertAction * _Nonnull action, NSInteger buttonIndex) {
                                                     
                                                     if (buttonIndex == controller.cancelButtonIndex) {
                                                         
                                                     } else if (buttonIndex == controller.destructiveButtonIndex) {
                                                         
                                                         UIImageWriteToSavedPhotosAlbum(imageView.image, nil, nil, nil);
                                                         [AlertShow alertShowWithContent:@"图片保存成功" Seconds:1.f];
                                                         
                                                         
                                                     }else if (buttonIndex >= controller.firstOtherButtonIndex) {
                                                         
                                                         // NSLog(@"Other Button Index %ld", (long)buttonIndex - controller.firstOtherButtonIndex);
                                                         
                                                         if (((long)buttonIndex - controller.firstOtherButtonIndex)== 0) {
                                                             
                                                             [[UMSocialControllerService defaultControllerService] setShareText:contentString shareImage:imageView.image socialUIDelegate:self];        //设置分享内容和回调对象
                                                             [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToSina].snsClickHandler(self,[UMSocialControllerService defaultControllerService],YES);
                                                             
                                                         }else if(((long)buttonIndex - controller.firstOtherButtonIndex)== 1)
                                                         {
                                                             [UMSocialData defaultData].extConfig.wechatSessionData.title = [NSString stringWithFormat:@"微信好友_%@向你分享",NameString];
                                                             [UMSocialData defaultData].extConfig.wechatSessionData.url = gUrl;
                                                             [[UMSocialDataService defaultDataService]  postSNSWithTypes:@[UMShareToWechatSession] content:contentString image:imageView.image location:nil urlResource:nil presentedController:self completion:^(UMSocialResponseEntity *response){
                                                                 if (response.responseCode == UMSResponseCodeSuccess) {
                                                                     NSLog(@"分享成功！");
                                                                 }
                                                             }];
                                                             
                                                         }else if(((long)buttonIndex - controller.firstOtherButtonIndex)== 2)
                                                         {
                                                             //[UMSocialData defaultData].extConfig.wechatTimelineData.title = [NSString stringWithFormat:@"微信朋友圈_%@向你分享",NameString];
                                                             [UMSocialData defaultData].extConfig.wechatTimelineData.url = gUrl;
                                                             [[UMSocialDataService defaultDataService]  postSNSWithTypes:@[UMShareToWechatTimeline] content:contentString image:[UIImage imageNamed:@"myheadimage"]  location:nil urlResource:nil presentedController:self completion:^(UMSocialResponseEntity *response){
                                                                 if (response.responseCode == UMSResponseCodeSuccess) {
                                                                     NSLog(@"分享成功！");
                                                                 }
                                                             }];
                                                             
                                                             
                                                         }
                                                         
                                                     }
                                                 }];
            
            
        }
        else
        {
            
            [UIAlertController showAlertInViewController:self
                                               withTitle:@"提示"
                                                 message:@"是否保存图片到相册" cancelButtonTitle:@"取消" destructiveButtonTitle:@"确定" otherButtonTitles:@[@"分享图片到微博"] tapBlock:^(UIAlertController * _Nonnull controller, UIAlertAction * _Nonnull action, NSInteger buttonIndex) {
                                                     
                                                     if (buttonIndex == controller.cancelButtonIndex) {
                                                         
                                                     } else if (buttonIndex == controller.destructiveButtonIndex) {
                                                         
                                                         UIImageWriteToSavedPhotosAlbum(imageView.image, nil, nil, nil);
                                                         [AlertShow alertShowWithContent:@"图片保存成功" Seconds:1.f];
                                                         
                                                         
                                                     }else if (buttonIndex >= controller.firstOtherButtonIndex) {
                                                         
                                                         // NSLog(@"Other Button Index %ld", (long)buttonIndex - controller.firstOtherButtonIndex);
                                                         
                                                         if (((long)buttonIndex - controller.firstOtherButtonIndex)== 0) {
                                                             
                                                             [[UMSocialControllerService defaultControllerService] setShareText:contentString shareImage:imageView.image socialUIDelegate:self];        //设置分享内容和回调对象
                                                             [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToSina].snsClickHandler(self,[UMSocialControllerService defaultControllerService],YES);
                                                             
                                                         }
                                                     }
                                                 }];
        }
        
        
    }
    
}
-(void)didSelectSocialPlatform:(NSString *)platformName withSocialData:(UMSocialData *)socialData
{
    if (platformName == UMShareToSina) {
        socialData.shareText = [NSString stringWithFormat:@"%@\n图片来源%@",self.rm.strContent,self.rm.strAuthor];
    }
    else{
        socialData.shareText = [NSString stringWithFormat:@"%@\n图片来源%@",self.rm.strContent,self.rm.strAuthor];
    }
}

-(void)didFinishGetUMSocialDataInViewController:(UMSocialResponseEntity *)response
{
    
    if (response.responseCode == UMSResponseCodeSuccess) {
        NSLog(@"success");
        NSLog(@"share to sns name is %@",[[response.data allKeys] objectAtIndex:0]);
        
        [AlertShow alertShowWithContent:@"分享成功" Seconds:1.f];
        
        
        
        
        // NSLog(@"success");
    }
    
}
#pragma mark - 收藏
-(void)start:(UITapGestureRecognizer *)sender
{
    
    DoLog(@">>>>><<<<%ld===%@",tools.num+1,self.rm.strMarketTime);
    // NSLog(@" %@== ",[tools setNumToStringDate:tools.num+1]);
    
    
    
    
    
    
    DoLog(@"收藏");
    
    
    AVUser *currentUser = [AVUser currentUser];
    if (currentUser != nil) {
        DoLog(@"已登录");
        // 可以收藏
        
        
        [tools G_setReads:self.rm.strAuthor ptime:self.rm.strMarketTime url:self.rm.strOriginalImgUrl];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)( 1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self G_navitiaon];
            
        });
        
        
    } else {
        DoLog(@"未登录");
        [AlertShow alertShowWithContent:@"请先登录" Seconds:0.5f];
    }
    
}

-(void)G_navitiaon
{
    AVUser *currentUser = [AVUser currentUser];
    if (currentUser != nil) {
        [tools G_isReads:self.rm.strMarketTime isflag:^(BOOL isflag) {
            self.isflog = isflag ;
            
            if(self.isflog == YES)
            {
                self.rv.myStart.image = [UIImage imageNamed:@"like_sl"];
                return ;
            }else
            {
                self.rv.myStart.image = [UIImage imageNamed:@"like_wl"];
            }
            self.rv.myStart.image = [UIImage imageNamed:@"like_wl"];
            
        }];
        
    }
    else
    {
        DoLog(@"未登录");
        
        
    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end

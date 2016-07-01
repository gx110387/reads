//
//  UserViewController.m
//  reads
//
//  Created by lanou3g on 15/11/3.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "UserViewController.h"

@interface UserViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UserViewDelegate,UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,CoreStatusProtocol>
//@property(nonatomic,strong)UITableView  *tableView;
@property(nonatomic,strong)UICollectionView *collectionView;
@property (nonatomic, strong) UIImageView *imageBG;
@property(nonatomic,strong) AVUser *currentUser;
@property(nonatomic,assign)BOOL issavePhoto;
@property(nonatomic,strong)UIImage *G_myImage;
@property(nonatomic,strong) UILabel *wifiState;

@property(nonatomic,strong)UserView *userView;
@end

@implementation UserViewController
static NSString * const reuseIdentifier = @"cell";

-(void)viewWillAppear:(BOOL)animated
{
    
    [self isLogin];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor cyanColor];
    self.navigationItem.title = @"我的";
    
    self.navigationItem.rightBarButtonItem  = [[UIBarButtonItem alloc] initWithTitle:@"..." style:UIBarButtonItemStyleDone target:self action:@selector(rightBarButtonItem:)];
    
    [self createUI];
    [self createWifi];
    [self setPhone];
      [self.collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
}
- (void)rightBarButtonItem:(UIButton *)sender {
    ShareView *shareView = [ShareView createViewFromNib];
    
    
/*
    // // 1 ,都存在
    //    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"mqq://"]] && [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"weixin://"]]) {
    //       // 如果都 存在 那么就执行这个方法,添加腾讯微博
    //         [shareView.OtherShare setImage:[UIImage imageNamed:@"UMS_tencent_icon"] forState:UIControlStateNormal];
    //         [shareView.OtherShare setTitle: @"腾讯微博" forState:UIControlStateNormal];
    //         // 如果都不存在 那么就执行这个方法,
    //    }else{
    //         [shareView.QQZone setImage:[UIImage imageNamed:@"UMS_tencent_icon"] forState:UIControlStateNormal];
    //         [shareView.QQZone setTitle: @"腾讯微博" forState:UIControlStateNormal];
    //
    //        [shareView.QQ  setImage:[UIImage imageNamed:@"UMS_sms_icon"] forState:UIControlStateNormal];
    //        [shareView.QQ  setTitle: @"短信" forState:UIControlStateNormal];
    //
    //
    //        [shareView.WeChat   setImage:[UIImage imageNamed:@"UMS_email_icon"] forState:UIControlStateNormal];
    //        [shareView.WeChat   setTitle: @"邮件" forState:UIControlStateNormal];
    //
    //      //  shareView.QQ.hidden = YES; UMS_sms_icon
    //       // shareView.QQZone.hidden = YES;
    //       // shareView.WeChat.hidden = YES;
    //       shareView.WeChatZone.hidden = YES;
    //        shareView.OtherShare.hidden = YES;
    //        NSLog(@"no---");
    //    }
  */
    // 2
    
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"mqq://"]]) {
        shareView.OtherShare.hidden = NO;
        // 如果qq存在 那么就判断微信是否存在
        if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"weixin://"]]) {
            // 如果微信存在 那么就执行这个方法, (过)
            [shareView.OtherShare setImage:[UIImage imageNamed:@"UMS_tencent_icon"] forState:UIControlStateNormal];
            [shareView.OtherShare setTitle: @"腾讯微博" forState:UIControlStateNormal];
            
        }else{
            // 微信好友改成腾讯微博 (过)
            [shareView.WeChat   setImage:[UIImage imageNamed:@"UMS_tencent_icon"] forState:UIControlStateNormal];
            [shareView.WeChat   setTitle: @"腾讯微博" forState:UIControlStateNormal];
            [shareView.WeChatZone   setImage:[UIImage imageNamed:@"UMS_sms_icon"] forState:UIControlStateNormal];
            [shareView.WeChatZone   setTitle: @"短信" forState:UIControlStateNormal];
            [shareView.OtherShare   setImage:[UIImage imageNamed:@"UMS_email_icon"] forState:UIControlStateNormal];
            [shareView.OtherShare   setTitle: @"邮件" forState:UIControlStateNormal];
            
        }
    }else{
        // 如果QQ不存在 但是微信存在 (过)
        shareView.OtherShare.hidden = NO;
        if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"weixin://"]]) {
            
            [shareView.QQ   setImage:[UIImage imageNamed:@"btn_share_weixin"] forState:UIControlStateNormal];
            [shareView.QQ   setTitle: @"微信好友" forState:UIControlStateNormal];
            [shareView.QQZone   setImage:[UIImage imageNamed:@"btn_share_pengyouquan"] forState:UIControlStateNormal];
            [shareView.QQZone   setTitle: @"微信空间" forState:UIControlStateNormal];
            [shareView.WeChat   setImage:[UIImage imageNamed:@"UMS_tencent_icon"] forState:UIControlStateNormal];
            [shareView.WeChat   setTitle: @"腾讯微博" forState:UIControlStateNormal];
            [shareView.WeChatZone   setImage:[UIImage imageNamed:@"UMS_sms_icon"] forState:UIControlStateNormal];
            [shareView.WeChatZone   setTitle: @"短信" forState:UIControlStateNormal];
            [shareView.OtherShare   setImage:[UIImage imageNamed:@"UMS_email_icon"] forState:UIControlStateNormal];
            [shareView.OtherShare   setTitle: @"邮件" forState:UIControlStateNormal];
            
            
            
        }else {
            
            [shareView.QQZone setImage:[UIImage imageNamed:@"UMS_tencent_icon"] forState:UIControlStateNormal];
            [shareView.QQZone setTitle: @"腾讯微博" forState:UIControlStateNormal];
            
            [shareView.QQ  setImage:[UIImage imageNamed:@"UMS_sms_icon"] forState:UIControlStateNormal];
            [shareView.QQ  setTitle: @"短信" forState:UIControlStateNormal];
            
            
            [shareView.WeChat   setImage:[UIImage imageNamed:@"UMS_email_icon"] forState:UIControlStateNormal];
            [shareView.WeChat   setTitle: @"邮件" forState:UIControlStateNormal];
            
            
            shareView.WeChatZone.hidden = YES;
            shareView.OtherShare.hidden = YES;
            
            
        }
        
        
        
        
        
    }
    
    
    
    TYAlertController *alertController = [TYAlertController alertControllerWithAlertView:shareView preferredStyle:TYAlertControllerStyleAlert];
    
    
    
    
    
    // blur effect
    [alertController setBlurEffectWithView:self.view];
    
    //alertController.alertViewOriginY = 60;
    [self presentViewController:alertController animated:YES completion:nil];
}

-(void)isLogin
{
    
    self.currentUser = [AVUser currentUser];
    if ( self.currentUser != nil) {
        
        // 允许用户使用应用
        [self.userView.G_UserStartLabel setHidden:NO];
        [self.userView.G_UserImage setHidden:NO];
        [self.userView.G_startimageView setHidden:NO];
        [self.userView.G_jiluimageView setHidden: YES];
        [self.userView.G_psdimageView setHidden:NO];
        [self.userView.G_UserLoginOrRegistButton setHidden:YES];
        NSLog(@"有");
        self.navigationItem.title = [tools getUserLogin];
        // 网络状态
        
  
        //已登录 显示 图片和收藏
        //  图片
        self.userView.G_UserImage.frame = CGRectMake( CGRectGetWidth(self.userView.frame)/2-50, CGRectGetHeight(self.userView.frame)/2-90, 100, 100);
        self.userView.G_UserImage.layer.cornerRadius = CGRectGetHeight(self.userView.G_UserImage.frame)/2;
        self.userView.G_UserImage.userInteractionEnabled = YES;
        self.userView.G_UserImage.layer.masksToBounds = YES;
        self.userView.G_UserImage.backgroundColor = [UIColor cyanColor];
        self.userView.G_UserImage.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
        //我的个性签名
        self.userView.G_UserStartLabel.frame = CGRectMake(CGRectGetMinX(self.userView.G_UserImage.frame)-50, CGRectGetMaxY(self.userView.G_UserImage.frame)+10, 200, 20);
        // self.userView.G_UserStartLabel.backgroundColor  = [UIColor colorWithRed:251/255.0 green:247/255.0 blue:237/255.0 alpha:1];
        self.userView.G_UserStartLabel.backgroundColor  = [UIColor clearColor];
        self.userView.G_UserStartLabel.text =[tools getUserLabel];
        self.userView.G_UserStartLabel.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
        self.userView.G_UserStartLabel.delegate = self;
        
        // 我的收藏
        self.userView.G_startimageView.frame = CGRectMake(0, CGRectGetMaxY(self.userView.G_UserStartLabel.frame), CGRectGetWidth(self.view.frame)/3, CGRectGetHeight(self.userView.frame)-CGRectGetMaxY(self.userView.G_UserStartLabel.frame));
        
        
        // 浏览记录
        self.userView.G_jiluimageView.frame = CGRectMake(CGRectGetMaxX(self.userView.G_startimageView.frame), CGRectGetMinY(self.userView.G_startimageView.frame), CGRectGetWidth(self.view.frame)/3,CGRectGetHeight(self.userView.G_startimageView.frame));
        
        // 修改密码
        self.userView.G_psdimageView.frame = CGRectMake(CGRectGetMaxX(self.userView.G_jiluimageView.frame), CGRectGetMinY(self.userView.G_startimageView.frame), CGRectGetWidth(self.userView.G_startimageView.frame),CGRectGetHeight(self.userView.G_startimageView.frame));
        
        
        // NSLog(@"%d",self.issavePhoto);
        if (self.issavePhoto ==YES) {
            NSLog(@"怎么回事%@",self.G_myImage);
            
            [self G_setImageOnline:self.G_myImage];
            self.issavePhoto = NO;
        }
        
        AVFile *file =   [self.currentUser objectForKey:@"photo"];
        NSLog(@"%d",[[[NSUserDefaults standardUserDefaults] valueForKey:[NSString stringWithFormat:@"%@phtoto",[tools getUserLogin]]] intValue]);
        
        if ([[[NSUserDefaults standardUserDefaults] valueForKey:[NSString stringWithFormat:@"%@phtoto",[tools getUserLogin]]] intValue]!=1) {
            NSLog(@">>>>>>>>>%@",[file valueForKey:@"url"]);
            [self.userView.G_UserImage sd_setImageWithURL:[NSURL URLWithString:[file valueForKey:@"url"]] placeholderImage:[UIImage imageNamed:@"picholder"]];
            [[NSUserDefaults standardUserDefaults]setBool:YES forKey:[NSString stringWithFormat:@"%@phtoto",[tools getUserLogin]]];
        }
        
        
        
        NSIndexSet *indexSet=[[NSIndexSet alloc]initWithIndex:0];
        [self.collectionView reloadSections:indexSet];
       // [self.collectionView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
    } else {
        //缓存用户对象为空时，可打开用户注册界面…
        NSLog(@"没有 ");
        
        self.navigationItem.title = @"我的";
        //已注销 显示登陆
        
        self.userView.G_UserLoginOrRegistButton.frame = CGRectMake(CGRectGetWidth(self.userView.frame)/2-50, CGRectGetHeight(self.userView.frame)/2-15, g100, 30);
        self.userView.G_UserLoginOrRegistButton.backgroundColor = [UIColor redColor];
        self.userView.G_jiluimageView.frame = CGRectMake(CGRectGetWidth(self.view.frame)/3,(CGRectGetHeight(self.userView.frame)- CGRectGetMaxY(self.userView.G_UserLoginOrRegistButton.frame))/2-25+CGRectGetMaxY(self.userView.G_UserLoginOrRegistButton.frame), CGRectGetWidth(self.view.frame)/3,50);
        
        [self.userView.G_UserStartLabel setHidden:YES];
        [self.userView.G_UserImage setHidden:YES];
        [self.userView.G_startimageView setHidden:YES];
        [self.userView.G_jiluimageView setHidden: YES];
        [self.userView.G_psdimageView setHidden:YES];
        [self.userView.G_UserLoginOrRegistButton setHidden:NO];
        
    }
    
}

-(void)createWifi
{
     [CoreStatus beginNotiNetwork:self];
     NSString * statusString = [CoreStatus currentNetWorkStatusString];
   self.wifiState = [[UILabel alloc] init];
    _wifiState.frame = CGRectMake(CGRectGetWidth(self.userView.frame)-CGRectGetWidth(self.userView.frame)/2, 0,CGRectGetWidth(self.userView.frame)/2-10, 30);
    _wifiState.backgroundColor = [UIColor clearColor];
    _wifiState.font = [UIFont systemFontOfSize:14];
    _wifiState.text=[NSString stringWithFormat:@"当前的网络状态是:%@",statusString];
    
    _wifiState.textAlignment = NSTextAlignmentRight;
    [self.userView addSubview:_wifiState];
    
}
-(void)coreNetworkChangeNoti:(NSNotification *)noti{
    
     NSString * statusString = [CoreStatus currentNetWorkStatusString];
      _wifiState.text=[NSString stringWithFormat:@"当前的网络状态是:%@",statusString];
    
    [_wifiState.layer transitionWithAnimType:TransitionAnimTypeRamdom subType:TransitionSubtypesFromRamdom curve:TransitionCurveRamdom duration:.5f];
    
}

- (void)createUI{
    
//    self.tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped];
//    self.tableView.frame = CGRectMake(0, 0,  CGRectGetWidth( self.view.frame), CGRectGetHeight(self.view.frame)-66 )  ;
//    self.tableView.delegate = self;
//    self.tableView.dataSource = self;
//    [self.view addSubview: self.tableView ];
//    
//    self.tableView.contentInset = UIEdgeInsetsMake(200, 0, 0, 0);
    
  
    [self G_setCollection];
    _imageBG = [[UIImageView alloc]init];
    _imageBG.frame = CGRectMake(0, -200, [UIScreen mainScreen].bounds.size.width, 200);
    
    
    _imageBG.image  = [UIImage imageNamed:@"QingTian"];
    [self.collectionView addSubview:_imageBG];
    
    _userView = [[UserView alloc]init];
    _userView.backgroundColor=[UIColor clearColor];
    _userView.frame=CGRectMake(0, -200, [UIScreen mainScreen].bounds.size.width, 200);
    
    
    [self.collectionView addSubview:_userView];
    self.userView.delegate = self;
    
}

#pragma mark -初始化collection
-(void)G_setCollection
{
    
    // flowlayout 负责布局
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    // 每个cell的大小
    flowLayout.itemSize = CGSizeMake(CGRectGetWidth([UIScreen mainScreen].bounds)/2.2, g100);
    // 最小的间距(item之间)
    flowLayout.minimumInteritemSpacing = 5;
    // 最小的行距
    flowLayout.minimumLineSpacing = 10;
    // 设置他的滑动方向
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    // cell 的范围 ( 上, 做, 下, 右);
    flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    
    
    
    
    //  UICollectionView 继承于scrollview 跟tableview非常类似
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:flowLayout];
    self.collectionView.frame = CGRectMake(0, 0,  CGRectGetWidth( self.view.frame), CGRectGetHeight(self.view.frame)-66 )  ;
   self.collectionView.backgroundColor = gbgcolor;
    [self.view addSubview:self.collectionView];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    self.collectionView.contentInset = UIEdgeInsetsMake(g200, 0, 0, 0);
}
-(void)setPhone
{
    self.userView.G_UserImage.userInteractionEnabled = YES;
    UITapGestureRecognizer *singleTap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(UserPhontAction)];
    
    [  self.userView.G_UserImage addGestureRecognizer:singleTap1];
}

-(void)UserPhontAction
{
    
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
        
    {
        [UIAlertController showAlertInViewController:self withTitle:@"提示"
                                             message:@"选择"
                                   cancelButtonTitle:@"取消"
                              destructiveButtonTitle:@"拍照"
                                   otherButtonTitles:@[@"从相册选择"]
                                            tapBlock:^(UIAlertController * _Nonnull controller, UIAlertAction * _Nonnull action, NSInteger buttonIndex) {
                                                
                                                
                                                if (buttonIndex == controller.cancelButtonIndex) {
                                                    
                                                    DoLog(@"1");
                                                }else if (buttonIndex == controller.destructiveButtonIndex)
                                                {
                                                    DoLog(@"2");
                                                    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
                                                    
                                                    imagePickerController.delegate = self;
                                                    
                                                    imagePickerController.allowsEditing = YES;
                                                    
                                                    imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
                                                    
                                                    [self presentViewController:imagePickerController animated:YES completion:nil];
                                                    
                                                }else if(buttonIndex >= controller.firstOtherButtonIndex)
                                                {
                                                    DoLog(@"3");
                                                    
                                                    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
                                                    
                                                    imagePickerController.delegate = self;
                                                    
                                                    imagePickerController.allowsEditing = YES;
                                                    
                                                    imagePickerController.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
                                                    
                                                    [self presentViewController:imagePickerController animated:YES completion:nil];
                                                }
                                                
                                            }];
    }else
    {
        
        [UIAlertController showAlertInViewController:self withTitle:@"提示"
                                             message:@"选择"
                                   cancelButtonTitle:@"取消"
                              destructiveButtonTitle:@"从相册选择"
                                   otherButtonTitles:nil
                                            tapBlock:^(UIAlertController * _Nonnull controller, UIAlertAction * _Nonnull action, NSInteger buttonIndex) {
                                                
                                                
                                                if (buttonIndex == controller.cancelButtonIndex) {
                                                    DoLog(@"1");
                                                    
                                                }else if (buttonIndex == controller.destructiveButtonIndex)
                                                {
                                                    DoLog(@"2");
                                                    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
                                                    
                                                    imagePickerController.delegate = self;
                                                    
                                                    imagePickerController.allowsEditing = YES;
                                                    
                                                    imagePickerController.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
                                                    
                                                    [self presentViewController:imagePickerController animated:YES completion:nil];
                                                    
                                                }
                                                
                                            }];
    }
    
    //
    //    UIActionSheet *sheet;
    //
    //    // 判断是否支持相机
    //
    //    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    //
    //    {
    //        sheet  = [[UIActionSheet alloc] initWithTitle:@"选择" delegate:self cancelButtonTitle:nil destructiveButtonTitle:@"取消" otherButtonTitles:@"拍照",@"从相册选择", nil];
    //
    //    }
    //
    //    else {
    //
    //        sheet = [[UIActionSheet alloc] initWithTitle:@"选择" delegate:self cancelButtonTitle:nil destructiveButtonTitle:@"取消" otherButtonTitles:@"从相册选择", nil];
    //
    //    }
    //
    //    sheet.tag = 255;
    //
    //    [sheet showInView:self.view];
    
    
}
//点击Cancel按钮后执行方法
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    self.issavePhoto =NO;
    [self.navigationController dismissViewControllerAnimated:YES completion:nil ];
}
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo
{
    self.userView.G_UserImage.image = image;
    self.issavePhoto = YES;
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    self.G_myImage = image;
    
    
}
#pragma mark 把选取的在照片存在网上
-(void)G_setImageOnline:(UIImage *)img
{
    AVUser *uer = [AVUser currentUser];
    //  NSLog(@"%@",uer);
    NSData *imageData = UIImagePNGRepresentation(img);
    AVFile *imageFile = [AVFile fileWithName:[tools getUserLogin] data:imageData];
    [imageFile save];
    [uer setObject:imageFile forKey:@"photo"];
    
    [uer saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            NSLog(@" 上传成功");
            
        }else
        {
            //
            NSLog(@" 上传失败");
            
        }
    }];
    
}
#pragma mark - 登录
-(void)loginButton
{
    
    NSLog(@"登录");
    
    LoginViewController *loginVC = [[LoginViewController alloc] init];
    
    __block UserViewController * userVC = self;
    
    loginVC.mblock = ^(UserLoginModel *u){
        
        userVC.navigationItem.title = u.username;
        [userVC.userView.G_UserImage setHidden:NO];
        [userVC.userView.G_UserStartLabel setHidden:NO];
        [userVC.userView.G_UserLoginOrRegistButton setHidden:YES];
        
    };
    UINavigationController *loginNC = [[UINavigationController alloc] initWithRootViewController:loginVC];
    
    [self.navigationController presentViewController:loginNC animated:YES completion:nil];
    
    
}
#pragma mark -浏览记录
-(void)jilu
{
    NSLog(@"浏览记录");
}
#pragma mark -我的收藏
-(void)myStart
{
    NSLog(@"我的收藏");
    StartViewController * aboutUSVC = [[StartViewController alloc] init];
    UINavigationController *aboutUsNc = [[UINavigationController alloc] initWithRootViewController:aboutUSVC];
    [self.navigationController presentViewController:aboutUsNc animated:YES completion:nil];
    
    
    
}
#pragma mark -修改密码
-(void)psdXiuGai
{
    NSLog(@"修改密码");
    restartPsdViewController * aboutUSVC = [[restartPsdViewController alloc] init];
    UINavigationController *aboutUsNc = [[UINavigationController alloc] initWithRootViewController:aboutUSVC];
    [self.navigationController presentViewController:aboutUsNc animated:YES completion:nil];
    
    
    
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    CGFloat offsetY = scrollView.contentOffset.y ;
    
    if (offsetY <-g200) {
        CGRect frame = _imageBG.frame;
        frame.origin.y = offsetY;
        frame.size.height =  -offsetY;
        _imageBG.frame = frame;
        
    }
    
    if (offsetY >=5) {
        [self hideTabBar];
    }else{
        [self showTabBar];
    }
    
}
- (void)showTabBar{
    
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    delegate.tab.tabBar.hidden = NO;
}
- (void)hideTabBar {
    
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    delegate.tab.tabBar.hidden = YES;
    
}


- (void)keyboardWillShow:(NSNotification *)noti
{
    //键盘输入的界面调整
    //键盘的高度
    float height = 216.0;
    CGRect frame = self.view.frame;
    frame.size = CGSizeMake(frame.size.width, frame.size.height - height);
    [UIView beginAnimations:@"Curl"context:nil];//动画开始
    [UIView setAnimationDuration:0.30];
    [UIView setAnimationDelegate:self];
    [self.collectionView setFrame:frame];
    [UIView commitAnimations];
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    // When the user presses return, take focus away from the text field so that the keyboard is dismissed.
    NSTimeInterval animationDuration = 0.30f;
    float height = 216.0;
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    CGRect rect = CGRectMake(0.0f, 0.0f, self.collectionView.frame.size.width, self.collectionView.frame.size.height + height);
    self.collectionView.frame = rect;
    [UIView commitAnimations];
    if (self.userView.G_UserStartLabel.text.length <12) {
        [tools setUserLabel:self.userView.G_UserStartLabel.text];
        [textField resignFirstResponder];
        
        return YES;
    }else
    {
        [AlertShow alertShowWithContent:@"你输入的内容有点多,10字之内~" Seconds:1.5f];
        return NO;
    }
    
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
   
    CGRect frame = textField.frame;
    int offset = frame.origin.y + 32 - (self.collectionView.frame.size.height - 216.0);//键盘高度216
    NSTimeInterval animationDuration = 0.30f;
    [UIView beginAnimations:@"ResizeForKeyBoard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    float width = self.collectionView.frame.size.width;
    float height = self.collectionView.frame.size.height;
    if(offset > 0)
    {
        CGRect rect = CGRectMake(0.0f, -offset,width,height);
        self.collectionView.frame = rect;
    }
    [UIView commitAnimations];
    
}
//-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    self.currentUser = [AVUser currentUser];
//    if (self.currentUser !=nil) {
//        
//        
//        return 5;
//    }else
//    {
//        
//        return 4;
//    }
//}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    self.currentUser = [AVUser currentUser];
    if (self.currentUser !=nil) {
        
        
     
        return 5;
    }else
    {
        
        return 4;
    }

    
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
       CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
     cell .myImage.frame =CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds)/2.2, g100);
     cell.nameLabel.textColor = [UIColor blackColor];
     cell.nameLabel.textAlignment = NSTextAlignmentRight;
     cell.myImageImage.image = bgPhoto;
//    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    self.currentUser = [AVUser currentUser];
    if (self.currentUser !=nil) {
       
        // 登录
        if (indexPath.row == 0) {
           
            CGFloat s = [[SDImageCache sharedImageCache] checkTmpSize];
           cell.myImageImage.image = [UIImage imageNamed:@"Trashcan"];
            cell.nameLabel.text = [NSString stringWithFormat:@"   清除缓存    %.2fMB",s];
        }else if (indexPath.row == 1) {
               cell.myImageImage.image = [UIImage imageNamed:@"Edit"];
            cell.nameLabel.text = [NSString stringWithFormat:@"   意见反馈    "];
        }else if (indexPath.row == 2) {
             cell.myImageImage.image = [UIImage imageNamed:@"Doc"];
            cell.nameLabel.text = [NSString stringWithFormat:@"   免责声明    "];
        }else if (indexPath.row == 3) {
              cell.myImageImage.image = [UIImage imageNamed:@"user_multiple"];
            cell.nameLabel.text = [NSString stringWithFormat:@"   关于版本    "];
        }else if (indexPath.row == 4) {
            
             cell.myImageImage.image = [UIImage imageNamed:@"Options"];
            cell.nameLabel.text = [NSString stringWithFormat:@"   退出登录    "];
        }
        
    }else
    {
        // 未登录
        if (indexPath.row == 0) {
             cell.myImageImage.image = [UIImage imageNamed:@"Trashcan"];
            CGFloat s = [[SDImageCache sharedImageCache] checkTmpSize];
            cell.nameLabel.text = [NSString stringWithFormat:@"   清除缓存    %.2fMB ",s];
        }else if (indexPath.row == 1) {
            cell.myImageImage.image = [UIImage imageNamed:@"Edit"];
            cell.nameLabel.text = [NSString stringWithFormat:@"   意见反馈    "];
        }else if (indexPath.row == 2) {
           cell.myImageImage.image = [UIImage imageNamed:@"Doc"];
            cell.nameLabel.text = [NSString stringWithFormat:@"   免责声明    "];
        }
        else if (indexPath.row == 3) {
             cell.myImageImage.image = [UIImage imageNamed:@"user_multiple"];
            cell.nameLabel.text = [NSString stringWithFormat:@"   关于版本    "];
        }
        
    }
    
  
    
    return cell;

}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    DoLog(@"%ld-====%ld",indexPath.section,indexPath.row);
    
    
    self.currentUser = [AVUser currentUser];
    if (self.currentUser !=nil) {
        // 登录
        if (indexPath.row == 0) {
            //  清除缓存
            [UIAlertController showAlertInViewController:self
                                               withTitle:@"提示"
                                                 message:@"是否清楚缓存?"
                                       cancelButtonTitle:@"取消"
                                  destructiveButtonTitle:@"确定"
                                       otherButtonTitles:nil
                                                tapBlock:^(UIAlertController *controller, UIAlertAction *action, NSInteger buttonIndex){
                                                    
                                                    if (buttonIndex == controller.cancelButtonIndex) {
                                                        
                                                    } else if (buttonIndex == controller.destructiveButtonIndex) {
                                                        
                                                        [[SDImageCache sharedImageCache] clearDiskOnCompletion:^{
                                                            
                                                            [AlertShow alertShowWithContent:@"清除成功" Seconds:1.0f];
                                                            [self.collectionView reloadData];
                                                        }];
                                                        
                                                        
                                                        
                                                    } }];
        }else if (indexPath.row == 1) {
            //  意见反馈
            AdviseViewController *adviseVC = [[AdviseViewController alloc] init];
            UINavigationController *aboutNC = [[UINavigationController alloc] initWithRootViewController:adviseVC];
            [self.navigationController presentViewController:aboutNC animated:YES completion:nil];
            
        }else if (indexPath.row == 2) {
            //  免责声明
            AboutUsViewController * aboutUSVC = [[AboutUsViewController alloc] init];
            aboutUSVC.type =@"M";
            UINavigationController *aboutUsNc = [[UINavigationController alloc] initWithRootViewController:aboutUSVC];
            [self.navigationController presentViewController:aboutUsNc animated:YES completion:nil];
            
            
            
        }else if (indexPath.row == 3) {
            //  关于版本
            
            AboutUsViewController * aboutUSVC = [[AboutUsViewController alloc] init];
            aboutUSVC.type =@"A";
            UINavigationController *aboutUsNc = [[UINavigationController alloc] initWithRootViewController:aboutUSVC];
            [self.navigationController presentViewController:aboutUsNc animated:YES completion:nil];
            
            
            
        }else if (indexPath.row == 4) {
            [UIAlertController showAlertInViewController:self
                                               withTitle:@"提示"
                                                 message:@"确定退出?"
                                       cancelButtonTitle:@"取消"
                                  destructiveButtonTitle:@"确定"
                                       otherButtonTitles:nil
                                                tapBlock:^(UIAlertController * _Nonnull controller, UIAlertAction * _Nonnull action, NSInteger buttonIndex) {
                                                    if (buttonIndex == controller.cancelButtonIndex) {
                                                        
                                                    } else if (buttonIndex == controller.destructiveButtonIndex) {
                                                        
                                                        //  退出登录
                                                        [AVUser logOut];
                                                        // DoLog(@"需要刷新布局");
                                                        self.navigationItem.title = @"我的";
                                                        NSIndexSet *indexSet=[[NSIndexSet alloc]initWithIndex:0];
                                                        
                                                       [self.collectionView reloadSections:indexSet ];
                                                  //  withRowAnimation:UITableViewRowAnimationAutomatic];
                                                        
                                                        self.userView.G_UserLoginOrRegistButton.frame = CGRectMake(CGRectGetWidth(self.userView.frame)/2-50, CGRectGetHeight(self.userView.frame)/2-15, 100, 30);
                                                        self.userView.G_UserLoginOrRegistButton.backgroundColor = [UIColor redColor];
                                                        
                                                        [self.userView.G_UserStartLabel setHidden:YES];
                                                        [self.userView.G_UserImage setHidden:YES];
                                                        [self.userView.G_startimageView setHidden:YES];
                                                        // [self.userView.G_jiluimageView setHidden: YES];
                                                        [self.userView.G_psdimageView setHidden:YES];
                                                        [self.userView.G_UserLoginOrRegistButton setHidden:NO];
                                                        [[NSUserDefaults standardUserDefaults]setBool:NO forKey:[NSString stringWithFormat:@"%@phtoto",[tools getUserLogin]]];
                                                        //
                                                        
                                                    }
                                                }];
            
        }
        
    }else
    {
        
        // 未登录
        if (indexPath.row == 0) {
            [UIAlertController showAlertInViewController:self
                                               withTitle:@"提示"
                                                 message:@"是否清楚缓存?"
                                       cancelButtonTitle:@"取消"
                                  destructiveButtonTitle:@"确定"
                                       otherButtonTitles:nil
                                                tapBlock:^(UIAlertController *controller, UIAlertAction *action, NSInteger buttonIndex){
                                                    
                                                    if (buttonIndex == controller.cancelButtonIndex) {
                                                        
                                                    } else if (buttonIndex == controller.destructiveButtonIndex) {
                                                        
                                                        [[SDImageCache sharedImageCache] clearDiskOnCompletion:^{
                                                            
                                                            [AlertShow alertShowWithContent:@"清除成功" Seconds:1.0f];
                                                            [self.collectionView reloadData];
                                                        }];
                                                        
                                                        
                                                        
                                                    } }];
            
            //  清除缓存
        }else if (indexPath.row == 1) {
            AdviseViewController *adviseVC = [[AdviseViewController alloc] init];
            UINavigationController *aboutNC = [[UINavigationController alloc] initWithRootViewController:adviseVC];
            [self.navigationController presentViewController:aboutNC animated:YES completion:nil];
            //  意见反馈
        }else if (indexPath.row == 2) {
            //  免责声明
            AboutUsViewController * aboutUSVC = [[AboutUsViewController alloc] init];
            aboutUSVC.type =@"M";
            UINavigationController *aboutUsNc = [[UINavigationController alloc] initWithRootViewController:aboutUSVC];
            [self.navigationController presentViewController:aboutUsNc animated:YES completion:nil];
            
            
            
            
            
        }else if (indexPath.row == 3) {
            
            AboutUsViewController * aboutUSVC = [[AboutUsViewController alloc] init];
            aboutUSVC.type =@"A";
            UINavigationController *aboutUsNc = [[UINavigationController alloc] initWithRootViewController:aboutUSVC];
            [self.navigationController presentViewController:aboutUsNc animated:YES completion:nil];
            
            
        }
        
        
        
    }

}
/*
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    self.currentUser = [AVUser currentUser];
    if (self.currentUser !=nil) {
        cell.backgroundColor = [UIColor whiteColor];
        // 登录
        if (indexPath.row == 0) {
            cell.backgroundColor = [UIColor whiteColor];
            CGFloat s = [[SDImageCache sharedImageCache] checkTmpSize];
            cell.textLabel.text = [NSString stringWithFormat:@"   清除缓存    %.2fMB",s];
        }else if (indexPath.row == 1) {
            cell.backgroundColor = [UIColor whiteColor];
            cell.textLabel.text = [NSString stringWithFormat:@"   意见反馈    "];
        }else if (indexPath.row == 2) {
            cell.backgroundColor = [UIColor whiteColor];
            cell.textLabel.text = [NSString stringWithFormat:@"   免责声明    "];
        }else if (indexPath.row == 3) {
            cell.backgroundColor = [UIColor whiteColor];
            cell.textLabel.text = [NSString stringWithFormat:@"   关于版本    "];
        }else if (indexPath.row == 4) {
            
            cell.backgroundColor = [UIColor redColor];
            cell.textLabel.text = [NSString stringWithFormat:@"   退出登录    "];
        }
        
    }else
    {
        // 未登录
        if (indexPath.row == 0) {
            cell.backgroundColor = [UIColor whiteColor];
            CGFloat s = [[SDImageCache sharedImageCache] checkTmpSize];
            cell.textLabel.text = [NSString stringWithFormat:@"   清除缓存    %.2fMB ",s];
        }else if (indexPath.row == 1) {
            cell.backgroundColor = [UIColor whiteColor];
            cell.textLabel.text = [NSString stringWithFormat:@"   意见反馈    "];
        }else if (indexPath.row == 2) {
            cell.backgroundColor = [UIColor whiteColor];
            cell.textLabel.text = [NSString stringWithFormat:@"   免责声明    "];
        }
        else if (indexPath.row == 3) {
            cell.backgroundColor = [UIColor whiteColor];
            cell.textLabel.text = [NSString stringWithFormat:@"   关于版本    "];
        }
        
    }
    return cell;
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    self.currentUser = [AVUser currentUser];
    if (self.currentUser !=nil) {
        // 登录
        if (indexPath.row == 0) {
            //  清除缓存
            [UIAlertController showAlertInViewController:self
                                               withTitle:@"提示"
                                                 message:@"是否清楚缓存?"
                                       cancelButtonTitle:@"取消"
                                  destructiveButtonTitle:@"确定"
                                       otherButtonTitles:nil
                                                tapBlock:^(UIAlertController *controller, UIAlertAction *action, NSInteger buttonIndex){
                                                    
                                                    if (buttonIndex == controller.cancelButtonIndex) {
                                                        
                                                    } else if (buttonIndex == controller.destructiveButtonIndex) {
                                                        
                                                        [[SDImageCache sharedImageCache] clearDiskOnCompletion:^{
                                                            
                                                            [AlertShow alertShowWithContent:@"清除成功" Seconds:1.0f];
                                                            [self.tableView reloadData];
                                                        }];
                                                        
                                                        
                                                        
                                                    } }];
        }else if (indexPath.row == 1) {
            //  意见反馈
            AdviseViewController *adviseVC = [[AdviseViewController alloc] init];
            UINavigationController *aboutNC = [[UINavigationController alloc] initWithRootViewController:adviseVC];
            [self.navigationController presentViewController:aboutNC animated:YES completion:nil];
            
        }else if (indexPath.row == 2) {
            //  免责声明
            AboutUsViewController * aboutUSVC = [[AboutUsViewController alloc] init];
            aboutUSVC.type =@"M";
            UINavigationController *aboutUsNc = [[UINavigationController alloc] initWithRootViewController:aboutUSVC];
            [self.navigationController presentViewController:aboutUsNc animated:YES completion:nil];
 
            

        }else if (indexPath.row == 3) {
            //  关于版本
            
            AboutUsViewController * aboutUSVC = [[AboutUsViewController alloc] init];
            aboutUSVC.type =@"A";
            UINavigationController *aboutUsNc = [[UINavigationController alloc] initWithRootViewController:aboutUSVC];
            [self.navigationController presentViewController:aboutUsNc animated:YES completion:nil];
            

            
        }else if (indexPath.row == 4) {
            [UIAlertController showAlertInViewController:self
                                               withTitle:@"提示"
                                                 message:@"确定退出?"
                                       cancelButtonTitle:@"取消"
                                  destructiveButtonTitle:@"确定"
                                       otherButtonTitles:nil
                                                tapBlock:^(UIAlertController * _Nonnull controller, UIAlertAction * _Nonnull action, NSInteger buttonIndex) {
                                                    if (buttonIndex == controller.cancelButtonIndex) {
                                                        
                                                    } else if (buttonIndex == controller.destructiveButtonIndex) {
                                                        
                                                        //  退出登录
                                                        [AVUser logOut];
                                                        // DoLog(@"需要刷新布局");
                                                        self.navigationItem.title = @"我的";
                                                        NSIndexSet *indexSet=[[NSIndexSet alloc]initWithIndex:0];
                                                        
                                                        [self.tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
                                                        
                                                        self.userView.G_UserLoginOrRegistButton.frame = CGRectMake(CGRectGetWidth(self.userView.frame)/2-50, CGRectGetHeight(self.userView.frame)/2-15, 100, 30);
                                                        self.userView.G_UserLoginOrRegistButton.backgroundColor = [UIColor redColor];
                                                        
                                                        [self.userView.G_UserStartLabel setHidden:YES];
                                                        [self.userView.G_UserImage setHidden:YES];
                                                        [self.userView.G_startimageView setHidden:YES];
                                                        // [self.userView.G_jiluimageView setHidden: YES];
                                                        [self.userView.G_psdimageView setHidden:YES];
                                                        [self.userView.G_UserLoginOrRegistButton setHidden:NO];
                                                        [[NSUserDefaults standardUserDefaults]setBool:NO forKey:[NSString stringWithFormat:@"%@phtoto",[tools getUserLogin]]];
                                                        //
                                                        
                                                    }
                                                }];
            
        }
        
    }else
    {
        
        // 未登录
        if (indexPath.row == 0) {
            [UIAlertController showAlertInViewController:self
                                               withTitle:@"提示"
                                                 message:@"是否清楚缓存?"
                                       cancelButtonTitle:@"取消"
                                  destructiveButtonTitle:@"确定"
                                       otherButtonTitles:nil
                                                tapBlock:^(UIAlertController *controller, UIAlertAction *action, NSInteger buttonIndex){
                                                    
                                                    if (buttonIndex == controller.cancelButtonIndex) {
                                                        
                                                    } else if (buttonIndex == controller.destructiveButtonIndex) {
                                                        
                                                        [[SDImageCache sharedImageCache] clearDiskOnCompletion:^{
                                                            
                                                            [AlertShow alertShowWithContent:@"清除成功" Seconds:1.0f];
                                                            [self.tableView reloadData];
                                                        }];
                                                        
                                                        
                                                        
                                                    } }];
            
            //  清除缓存
        }else if (indexPath.row == 1) {
            AdviseViewController *adviseVC = [[AdviseViewController alloc] init];
            UINavigationController *aboutNC = [[UINavigationController alloc] initWithRootViewController:adviseVC];
            [self.navigationController presentViewController:aboutNC animated:YES completion:nil];
            //  意见反馈
        }else if (indexPath.row == 2) {
            //  免责声明
            AboutUsViewController * aboutUSVC = [[AboutUsViewController alloc] init];
            aboutUSVC.type =@"M";
            UINavigationController *aboutUsNc = [[UINavigationController alloc] initWithRootViewController:aboutUSVC];
            [self.navigationController presentViewController:aboutUsNc animated:YES completion:nil];
            
            
            
            
            
        }else if (indexPath.row == 3) {
            
            AboutUsViewController * aboutUSVC = [[AboutUsViewController alloc] init];
            aboutUSVC.type =@"A";
            UINavigationController *aboutUsNc = [[UINavigationController alloc] initWithRootViewController:aboutUSVC];
            [self.navigationController presentViewController:aboutUsNc animated:YES completion:nil];
            
            
        }
        
        
        
    }
    
    
    
}
 */
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

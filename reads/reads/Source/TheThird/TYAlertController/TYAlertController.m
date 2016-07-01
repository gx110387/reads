//
//  TYAlertController.m
//  TYAlertControllerDemo
//
//  Created by tanyang on 15/9/1.
//  Copyright (c) 2015年 tanyang. All rights reserved.
//

#import "TYAlertController.h"
#import "UIView+TYAutoLayout.h"

@interface TYAlertController ()<ShareViewDelegate,UMSocialUIDelegate>

@property (nonatomic, strong) ShareView *alertView;

@property (nonatomic, assign) TYAlertControllerStyle preferredStyle;

@property (nonatomic, assign) TYAlertTransitionAnimation transitionAnimation;

@property (nonatomic, assign) Class transitionAnimationClass;

@property (nonatomic, weak) UITapGestureRecognizer *singleTap;

@property (nonatomic, strong) NSLayoutConstraint *alertViewCenterYConstraint;

@property (nonatomic, assign) CGFloat alertViewCenterYOffset;

@end

@implementation TYAlertController

#pragma mark - init

- (instancetype)init
{
    if (self = [super init]) {
        [self configureController];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self configureController];
    }
    return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        [self configureController];
    }
    return self;
}

- (instancetype)initWithAlertView:(UIView *)alertView preferredStyle:(TYAlertControllerStyle)preferredStyle transitionAnimation:(TYAlertTransitionAnimation)transitionAnimation transitionAnimationClass:(Class)transitionAnimationClass
{
    if (self = [self initWithNibName:nil bundle:nil]) {
        _alertView = alertView;
        
        _preferredStyle = preferredStyle;
        _transitionAnimation = transitionAnimation;
        _transitionAnimationClass = transitionAnimationClass;
    }
    return self;
}

+ (instancetype)alertControllerWithAlertView:(UIView *)alertView
{
    return [[self alloc]initWithAlertView:alertView
                           preferredStyle:TYAlertControllerStyleAlert
                      transitionAnimation:TYAlertTransitionAnimationFade
                 transitionAnimationClass:nil];
}

+ (instancetype)alertControllerWithAlertView:(UIView *)alertView preferredStyle:(TYAlertControllerStyle)preferredStyle
{
    return [[self alloc]initWithAlertView:alertView
                           preferredStyle:preferredStyle
                      transitionAnimation:TYAlertTransitionAnimationFade
                 transitionAnimationClass:nil];
}

+ (instancetype)alertControllerWithAlertView:(UIView *)alertView preferredStyle:(TYAlertControllerStyle)preferredStyle transitionAnimation:(TYAlertTransitionAnimation)transitionAnimation
{
    return [[self alloc]initWithAlertView:alertView
                           preferredStyle:preferredStyle
                      transitionAnimation:transitionAnimation
                 transitionAnimationClass:nil];
}

+ (instancetype)alertControllerWithAlertView:(UIView *)alertView preferredStyle:(TYAlertControllerStyle)preferredStyle transitionAnimationClass:(Class)transitionAnimationClass
{
    return [[self alloc]initWithAlertView:alertView
                           preferredStyle:preferredStyle
                      transitionAnimation:TYAlertTransitionAnimationCustom
                 transitionAnimationClass:transitionAnimationClass];
}

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor clearColor];
        _alertView.delegate =self;
    [self addBackgroundView];
    
    [self addSingleTapGesture];
    
    [self configureAlertView];
    
    [self.view layoutIfNeeded];
    
    if (_preferredStyle == TYAlertControllerStyleAlert) {
        // UIKeyboard Notification
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    }
    
}

- (void)addBackgroundView
{
    if (_backgroundView == nil) {
        UIView *backgroundView = [[UIView alloc]init];
        backgroundView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
        _backgroundView = backgroundView;
    }
    _backgroundView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view insertSubview:_backgroundView atIndex:0];
    [self.view addConstraintToView:_backgroundView edageInset:UIEdgeInsetsZero];
}

- (void)setBackgroundView:(UIView *)backgroundView
{
    if (_backgroundView == nil) {
        _backgroundView = backgroundView;
    } else if (_backgroundView != backgroundView) {
        backgroundView.translatesAutoresizingMaskIntoConstraints = NO;
        [self.view insertSubview:backgroundView aboveSubview:_backgroundView];
        [self.view addConstraintToView:backgroundView edageInset:UIEdgeInsetsZero];
        backgroundView.alpha = 0;
        [UIView animateWithDuration:0.3 animations:^{
            backgroundView.alpha = 1;
        } completion:^(BOOL finished) {
            [_backgroundView removeFromSuperview];
            _backgroundView = backgroundView;
            [self addSingleTapGesture];
        }];
    }
}

#pragma mark - 新浪
-(void)sinaShare
{
    DoLog(@">>>>>>>>");
    [[UMSocialControllerService defaultControllerService] setShareText:gShareText shareImage:[UIImage imageNamed:@"myheadimage"] socialUIDelegate:self];        //设置分享内容和回调对象
    [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToSina].snsClickHandler(self,[UMSocialControllerService defaultControllerService],YES);
  
    
}
#pragma mark - qq
-(void)QQShare
{
   
   
     [UMSocialData defaultData].extConfig.qqData.title =[NSString stringWithFormat:@"QQ_%@向你分享",gname]  ;
    [UMSocialData defaultData].extConfig.qqData.url = gUrl;
    [[UMSocialDataService defaultDataService]  postSNSWithTypes:@[UMShareToQQ] content:gShareText image:[UIImage imageNamed:@"myheadimage"] location:nil urlResource:nil presentedController:self completion:^(UMSocialResponseEntity *response){
        if (response.responseCode == UMSResponseCodeSuccess) {
            NSLog(@"分享成功！");
        }
    }];
    
}
#pragma mark -qq空间
-(void)QQZoneShare
{
    
    DoLog(@"QQZone");
     [UMSocialData defaultData].extConfig.qzoneData.title = [NSString stringWithFormat:@"Qzone_%@向你分享",gname] ;
    [UMSocialData defaultData].extConfig.qzoneData.url = gUrl;
    [[UMSocialDataService defaultDataService]  postSNSWithTypes:@[UMShareToQzone] content:gShareText image:[UIImage imageNamed:@"myheadimage"] location:nil urlResource:nil presentedController:self completion:^(UMSocialResponseEntity *response){
        if (response.responseCode == UMSResponseCodeSuccess) {
            NSLog(@"分享成功！");
        }
    }];

    
}
#pragma mark - 微信
-(void)WeChatShare
{
    DoLog(@"WeChatShare");
    [UMSocialData defaultData].extConfig.wechatSessionData.title = [NSString stringWithFormat:@"微信好友_%@向你分享",gname];
    [UMSocialData defaultData].extConfig.wechatSessionData.url = gUrl;
    [[UMSocialDataService defaultDataService]  postSNSWithTypes:@[UMShareToWechatSession] content:gShareText image:[UIImage imageNamed:@"myheadimage"] location:nil urlResource:nil presentedController:self completion:^(UMSocialResponseEntity *response){
        if (response.responseCode == UMSResponseCodeSuccess) {
            NSLog(@"分享成功！");
        }
    }];

}
#pragma mark -微信空间
-(void)WeChatZoneShare
{
    
    DoLog(@"WeChatZoneShare");
    [UMSocialData defaultData].extConfig.wechatTimelineData.title = [NSString stringWithFormat:@"微信朋友圈_%@向你分享",gname];
    [UMSocialData defaultData].extConfig.wechatTimelineData.url = gUrl;
    [[UMSocialDataService defaultDataService]  postSNSWithTypes:@[UMShareToWechatTimeline] content:gShareText image:[UIImage imageNamed:@"myheadimage"]  location:nil urlResource:nil presentedController:self completion:^(UMSocialResponseEntity *response){
        if (response.responseCode == UMSResponseCodeSuccess) {
            NSLog(@"分享成功！");
        }
    }];

}
#pragma mark -腾讯微博
-(void)tencentWb
{
    
    
    [[UMSocialControllerService defaultControllerService] setShareText:gShareText shareImage:[UIImage imageNamed:@"myheadimage"] socialUIDelegate:self];        //设置分享内容和回调对象
    [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToTencent].snsClickHandler(self,[UMSocialControllerService defaultControllerService],YES);
    
    
    
}

#pragma mark -短信
-(void)snsShare
{
    [[UMSocialControllerService defaultControllerService] setShareText:gShareText shareImage:[UIImage imageNamed:@"myheadimage"] socialUIDelegate:self];        //设置分享内容和回调对象
    [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToSms].snsClickHandler(self,[UMSocialControllerService defaultControllerService],YES);

    
}
-(void)emailShare
{
    [[UMSocialControllerService defaultControllerService] setShareText:gShareText shareImage:[UIImage imageNamed:@"myheadimage"] socialUIDelegate:self];        //设置分享内容和回调对象
    [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToEmail].snsClickHandler(self,[UMSocialControllerService defaultControllerService],YES);

}
#pragma mark -邮件

-(void)didSelectSocialPlatform:(NSString *)platformName withSocialData:(UMSocialData *)socialData
{
    if (platformName == UMShareToSina) {
        socialData.shareText = gShareText;
        
        
    }
    else{
        socialData.shareText = [NSString stringWithFormat:@"分享到其他平台的文字内容"];
    }
}

-(void)didFinishGetUMSocialDataInViewController:(UMSocialResponseEntity *)response
{
    
    if (response.responseCode == UMSResponseCodeSuccess) {
        NSLog(@"success");
        NSLog(@"share to sns name is %@",[[response.data allKeys] objectAtIndex:0]);
        
        [AlertShow alertShowWithContent:@"分享成功" Seconds:1.f];
        [_alertView hideView];
        
        
        
        // NSLog(@"success");
    }
    
}
- (void)addSingleTapGesture
{
    self.view.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTap:)];
    singleTap.enabled = _backgoundTapDismissEnable;
  
    [_backgroundView addGestureRecognizer:singleTap];
    _singleTap = singleTap;
}

- (void)setBackgoundTapDismissEnable:(BOOL)backgoundTapDismissEnable
{
    _backgoundTapDismissEnable = backgoundTapDismissEnable;
    _singleTap.enabled = backgoundTapDismissEnable;
}

- (void)configureController
{
    self.providesPresentationContextTransitionStyle = YES;
    self.definesPresentationContext = YES;
    self.modalPresentationStyle = UIModalPresentationCustom;
    self.transitioningDelegate = self;
    _backgoundTapDismissEnable = NO;
    _alertStyleEdging = 15;
    _actionSheetStyleEdging = 0;
}

- (void)configureAlertView
{
    if (_alertView == nil) {
        NSLog(@"%@: alertView is nil",NSStringFromClass([self class]));
        return;
    }
    _alertView.userInteractionEnabled = YES;
    [self.view addSubview:_alertView];
    _alertView.translatesAutoresizingMaskIntoConstraints = NO;
    switch (_preferredStyle) {
        case TYAlertControllerStyleActionSheet:
            [self layoutActionSheetStyleView];
            break;
        case TYAlertControllerStyleAlert:
            [self layoutAlertStyleView];
            break;
        default:
            break;
    }
}

- (void)configureAlertViewWidth
{
    // width, height
    if (!CGSizeEqualToSize(_alertView.frame.size,CGSizeZero)) {
        [_alertView addConstarintWidth:CGRectGetWidth(_alertView.frame) height:CGRectGetHeight(_alertView.frame)];
        
    }else {
        BOOL findAlertViewWidthConstraint = NO;
        for (NSLayoutConstraint *constraint in _alertView.constraints) {
            if (constraint.firstAttribute == NSLayoutAttributeWidth) {
                findAlertViewWidthConstraint = YES;
                break;
            }
        }
        
        if (!findAlertViewWidthConstraint) {
            [_alertView addConstarintWidth:CGRectGetWidth(self.view.frame)-2*_alertStyleEdging height:0];
        }
    }
}

#pragma mark - layout 

- (void)layoutAlertStyleView
{
    // center X
    [self.view addConstraintCenterXToView:_alertView CenterYToView:nil];
    
    [self configureAlertViewWidth];
    
    // top Y
    _alertViewCenterYConstraint = [self.view addConstraintCenterYToView:_alertView constant:0];
    
    if (_alertViewOriginY > 0) {
        [_alertView layoutIfNeeded];
        _alertViewCenterYOffset = _alertViewOriginY - (CGRectGetHeight(self.view.frame) - CGRectGetHeight(_alertView.frame))/2;
        _alertViewCenterYConstraint.constant = _alertViewCenterYOffset;
    }else{
        _alertViewCenterYOffset = 0;
    }
}

- (void)layoutActionSheetStyleView
{
    // center X
    [self.view addConstraintCenterXToView:_alertView CenterYToView:nil];
    
    [self.view addConstarintWithView:_alertView topView:nil leftView:self.view bottomView:self.view rightView:self.view edageInset:UIEdgeInsetsMake(0, _actionSheetStyleEdging, 0, -_actionSheetStyleEdging)];
    
    if (CGRectGetHeight(_alertView.frame) > 0) {
        // height
        [_alertView addConstarintWidth:0 height:CGRectGetHeight(_alertView.frame)];
    }
}

- (void)dismissViewControllerAnimated:(BOOL)animated
{
    [self dismissViewControllerAnimated:YES completion:self.dismissComplete];
}

#pragma mark - action

- (void)singleTap:(UITapGestureRecognizer *)sender
{
    [self dismissViewControllerAnimated:YES];
}

#pragma mark - notifycation

- (void)keyboardWillShow:(NSNotification*)notification{
    CGRect keyboardRect = [[[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    CGFloat alertViewBottomEdge = CGRectGetHeight(self.view.frame) -  CGRectGetMaxY(_alertView.frame);
    CGFloat differ = CGRectGetHeight(keyboardRect) - alertViewBottomEdge;
    
    if (differ > 0) {
         _alertViewCenterYConstraint.constant = _alertViewCenterYOffset - differ;
        [UIView animateWithDuration:0.25 animations:^{
            [self.view layoutIfNeeded];
        }];
    }
}

- (void)keyboardWillHide:(NSNotification*)notification{
    
    _alertViewCenterYConstraint.constant = _alertViewCenterYOffset;
    [UIView animateWithDuration:0.25 animations:^{
        [self.view layoutIfNeeded];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    NSLog(@"%@ dealloc",NSStringFromClass([self class]));
}

@end

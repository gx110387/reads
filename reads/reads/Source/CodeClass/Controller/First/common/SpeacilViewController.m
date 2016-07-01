//
//  SpeacilViewController.m
//  reads
//
//  Created by lanou3g on 15/11/7.
//  Copyright © 2015年 lanou3g. All rights reserved.
//
#define KScreen_Width [UIScreen mainScreen].bounds.size.width
#define KScreen_Height [UIScreen mainScreen].bounds.size.height
#import "SpeacilViewController.h"

const CGFloat BackGroupHeight = 200;
const CGFloat HeadImageHeight= 80;
#define ImageHight 200.0f
#define NAVBAR_CHANGE_POINT 50
@interface SpeacilViewController ()<UITableViewDataSource,UITableViewDelegate,MWPhotoBrowserDelegate>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong)NSMutableDictionary *foldDict;
@property(nonatomic,strong)NSMutableArray *G_getSpecialArr;
@property (nonatomic, strong) UIImageView *imageBG;
@property (nonatomic, strong) UIView *BGView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *rightBtn;
@property (nonatomic, strong) NSMutableArray *photos;
@property(nonatomic,strong)NomalViewController *NomalVC;
//@property(nonatomic,strong)UIAlertView *alert;
@property(nonatomic,assign)NSInteger num;
@property(nonatomic,assign)BOOL isflog;

@end

@implementation SpeacilViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
   
   
    [self createUI];
    
    
    self.foldDict = [NSMutableDictionary dictionary];

}

- (void)createUI{
    
    
    self.tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped];
    self.tableView.frame = CGRectMake(0, 0,  CGRectGetWidth( self.view.frame), CGRectGetHeight(self.view.frame)-66 )  ;
    [self.view addSubview: self.tableView];
    self.tableView.delegate = self;
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
   
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    
    self.tableView.contentInset = UIEdgeInsetsMake(CGRectGetHeight(self.view.frame)/3.5, 0, 0, 0);
    self.automaticallyAdjustsScrollViewInsets=NO;
   
    
    [_tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
    _imageBG = [[UIImageView alloc]init];
    _imageBG.frame = CGRectMake(0, -CGRectGetHeight(self.view.frame)/3.5, KScreen_Width, CGRectGetHeight(self.view.frame)/3.5);
  
    if ([self.sm.imgsrc isEqualToString:@""]) {
      [_imageBG sd_setImageWithURL:[NSURL URLWithString:self.sm.banner] placeholderImage:bgPhoto];
    }
    if([self.sm.banner isEqualToString:@""])
    {
       [_imageBG sd_setImageWithURL:[NSURL URLWithString:self.sm.imgsrc] placeholderImage:bgPhoto];
        
    }
    
    
    [_tableView addSubview:_imageBG];
    //
    _BGView = [[UIView alloc]init];
    _BGView.backgroundColor=[UIColor clearColor];
    _BGView.frame=CGRectMake(0, -CGRectGetHeight(self.view.frame)/3.5, KScreen_Width, CGRectGetHeight(self.view.frame)/3.5);
    
    [_tableView addSubview:_BGView];
    
    
    _nameLabel=[[UILabel alloc]init];
    _nameLabel.text=[NSString stringWithFormat:@"%@",self.sm.digest];
    _nameLabel.textColor = [UIColor whiteColor];
    _nameLabel.textAlignment=NSTextAlignmentCenter;
    _nameLabel.frame=CGRectMake(10, CGRectGetHeight(self.imageBG.frame)-[tools G_heightForString:self.sm.digest] -20,CGRectGetWidth(self.imageBG.frame)-20,[tools G_heightForString:self.sm.digest]);
    _nameLabel.textAlignment = NSTextAlignmentCenter;
    _nameLabel.numberOfLines = 0;
    
    
    
    [_BGView addSubview:_nameLabel];
    _titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 30)];
    _titleLabel.textColor=[UIColor whiteColor];
    _titleLabel.text=@"专题";
    
    _titleLabel.textAlignment=NSTextAlignmentCenter;
    
    self.navigationItem.titleView=_titleLabel;
    _titleLabel.alpha=0;
    
   // _leftBtn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 25)];
//    [_leftBtn setTitle:@"left" forState:UIControlStateNormal];
//    //    [leftBtn setBackgroundImage:[UIImage imageNamed:@"lift"] forState:UIControlStateNormal];
//    [_leftBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [_leftBtn addTarget:self action:@selector(leftBtnAction) forControlEvents:UIControlEventTouchUpInside];
//    
//    UIBarButtonItem *leftItem=[[UIBarButtonItem alloc]initWithCustomView:_leftBtn];
//    self.navigationItem.leftBarButtonItem=leftItem;
//    
//    _rightBtn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 25)];
//    [_rightBtn setTitle:@"right" forState:UIControlStateNormal];
//    [_rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [_rightBtn addTarget:self action:@selector(rightBtnAction) forControlEvents:UIControlEventTouchUpInside];
//    //    [rightBtn setBackgroundImage:[UIImage imageNamed:@"rig"] forState:UIControlStateNormal];
//    
//    UIBarButtonItem *rightItem=[[UIBarButtonItem alloc]initWithCustomView:_rightBtn];
//    self.navigationItem.rightBarButtonItem=rightItem;
   
}

//-(void)rightBtnAction
//{
//    
//    NSLog(@"gaoxing");
//}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
   
    CGFloat offsetY = scrollView.contentOffset.y ;

    if (offsetY <-ImageHight) {
        CGRect frame = _imageBG.frame;
        frame.origin.y = offsetY;
        frame.size.height =  -offsetY;//contentMode = UIViewContentModeScaleAspectFill时，高度改变宽度也跟着改变
        _imageBG.frame = frame;
       // _BGView.frame = frame;
    }
}





#pragma mark UITableViewDatasource

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"header";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if ([[self.foldDict valueForKey:[NSString stringWithFormat:@"%ld",section]] isEqualToString:@"0"]) {
        return 0;
    }else{
    return [[self.sm.topics[section]valueForKey:@"docs"] count];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.sm.topics.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FirstTableViewCell *firstCell = [tableView dequeueReusableCellWithIdentifier:@"firstCell"];
    FirstPhotoTableViewCell *firstPhotoCell = [tableView dequeueReusableCellWithIdentifier:@"firstPhoto"];
    if (firstCell ==nil) {
        firstCell = [[FirstTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"firstCell"];
    }
    self.num = indexPath.section;
  FitstNewDayModel   *fm = [[FitstNewDayModel alloc] init];
  [  fm setValuesForKeysWithDictionary:[self.sm.topics[indexPath.section] valueForKey:@"docs"][indexPath.row] ];
  
    //cell.textLabel.text = self.fm.title;
    
    [firstCell.myImage sd_setImageWithURL:[NSURL URLWithString:fm.imgsrc] placeholderImage:bgPhoto];
    // 标题
    firstCell.myNameLabel.text = fm.title;
    // 独家
    if ([fm.TAGS isEqualToString:@"独家"]) {
        NSLog(@"独家%@",fm.title);
        if (fm.votecount ==NULL) {
           
             firstCell.myRatingLabel.text =[NSString stringWithFormat:@"0人看过 %@ %@",[tools g_setTimerTime:fm.ptime],fm.TAGS];
        }else
        {
        firstCell.myRatingLabel.text =[NSString stringWithFormat:@"%@人看过 %@ %@",fm.votecount,[tools g_setTimerTime:fm.ptime],fm.TAGS];
        }
    }else  if ([fm.TAGS isEqualToString:@"订阅"]) {
        
        NSLog(@"订阅%@",fm.title);
    }else   if ([fm.TAGS isEqualToString:@"合作"]) {
        // 合作
        NSLog(@"合作%@",fm.title);
        firstCell.myRatingLabel.text =[NSString stringWithFormat:@"%@人看过 %@ %@",fm.votecount,[tools g_setTimerTime:fm.ptime],fm.TAGS];
        
    }else   if ([fm.TAGS isEqualToString:@"语音"]) {
        // 语音
        NSLog(@"语音%@",fm.title);
        firstCell.myRatingLabel.text =[NSString stringWithFormat:@"%@人看过 %@ %@",fm.votecount,[tools g_setTimerTime:fm.ptime],fm.TAGS];
        
    }
    else  if ([fm.skipType isEqualToString:@"photoset"]) {
        // 图集
        if (firstPhotoCell == nil) {
            firstPhotoCell = [[FirstPhotoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"firstPhoto"];
        }
        [firstPhotoCell.myBackgroundImage sd_setImageWithURL:[NSURL URLWithString:fm.imgsrc] placeholderImage:bgPhoto];
        // 标题
        firstPhotoCell.myNameLabel.text = fm.title;
        firstPhotoCell.myDataLabel.text =[NSString stringWithFormat:@"%@ 图集",[tools g_setTimerTime:fm.ptime]];
        
        
        return firstPhotoCell;
    }else   if ([fm.skipType isEqualToString:@"special"]) {
        // 专题
        
        firstCell.myRatingLabel.text =[NSString stringWithFormat:@"%@人看过 %@ 专题",fm.votecount,[tools g_setTimerTime:fm.ptime]];
        firstCell.myDescriptionLabel.text = fm.digest;
        
    }else  if ([fm.TAGS isEqualToString:@"视频"]) {
#warning mark 有小问题// 视频
        firstCell.myRatingLabel.text =[NSString stringWithFormat:@" %@ %@",[tools g_setTimerTime:fm.ptime],fm.TAGS];
        NSLog(@"视频%@",fm.title);
    }else   if ([fm.TAGS isEqualToString:@"正在直播"]) {
        // 正在直播
        NSLog(@"正在直播%@",fm.title);
        firstCell.myRatingLabel.text =[NSString stringWithFormat:@" %@ %@",[tools g_setTimerTime:fm.ptime],fm.TAGS];
        
    }else
    {
        firstCell.myRatingLabel.text =[NSString stringWithFormat:@"%@",[tools g_setTimerTime:fm.ptime]];
        
    }
    firstCell.myDescriptionLabel.text = fm.digest;
    firstCell.dianzanButton.tag = 100+indexPath.row ;
    firstCell.dianzanButton.titleLabel.tag = indexPath.section+100;//[NSString stringWithFormat:@"%ld",indexPath.section];
    [firstCell.dianzanButton addTarget:self action:@selector(startAction:) forControlEvents:UIControlEventTouchUpInside];
    gButton
    return firstCell;
    
}
#pragma mark -收藏

-(void)startAction:(UIButton *)sender{
    
    
    
    
    DoLog(@" ====%ld===%ld",sender.titleLabel.tag-100,sender.tag-100);
    
    
    AVUser *currentUser = [AVUser currentUser];
    if (currentUser != nil) {
        NSLog(@"已登录");
        // 可以收藏
    
        FitstNewDayModel   *fm = [[FitstNewDayModel alloc] init];
        [  fm setValuesForKeysWithDictionary:[self.sm.topics[sender.titleLabel.tag-100] valueForKey:@"docs"][sender.tag-100] ];
        
      
        NSLog(@"gao%@==%@==%@===%@==%@",fm.title,fm.ptime, fm.TAGS,fm.docid,fm.skipID);
        [tools G_setStart:fm.imgsrc title:fm.title tags:fm.TAGS ptime:fm.ptime docid:fm.docid skipID:fm.skipID skipType:fm.skipType];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)( 1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            if (fm.docid  == NULL) {
                if (fm.skipID !=NULL) {
                    DoLog(@"!!!!!!!!!!!!!!!!!!!!!!!!!");
                    // [self G_navitiaon :];
                    AVUser *currentUser = [AVUser currentUser];
                    if (currentUser != nil) {
                        [tools G_isStrat:fm.skipID type:@"skipID" isflag:^(BOOL isflag) {
                            self.isflog = isflag ;
                            
                            if(self.isflog == YES)
                            {
                                DoLog(@"!!!!!!!!!!!!!!!!!!!已收藏");
                                
                                NSIndexSet *indexSet=[[NSIndexSet alloc]initWithIndex:sender.titleLabel.tag-100];
                                [self.tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
                            }
                        }];
                    }
                    else
                    {
                        DoLog(@"!!!!!!!!!!!!!!!!!!!!!!!!未登录");
                    }
                    
                }
            }
            else if (fm.skipID == NULL)
            {
                if (fm.docid !=NULL) {
                    DoLog(@"222222222222222222222222");
                    // [self G_navitiaon :fm.docid];
                    AVUser *currentUser = [AVUser currentUser];
                    if (currentUser != nil) {
                        [tools G_isStrat:fm.docid type:@"docid"isflag:^(BOOL isflag) {
                            self.isflog = isflag ;
                            
                            if(self.isflog == YES)
                            {
                                DoLog(@"2222222222222222已收藏");
                                NSIndexSet *indexSet=[[NSIndexSet alloc]initWithIndex:sender.titleLabel.tag-100];
                                [self.tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
                                
                            }
                        }];
                    }
                    else
                    {
                        DoLog(@"2222222222222222未登录");
                        
                        
                    }
                    
                }
            }else
            {
                if (fm.docid !=NULL) {
                    DoLog(@"333333333");
                    // [self G_navitiaon :fm.docid];
                    AVUser *currentUser = [AVUser currentUser];
                    if (currentUser != nil) {
                        [tools G_isStrat:fm.docid type:@"docid"isflag:^(BOOL isflag) {
                            self.isflog = isflag ;
                            
                            if(self.isflog == YES)
                            {
                                DoLog(@"233333333已收藏");
                                NSIndexSet *indexSet=[[NSIndexSet alloc]initWithIndex:sender.titleLabel.tag-100];
                                [self.tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
                                
                            }
                        }];
                    }
                    else
                    {
                        DoLog(@"333333333333333332未登录");
                        
                        
                    }
                    
                }
                
            }
            
        });
        
        
    } else {
        DoLog(@"未登录");
        [AlertShow alertShowWithContent:@"请先登录" Seconds:1.f];
    }
    
    

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    FitstNewDayModel   *fm = [[FitstNewDayModel alloc] init];
    [  fm setValuesForKeysWithDictionary:[self.sm.topics[indexPath.section] valueForKey:@"docs"][indexPath.row] ];
    [self setData:fm];
    NSLog(@"%ld---%ld",indexPath.section,indexPath.row);
    
    
}
-(void)setData:(FitstNewDayModel *)sender
{
    didSelectInfo
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
        return CGRectGetHeight(self.view.frame)/3.5;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.backgroundColor = [UIColor colorWithRed:0/255.0 green:175/255.0 blue:240/255.0 alpha:1];
    
    [button setTintColor:[UIColor blackColor]];
    button.font = [ UIFont systemFontOfSize:20];
    [button setTitle:[NSString stringWithFormat:@"%@", [self.sm.topics[section]valueForKey:@"tname"]] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    button.tag = 100 + section;
    return button;
}
//- (void)dismissAlertView
//{
//    [self.alert dismissWithClickedButtonIndex:0 animated:YES];
//}
- (void)buttonAction:(UIButton *)sender
{
    if ([[self.foldDict valueForKey:[NSString stringWithFormat:@"%ld",sender.tag - 100]] isEqualToString:@"0"]) {
        [self.foldDict setValue:@"1" forKey:[NSString stringWithFormat:@"%ld",sender.tag - 100]];
    }else{
        [self.foldDict setValue:@"0" forKey:[NSString stringWithFormat:@"%ld",sender.tag - 100]];
    }
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:sender.tag - 100] withRowAnimation:UITableViewRowAnimationFade];
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)showTabBar
{
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    delegate.tab.tabBar.hidden = NO;
}
- (void)hideTabBar {
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    delegate.tab.tabBar.hidden = YES;
    
}
#pragma mark - Browser的代理函数
- (NSUInteger)numberOfPhotosInPhotoBrowser:(MWPhotoBrowser *)photoBrowser {
    return _photos.count;
}

- (id <MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index {
    if (index < _photos.count)
        return [_photos objectAtIndex:index];
    return nil;
}

- (BOOL)photoBrowser:(MWPhotoBrowser *)photoBrowser isPhotoSelectedAtIndex:(NSUInteger)index {
    return [[self.photos objectAtIndex:index] boolValue];
}


@end

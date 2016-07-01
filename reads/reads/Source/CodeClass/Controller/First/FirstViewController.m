//
//  FirstViewController.m
//  reads
//
//  Created by lanou3g on 15/11/4.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "FirstViewController.h"
#import "WeatherModel.h"
@interface FirstViewController ()<SDCycleScrollViewDelegate,MWPhotoBrowserDelegate>
// by hqx 1027 定义一个数组用于存放所有图片
@property (nonatomic, strong) NSMutableArray *photos;
@property(nonatomic,strong)NSMutableArray *g_dataArr;
@property(nonatomic,strong)NomalViewController *NomalVC;
@property(nonatomic,strong)UIButton *rightItem;
@property(nonatomic,assign,getter=isWeatherShow)BOOL weatherShow;
//@property(nonatomic,strong)SXWeatherView *weatherView;
@property(nonatomic,strong)UIImageView *tran;
@property(nonatomic,strong)SXWeatherModel *weatherModel;
@property(nonatomic,assign)BOOL isflog;
@end

@implementation FirstViewController
-(void)viewWillAppear:(BOOL)animated
{
    self.rightItem.hidden = NO;
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"rightItem"]) {
        self.rightItem.hidden = YES;
        [[NSUserDefaults standardUserDefaults]setBool:NO forKey:@"rightItem"];
    }
    self.rightItem.alpha = 0;
    [UIView animateWithDuration:0.4 animations:^{
        self.rightItem.alpha = 1;
    }];
    
    [self showTabBar];
}
- (void)viewWillDisappear:(BOOL)animated
{
    self.rightItem.hidden = YES;
    self.rightItem.transform = CGAffineTransformIdentity;
    [self.rightItem setImage:[UIImage imageNamed:@"top_navigation_square"] forState:UIControlStateNormal];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(showRightItem) name:@"SXAdvertisementKey" object:nil];
    self.navigationItem.title = @"今日头条";
    NSLog(@"111");
    
    
    self.g_dataArr = [NSMutableArray array];
    
    
    [self setupRefresh];
    UIButton *rightItem = [[UIButton alloc]init];
    self.rightItem = rightItem;
    UIWindow *win = [UIApplication sharedApplication].windows.firstObject;
    [win addSubview:rightItem];
    rightItem.y = 20;
    rightItem.width = 45;
    rightItem.height = 45;
    [rightItem addTarget:self action:@selector(rightItemClick) forControlEvents:UIControlEventTouchUpInside];
    rightItem.x = [UIScreen mainScreen].bounds.size.width - rightItem.width;
    NSLog(@"%@",NSStringFromCGRect(rightItem.frame));
    [rightItem setImage:[UIImage imageNamed:@"top_navigation_square"] forState:UIControlStateNormal];
    
    [self sendWeatherRequest];
    
    
    
}
- (void)showRightItem
{
    self.rightItem.hidden = NO;
}
- (void)sendWeatherRequest
{
    NSString *url = @"http://c.3g.163.com/nc/weather/5YyX5LqsfOWMl%2BS6rA%3D%3D.html";
    [[SXHTTPManager manager]GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, NSDictionary *responseObject) {
        NSString *html = operation.responseString;
        NSData* data=[html dataUsingEncoding:NSUTF8StringEncoding];
        if (data != 0) {
            NSDictionary *dict =[NSJSONSerialization  JSONObjectWithData:data options:0 error:nil];
            NSMutableArray *arr = [NSMutableArray array];
            for (NSDictionary  *dic in [dict valueForKey:@"北京|北京"]) {
                
                SXWeatherDetailM *sxweather = [[SXWeatherDetailM alloc] init];
                [sxweather setValuesForKeysWithDictionary:dic];
                [arr addObject:sxweather];
                [self.tableView reloadData];
            }
            
            SXWeatherModel *weatherModel = [SXWeatherModel objectWithKeyValues:responseObject];
            
            
            self.weatherModel = weatherModel;
            self.weatherModel.detailArray = arr;
            
            
            //[self addWeather];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"failure %@",error);
    }];
}
 
- (void)pushWeatherDetail
{
    self.weatherShow = NO;
    SXWeatherDetailVC *wdvc = [[SXWeatherDetailVC alloc]init];
    wdvc.weatherModel = self.weatherModel;
    [tools.hud hide:YES];
    [self.navigationController pushViewController:wdvc animated:YES];
    [UIView animateWithDuration:0.1 animations:^{
        // self.weatherView.alpha = 0;
    } completion:^(BOOL finished) {
        // self.weatherView.alpha = 0.9;
        // self.weatherView.hidden = YES;
        self.tran.hidden = YES;
    }];
}

#pragma mark - 天气
- (void)rightItemClick{
      [tools g_setupProgressHud:self];
    if (self.isWeatherShow) {
        //self.weatherView.hidden = YES;
        self.tran.hidden = YES;
        [UIView animateWithDuration:0.1 animations:^{
            self.rightItem.transform = CGAffineTransformRotate(self.rightItem.transform, M_1_PI * 5);
            
        } completion:^(BOOL finished) {
            [self.rightItem setImage:[UIImage imageNamed:@"top_navigation_square"] forState:UIControlStateNormal];
        }];
    }else{
        
        [self.rightItem setImage:[UIImage imageNamed:@"223"] forState:UIControlStateNormal];
        // self.weatherView.hidden = NO;
        self.tran.hidden = NO;
        // [self.weatherView addAnimate];
        
        [UIView animateWithDuration:0.1 animations:^{
           self.rightItem.transform = CGAffineTransformRotate(self.rightItem.transform, -M_1_PI * 6);
            
        } completion:^(BOOL finished) {
          [UIView animateWithDuration:0.1 animations:^{
                self.rightItem.transform = CGAffineTransformRotate(self.rightItem.transform, M_1_PI );
                 [self   pushWeatherDetail];
            }];
            
        }];
    }
    self.weatherShow = !self.isWeatherShow;
}

- (void)setupRefresh

{
    
    
    [self.tableView addLegendHeaderWithRefreshingTarget:self refreshingAction:@selector(headerRereshing) dateKey:@"table"];
    
    [self.tableView.header beginRefreshing];
    
    
    [self.tableView addLegendFooterWithRefreshingTarget:self refreshingAction:@selector(footerRereshing)];
    
    
}
#pragma mark 开始进入刷新状态
- (void)headerRereshing
{    [tools G_getNewInfoData:0 forword:40 passValue:^(NSMutableArray *array) {
    
    self.g_dataArr = array;
    NSLog(@"%ld",array.count);
    [self.tableView reloadData];
    [self.tableView. header endRefreshing];
}];
    
}
#pragma mark 开始进入刷新状态
- (void)footerRereshing
{
    
    [tools G_getNewInfoData:self.g_dataArr.count forword:20 passValue:^(NSMutableArray *array) {
        
        [self.g_dataArr addObjectsFromArray: array];
        [self.tableView reloadData];
        [self.tableView.footer endRefreshing];
    }];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//
//    return 10;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // NSLog(@"%@  ==%lu",self.g_dataArr,(unsigned long)self.g_dataArr.count);
    return self.g_dataArr.count-3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" ];
    FirstTableViewCell *firstCell = [tableView dequeueReusableCellWithIdentifier:@"firstCell"];
    FirstPhotoTableViewCell *firstPhotoCell = [tableView dequeueReusableCellWithIdentifier:@"firstPhoto"];
    if (firstCell ==nil) {
        firstCell = [[FirstTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"firstCell"];
    }
    
    if (indexPath.row == 0) {
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        }
        if (self.g_dataArr.count >4) {
            
            
            FitstNewDayModel *fm = self.g_dataArr[0];
            FitstNewDayModel *fm1 = self.g_dataArr[1];
            FitstNewDayModel *fm2 = self.g_dataArr[2];
            FitstNewDayModel *fm3 = self.g_dataArr[3];
            NSLog(@"URL:%@\n%@\n%@\n%@",fm.imgsrc,fm1.imgsrc,fm2.imgsrc,fm3.imgsrc);
            NSArray *imagesURL = @[
                                   [NSURL URLWithString:fm.imgsrc],
                                   [NSURL URLWithString:fm1.imgsrc],
                                   [NSURL URLWithString:fm2.imgsrc],
                                   [NSURL URLWithString:fm3.imgsrc]
                                   ];
            
            // 情景三：图片配文字
            NSArray *titles = @[fm.title ,
                                fm1.title,
                                fm2.title,
                                fm3.title
                                ];
            // 网络加载 --- 创建带标题的图片轮播器
            SDCycleScrollView *cycleScrollView2 = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)/3) imageURLsGroup:imagesURL];
            cycleScrollView2.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
            cycleScrollView2.delegate = self;
            cycleScrollView2.titlesGroup = titles;
            cycleScrollView2.dotColor = [UIColor whiteColor]; // 自定义分页控件小圆标颜色
            [self.view addSubview:cycleScrollView2];
            cycleScrollView2.autoScrollTimeInterval = 4.0;
        }
        return cell;
    }
    
    
    
    FitstNewDayModel *fm =self.g_dataArr[indexPath.row+3];
    firstCell.st= @"ddddddddsgfdfsgfsdhgfdhfghfsh";
    [firstCell.myImage sd_setImageWithURL:[NSURL URLWithString:fm.imgsrc] placeholderImage:bgPhoto];
    // 标题
    firstCell.myNameLabel.text = fm.title;
    // 独家
    firstCell.myDescriptionLabel.text = fm.digest;
    if ([fm.TAGS isEqualToString:@"独家"])
    {
        DoLog(@"独家%@",fm.title);
        
        firstCell.myRatingLabel.text =[NSString stringWithFormat:@"%@人看过 %@ %@",fm.votecount,[tools g_setTimerTime:fm.ptime],fm.TAGS];
        
    }
    else   if ([fm.TAGS isEqualToString:@"合作"])
    {
        // 合作
        DoLog(@"合作%@",fm.title);
        firstCell.myRatingLabel.text =[NSString stringWithFormat:@"%@人看过 %@ %@",fm.votecount,[tools g_setTimerTime:fm.ptime],fm.TAGS];
        
    } else  if ([fm.TAGS isEqualToString:@"订阅"])
    {
        firstCell.myRatingLabel.text =[NSString stringWithFormat:@"%@人看过 %@ %@",fm.votecount,[tools g_setTimerTime:fm.ptime],fm.TAGS];
        DoLog(@"订阅%@",fm.title);
    }else   if ([fm.TAGS isEqualToString:@"语音"])
    {
        // 语音
        DoLog(@"语音%@",fm.title);
        firstCell.myRatingLabel.text =[NSString stringWithFormat:@"%@人看过 %@ %@",fm.votecount,[tools g_setTimerTime:fm.ptime],fm.TAGS];
        
    }
    else  if ([fm.skipType isEqualToString:@"photoset"])
    {
        // 图集
        if (firstPhotoCell == nil) {
            firstPhotoCell = [[FirstPhotoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"firstPhoto"];
        }
        [firstPhotoCell.myBackgroundImage sd_setImageWithURL:[NSURL URLWithString:fm.imgsrc] placeholderImage:bgPhoto];
        // 标题
        firstPhotoCell.myNameLabel.text = fm.title;
        firstPhotoCell.myDataLabel.text =[NSString stringWithFormat:@"%@ 图集",[tools g_setTimerTime:fm.ptime]];
        
        
        return firstPhotoCell;
    }else   if ([fm.skipType isEqualToString:@"special"])
    {
        // 专题
        
        firstCell.myRatingLabel.text =[NSString stringWithFormat:@" %@ 专题",[tools g_setTimerTime:fm.ptime]];
        firstCell.myDescriptionLabel.text = fm.digest;
        
    }else  if ([fm.TAGS isEqualToString:@"视频"])
    {
#warning mark 有小问题// 视频
        firstCell.myRatingLabel.text =[NSString stringWithFormat:@" %@ %@",[tools g_setTimerTime:fm.ptime],fm.TAGS];
        DoLog(@"视频%@",fm.title);
    }else   if ([fm.TAGS isEqualToString:@"正在直播"])
    {
        // 正在直播
        DoLog(@"正在直播%@",fm.title);
        firstCell.myRatingLabel.text =[NSString stringWithFormat:@" %@ %@",[tools g_setTimerTime:fm.ptime],fm.TAGS];
        
    }else
    {
        firstCell.myRatingLabel.text =[NSString stringWithFormat:@"%@",[tools g_setTimerTime:fm.ptime]];
        
    }
    firstCell.dianzanButton.tag = 100+indexPath.row;
    [firstCell.dianzanButton addTarget:self action:@selector(startAction:) forControlEvents:UIControlEventTouchUpInside];
    
    if (fm.docid  == NULL) {
        if (fm.skipID !=NULL) {
            AVUser *currentUser = [AVUser currentUser];
            if (currentUser != nil) {
                [tools G_isStrat:fm.skipID type:@"skipID" isflag:^(BOOL isflag) {
                    self.isflog = isflag ;
                    [self.tableView reloadData];
                    
                    if(self.isflog == YES)
                    {
                      
                        [firstCell.dianzanButton setBackgroundImage:[UIImage imageNamed:@"like_sl"] forState:UIControlStateNormal];
                    }else
                    {
                       
                        [firstCell.dianzanButton setBackgroundImage:[UIImage imageNamed:@"like_wl"] forState:UIControlStateNormal];
                    }
                }];
                [firstCell.dianzanButton setBackgroundImage:[UIImage imageNamed:@"like_wl"] forState:UIControlStateNormal];
            }
            else
            {
                DoLog(@"未登录>>>>>>>>>");
                
                
            }
            
        }
    }
    else if (fm.skipID == NULL)
    {
        if (fm.docid !=NULL) {
            DoLog(@"<<<<<<<<<<<<1");
            
            AVUser *currentUser = [AVUser currentUser];
            if (currentUser != nil) {
                [tools G_isStrat:fm.docid type:@"docid" isflag:^(BOOL isflag) {
                    self.isflog = isflag ;
                    
                    if(self.isflog == YES)
                    {
                        DoLog(@"<<<<<<<<<<<<<2已收藏");
                        [firstCell.dianzanButton setBackgroundImage:[UIImage imageNamed:@"like_sl"] forState:UIControlStateNormal];            }else
                        {DoLog(@"<<<<<<<<<<<<<已收藏>>>>>>>>>>>>>>>>>>>>");
                            [firstCell.dianzanButton setBackgroundImage:[UIImage imageNamed:@"like_wl"] forState:UIControlStateNormal];
                        }
                    
                }];
                [firstCell.dianzanButton setBackgroundImage:[UIImage imageNamed:@"like_wl"] forState:UIControlStateNormal];
            }
            else
            {
               
                
                
            }
            
        }
    }else
    {
        if (fm.docid !=NULL) {
            AVUser *currentUser = [AVUser currentUser];
            if (currentUser != nil) {
                [tools G_isStrat:fm.docid type:@"docid" isflag:^(BOOL isflag) {
                    self.isflog = isflag ;
                    
                    if(self.isflog == YES)
                    {
                        DoLog(@"<<<<<<<<<<<<<2已收藏");
                        [firstCell.dianzanButton setBackgroundImage:[UIImage imageNamed:@"like_sl"] forState:UIControlStateNormal];            }else
                        {DoLog(@"<<<<<<<<<<<<<已收藏>>>>>>>>>>>>>>>>>>>>");
                            [firstCell.dianzanButton setBackgroundImage:[UIImage imageNamed:@"like_wl"] forState:UIControlStateNormal];
                        }
                    
                }];
                [firstCell.dianzanButton setBackgroundImage:[UIImage imageNamed:@"like_wl"] forState:UIControlStateNormal];
            }
            else
            {
               
                
                
            }
            
        }
        
    }
    
    
    return firstCell;
    
}
#pragma mark -收藏
-(void)startAction:(UIButton *)sender{
    
    DoLog(@"收藏");
    AVUser *currentUser = [AVUser currentUser];
    if (currentUser != nil) {
        DoLog(@"已登录");
        // 可以收藏
        FitstNewDayModel *fm =self.g_dataArr[sender.tag-100+3];
        DoLog(@"gao%@==%@==%@===%@==%@",fm.title,fm.ptime, fm.TAGS,fm.docid,fm.skipID);
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
                                
                                NSIndexSet *indexSet=[[NSIndexSet alloc]initWithIndex:0];
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
                                NSIndexSet *indexSet=[[NSIndexSet alloc]initWithIndex:0];
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
                                NSIndexSet *indexSet=[[NSIndexSet alloc]initWithIndex:0];
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


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row ==0) {
        return CGRectGetHeight(self.view.frame)/3;
    }
    return CGRectGetHeight(self.view.frame)/6;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self setData:self.g_dataArr[indexPath.row+3]];
    
    
}
#pragma mark - SDCycleScrollViewDelegate

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    
    [self setData:self.g_dataArr[index]];
}
-(void)setData:(NSMutableArray *)sender
{
    [self hideTabBar];
    FitstNewDayModel *fm =(FitstNewDayModel*) sender;
    
    if ([fm.TAGS isEqualToString:@"独家"])
    {
        NSLog(@"独家%@",fm.title);
        DujiaViewController *dujiaVC = [[DujiaViewController alloc] init];
        [tools g_setupProgressHud:self];
        [tools G_getNomaleData:fm.docid passValue:^(NSMutableArray *array) {
            dujiaVC.G_getDataArr = array;
            [tools.hud hide:YES];
            [self.navigationController pushViewController:dujiaVC animated:YES];
        }];
        
    }else  if ([fm.TAGS isEqualToString:@"订阅"])
    {
        DujiaViewController *dujiaVC = [[DujiaViewController alloc] init];
        [tools g_setupProgressHud:self];
        [tools G_getNomaleData:fm.docid passValue:^(NSMutableArray *array) {
            dujiaVC.G_getDataArr = array;
            [tools.hud hide:YES];
            [self.navigationController pushViewController:dujiaVC animated:YES];
        }];
        
        NSLog(@"订阅%@",fm.title);
    }else  if ([fm.TAGS isEqualToString:@"合作"])
    {
        DujiaViewController *dujiaVC = [[DujiaViewController alloc] init];
        [tools g_setupProgressHud:self];
        [tools G_getNomaleData:fm.docid passValue:^(NSMutableArray *array) {
            dujiaVC.G_getDataArr = array;
            [tools.hud hide:YES];
            [self.navigationController pushViewController:dujiaVC animated:YES];
        }];
        
        NSLog(@"合作%@",fm.title);
    }else  if ([fm.TAGS isEqualToString:@"语音"])
    {
        
        self.NomalVC = [[NomalViewController alloc] init];
        [tools g_setupProgressHud:self];
        [tools G_getNomaleData:fm.docid passValue:^(NSMutableArray *array) {
            self.NomalVC.G_getDataArr = array;
            [self.navigationController pushViewController:self.NomalVC animated:YES];
        }];
        
        NSLog(@"语音%@",fm.title);
    }else if ([fm.skipType isEqualToString:@"photoset"])
    {
        
        NSLog(@"图集%@",fm.title);
        [tools G_getNewDayData:fm.photosetID passValue:^(NSMutableArray *array)
         {
             NSLog(@"%ld",array.count);
             self.photos = [NSMutableArray array];
             MWPhoto *photo;
             
             MWPhotoBrowser *browser = [[MWPhotoBrowser alloc] initWithDelegate:self];
             browser.displayActionButton = YES;
             browser.displayNavArrows = NO;
             browser.displaySelectionButtons = NO;
             browser.alwaysShowControls = YES;
             browser.zoomPhotosToFill = YES;
             browser.enableGrid = YES;
             browser.startOnGrid = YES;
             browser.enableSwipeToDismiss = NO;
             browser.autoPlayOnAppear = NO;
             
             
             for (int i = 0; i <array.count; i++) {
                 photoModel *pm = array[i];
                 // Photos
                 photo = [MWPhoto  photoWithURL:[NSURL URLWithString:pm.imgurl]];
                 photo.caption = [NSString stringWithFormat:@"%@",pm.note];
                 [self.photos addObject:photo];
                 
                 [self.tableView reloadData];
             }
             
             
             int k = 0;
             
             NSLog(@"1111%d",k);
             [browser setCurrentPhotoIndex:k];
             //[self.tableView deselectRowAtIndexPath:indexPath animated:YES];
             [self.navigationController pushViewController:browser animated:YES];
             
             
             
             
         }];
    }else   if ([fm.skipType isEqualToString:@"special"])
    {
        
        SpeacilViewController *speacilVC = [[SpeacilViewController alloc] init];
        [tools g_setupProgressHud:self];
        [tools G_getSpecialData:fm.skipID passValue:^(NSMutableArray *array) {
            speacilVC.sm =(SpecialModel *) array[0];
            [tools.hud hide:YES ];
            [self.navigationController pushViewController:speacilVC animated:YES];
            
        }];
        
        
        
    }else  if ([fm.TAGS isEqualToString:@"视频"])
    {
        
        NSLog(@"%@",[fm.docid substringToIndex:16 ]);
        if ([[fm.docid substringToIndex:16 ]isEqualToString:@"9IG74V5H00963VRO"]) {
            [AlertShow alertShowWithContent:@"该新闻未找到" Seconds:1.f];
            return;
        }
        
        
        self.NomalVC = [[NomalViewController alloc] init];
        [tools g_setupProgressHud:self];
        [tools G_getNomaleData:fm.docid passValue:^(NSMutableArray *array) {
            self.NomalVC.G_getDataArr = array;
            [self.navigationController pushViewController:self.NomalVC animated:YES];
        }];
        
        NSLog(@"视频%@",fm.title);
    }else   if ([fm.TAGS isEqualToString:@"正在直播"])
    {
        [AlertShow alertShowWithContent:@"不能查看此新闻" Seconds:1.f];
        
        NSLog(@"正在直播%@",fm.title);
    }else
    {
        NSLog(@"-正常-%@",fm.title);
        self.NomalVC = [[NomalViewController alloc] init];
        
        [tools G_getNomaleData:fm.docid passValue:^(NSMutableArray *array) {
            self.NomalVC.G_getDataArr = array;
            [self.navigationController pushViewController:self.NomalVC animated:YES];
        }];
        
        
        
    }
}




#pragma mark 用来调节页面图片的大小和根据尺寸隐藏tabBar
gscroll
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



/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end

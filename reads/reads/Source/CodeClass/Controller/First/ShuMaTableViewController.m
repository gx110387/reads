//
//  ShuMaTableViewController.m
//  reads
//
//  Created by lanou3g on 15/11/10.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "ShuMaTableViewController.h"

@interface ShuMaTableViewController ()<SDCycleScrollViewDelegate,MWPhotoBrowserDelegate>
// by hqx 1027 定义一个数组用于存放所有图片
@property (nonatomic, strong) NSMutableArray *photos;
@property(nonatomic,strong)NSMutableArray *g_dataArr;
@property(nonatomic,strong)NomalViewController *NomalVC;
@property(nonatomic,assign)BOOL isflog;
@end

@implementation ShuMaTableViewController
-(void)viewWillAppear:(BOOL)animated
{
    [self showTabBar];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"数码";
    NSLog(@"111");
    
    
    self.g_dataArr = [NSMutableArray array];
    
    [self setupRefresh];
    
    
}
- (void)setupRefresh

{
    
    
    [self.tableView addLegendHeaderWithRefreshingTarget:self refreshingAction:@selector(headerRereshing) dateKey:@"table"];
    
    [self.tableView.header beginRefreshing];
    
    
    [self.tableView addLegendFooterWithRefreshingTarget:self refreshingAction:@selector(footerRereshing)];
    
    
}
#pragma mark 开始进入刷新状态
- (void)headerRereshing
{    [tools G_getShumaInfoData:0 forword:40 passValue:^(NSMutableArray *array) {
    
    self.g_dataArr = array;
    NSLog(@"%ld",array.count);
    [self.tableView reloadData];
    [self.tableView. header endRefreshing];
}];
    
}
#pragma mark 开始进入刷新状态
- (void)footerRereshing
{
    
    [tools G_getShumaInfoData:self.g_dataArr.count forword:20 passValue:^(NSMutableArray *array) {
        
        [self.g_dataArr addObjectsFromArray: array];
        [self.tableView reloadData];
        [self.tableView.footer endRefreshing];
    }];
    
}

#pragma mark 用来调节页面图片的大小和根据尺寸隐藏tabBar
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat y = scrollView.contentOffset.y;//+NavigationBarHight;//根据实际选择加不加上NavigationBarHight（44、64 或者没有导航条）
    // NSLog(@"%f",y);
    if (y >=5) {
        [self hideTabBar];
    }else{
        [self showTabBar];
    }
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
cellInfo
    
    firstCell.dianzanButton.tag = 100+indexPath.row;
    [firstCell.dianzanButton addTarget:self action:@selector(startAction:) forControlEvents:UIControlEventTouchUpInside];
    gButton
    return firstCell;
    
}
#pragma mark -收藏

-(void)startAction:(UIButton *)sender{
    gStart
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    gHeight
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
   didSelectInfo
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

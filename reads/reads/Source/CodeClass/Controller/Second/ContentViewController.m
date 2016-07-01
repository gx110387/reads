//
//  ContentViewController.m
//  reads
//
//  Created by lanou3g on 15/11/10.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "ContentViewController.h"
#import "CZFlowLayout.h"
#import "CZCollectionViewCell.h"
//#import "CZShop.h"

@interface ContentViewController ()<MWPhotoBrowserDelegate>

@property (weak, nonatomic) IBOutlet CZFlowLayout *FlowLayout;

@property (nonatomic, strong) NSMutableArray *shops;
@property(nonatomic,strong)NSString *ideniften;
@property(nonatomic,strong)NSMutableArray *photos;
@end

@implementation ContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    switch (self.num) {
        case 0:
            
           self.ideniften = @"T1440754652263";
            break;
        case 1:
            
           self.ideniften = @"T1435635793844";
            break;

        case 2:
            
           self.ideniften = @"T1436431970609";
            break;

        case 3:
            self.ideniften = @"T1446025828804";
            break;
        case 4:
            
            self.ideniften = @"T1439894813723";
            break;
        case 5:
            
            self.ideniften = @"T1429774297873";
            break;

            
        default:
            break;
    }

    self.collectionView.backgroundColor =[UIColor whiteColor];
    self.shops = [NSMutableArray array];
       [self setupRefresh];    //
    //设置列数
    self.FlowLayout.colCount = 2;
}

- (void)setupRefresh
{
 [self.collectionView addLegendHeaderWithRefreshingTarget:self refreshingAction:@selector(headerRereshing) dateKey:@"table"];
    [self.collectionView.header beginRefreshing];
    [self.collectionView addLegendFooterWithRefreshingTarget:self refreshingAction:@selector(footerRereshing)];
}
#pragma mark 开始进入刷新状态
- (void)headerRereshing
{
    [tools G_getNewSecondInfo:self.ideniften forword:0 count:20 passValue:^(NSMutableArray *array) {
    // NSLog(@"%ld",array.count);
       
    _shops = array;
    self.FlowLayout.shops = self.shops;
    [self.collectionView reloadData];
     [self.collectionView. header endRefreshing];
}];
}
#pragma mark 开始进入刷新状态
- (void)footerRereshing
{
    [tools G_getNewSecondInfo:self.ideniften forword:self.shops.count count:20 passValue:^(NSMutableArray *array) {
                 NSLog(@"%ld",array.count);
        [_shops addObjectsFromArray: array];
        self.FlowLayout.shops = self.shops;
        [self.collectionView reloadData];
         [self.collectionView.footer endRefreshing];
    }];
}
#pragma mark 用来调节页面图片的大小和根据尺寸隐藏tabBar
gscroll

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{      return self.shops.count;}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CZCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    //cell.backgroundColor = gbgcolor;
    
    cell.shop = self.shops[indexPath.row];
    
    return cell;
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self hideTabBar];
    if (self.num ==1) {
        
        [tools G_getNewDayData:[self.shops[indexPath.row] valueForKey:@"photosetID"] passValue:^(NSMutableArray *array)
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
                 [self.collectionView reloadData];
             }
                          int k = 0;
             NSLog(@"1111%d",k);
             [browser setCurrentPhotoIndex:k];
             //[self.tableView deselectRowAtIndexPath:indexPath animated:YES];
             [self.navigationController pushViewController:browser animated:YES];
                      }];
   }
   else {

        //
        NomalViewController *NomalVC = [[NomalViewController alloc] init];
        
        [tools G_getNomaleData:[self.shops[indexPath.row]valueForKey:@"docid"] passValue:^(NSMutableArray *array) {
            NomalVC.G_getDataArr = array;
            [self.navigationController pushViewController:NomalVC animated:YES];
        }];

    }
}
- (void)btnClick:(UIButton *)sender {
    [tools G_getNewSecondInfo:self.ideniften forword:self.shops.count count:20 passValue:^(NSMutableArray *array) {
        // NSLog(@"%ld",array.count);
        [_shops addObjectsFromArray: array];
        [self.collectionView reloadData];
    }];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

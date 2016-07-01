//
//  CollectionViewController.m
//  ZouZou
//
//  Created by lanou3g on 15/10/16.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "CollectionViewController.h"

@interface CollectionViewController ()
@property(nonatomic,strong)NSMutableArray *G_dataArr;
@property(nonatomic,strong)NomalViewController *NomalVC;

@end

@implementation CollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.backgroundColor = [UIColor colorWithRed:251/255.0 green:247/255.0 blue:237/255.0 alpha:1];
     self.G_dataArr = [NSMutableArray array];
   
    
   
    DoLog(@"%d",self.isEditing);
      [self setupRefresh];
     [self.collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
}
/**
 *  集成刷新控件
 */
- (void)setupRefresh

{
    
    
    [self.collectionView addLegendHeaderWithRefreshingTarget:self refreshingAction:@selector(headerRereshing) dateKey:@"table"];
    
    [self.collectionView.header beginRefreshing];
    
    
    [self.collectionView addLegendFooterWithRefreshingTarget:self refreshingAction:@selector(footerRereshing)];
    
    
}

#pragma mark 开始进入刷新状态
- (void)headerRereshing
{
    
    [tools G_selectStart:0 count:20 value:^(NSMutableArray *array) {
        self.G_dataArr= array;
        
        [self.collectionView reloadData];
         [self.collectionView. header endRefreshing];
    }];
 
  }

- (void)footerRereshing
{
    
    [tools G_selectStart:self.G_dataArr.count count:20 value:^(NSMutableArray *array) {
        
         [self.G_dataArr addObjectsFromArray: array];
        [self.collectionView reloadData];
    [self.collectionView.footer endRefreshing];
    }];
          }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.G_dataArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    UserLoginModel *user = self.G_dataArr[indexPath.row];
    [cell.myImage sd_setImageWithURL:[NSURL URLWithString:user.url] placeholderImage:[UIImage imageNamed:@"picholder"]];
    
    // cell.myImage.image = bgPhoto;
    NSString *str = [tools g_setTimerjuti:user.ptime];
    
    cell.nameLabel.text =[NSString stringWithFormat:@"%@\n%@",[str substringToIndex:10],user.title];//@"gao";
    
    cell.backgroundColor = [UIColor colorWithRed:251/255.0 green:247/255.0 blue:237/255.0 alpha:1];
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //删除收藏
    if (self.isEditing ==YES) {
        UserLoginModel *fm = self.G_dataArr[indexPath.row];
        
        if (fm.dpcid  == NULL) {
            if (fm.skipID !=NULL) {
                AVQuery *query = [AVQuery queryWithClassName:[tools getUserLogin]];
                [query whereKey:@"skipID" equalTo:fm.skipID];
                
                [query  findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
                    
                    if (!error) {
                        
                        AVObject *local = [ AVObject objectWithClassName:[tools getUserLogin]];
                        for ( NSDictionary *dic in [objects valueForKey:@"localData"]) {
                            
                            [[local objectForKey:@"localData"] setValuesForKeysWithDictionary:dic];
                        }
                        for ( NSDictionary *dic in [objects valueForKey:@"objectId"] ) {
                            
                            local.objectId = [NSString stringWithFormat:@"%@",dic];
                        }
                        
                        [local deleteInBackground];
                        
                        NSLog(@"%@",local);
                    }else
                    {
                        NSLog(@"ddddddd");
                        
                    }
                    
                    
                }];
                
                
            }
        }
        else if (fm.skipID == NULL)
        {
            if (fm.dpcid !=NULL) {
                AVQuery *query = [AVQuery queryWithClassName:[tools getUserLogin]];
                [query whereKey:@"dpcid" equalTo:fm.dpcid];
                
                [query  findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
                    
                    if (!error) {
                        
                        AVObject *local = [ AVObject objectWithClassName:[tools getUserLogin]];
                        for ( NSDictionary *dic in [objects valueForKey:@"localData"]) {
                            
                            [[local objectForKey:@"localData"] setValuesForKeysWithDictionary:dic];
                        }
                        for ( NSDictionary *dic in [objects valueForKey:@"objectId"] ) {
                            
                            local.objectId = [NSString stringWithFormat:@"%@",dic];
                        }
                        
                        [local deleteInBackground];
                        
                        NSLog(@"%@",local);
                    }else
                    {
                        NSLog(@"ddddddd");
                        
                    }
                    
                    
                }];
                
            }
        }
        else
        {
            if (fm.dpcid !=NULL) {
                
                AVQuery *query = [AVQuery queryWithClassName:[tools getUserLogin]];
                [query whereKey:@"dpcid" equalTo:fm.dpcid];
                
                [query  findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
                    
                    if (!error) {
                        
                        AVObject *local = [ AVObject objectWithClassName:[tools getUserLogin]];
                        for ( NSDictionary *dic in [objects valueForKey:@"localData"]) {
                            
                            [[local objectForKey:@"localData"] setValuesForKeysWithDictionary:dic];
                        }
                        for ( NSDictionary *dic in [objects valueForKey:@"objectId"] ) {
                            
                            local.objectId = [NSString stringWithFormat:@"%@",dic];
                        }
                        
                        [local deleteInBackground];
                        
                        NSLog(@"%@",local);
                    }else
                    {
                        NSLog(@"ddddddd");
                        
                    }
                    
                    
                }];
                
            }
            
        }
        
        
       
        
        [self.G_dataArr removeObjectAtIndex:indexPath.row ];
        [ self.collectionView  deleteItemsAtIndexPaths:@[indexPath]];
        [self.collectionView reloadData];
        
        
    }else
    { 
     NSLog(@"%ld====%ld",(long)indexPath.section,(long)indexPath.row);
        
        [self setData:self.G_dataArr[indexPath.row]];
        
        
        
    }
}
-(void)setData:(NSMutableArray *)sender
{
    UserLoginModel *fm =(UserLoginModel*) sender;
      NSLog(@"gao%@==%@==%@===%@==%@",fm.title,fm.ptime, fm.tags,fm.dpcid,fm.skipID);
    if ([fm.tags isEqualToString:@"独家"])
    {
        NSLog(@"独家%@",fm.title);
        DujiaViewController *dujiaVC = [[DujiaViewController alloc] init];
        [tools g_setupProgressHud:self];
        [tools G_getNomaleData:fm.dpcid passValue:^(NSMutableArray *array) {
            dujiaVC.G_getDataArr = array;
            [tools.hud hide:YES];
            [self.navigationController pushViewController:dujiaVC animated:YES];
        }];
        
    }else  if ([fm.tags isEqualToString:@"订阅"])
    {
        DujiaViewController *dujiaVC = [[DujiaViewController alloc] init];
        [tools g_setupProgressHud:self];
        [tools G_getNomaleData:fm.dpcid passValue:^(NSMutableArray *array) {
            dujiaVC.G_getDataArr = array;
            [tools.hud hide:YES];
            [self.navigationController pushViewController:dujiaVC animated:YES];
        }];
        
        NSLog(@"订阅%@",fm.title);
    }else  if ([fm.tags isEqualToString:@"合作"])
    {
        DujiaViewController *dujiaVC = [[DujiaViewController alloc] init];
        [tools g_setupProgressHud:self];
        [tools G_getNomaleData:fm.dpcid passValue:^(NSMutableArray *array) {
            dujiaVC.G_getDataArr = array;
            [tools.hud hide:YES];
            [self.navigationController pushViewController:dujiaVC animated:YES];
        }];
        
        NSLog(@"合作%@",fm.title);
    }else  if ([fm.tags isEqualToString:@"语音"])
    {
        
        self.NomalVC = [[NomalViewController alloc] init];
        [tools g_setupProgressHud:self];
        [tools G_getNomaleData:fm.dpcid passValue:^(NSMutableArray *array) {
            self.NomalVC.G_getDataArr = array;
            [self.navigationController pushViewController:self.NomalVC animated:YES];
        }];
        
        NSLog(@"语音%@",fm.title);
    }
//    else if ([fm.skipType isEqualToString:@"photoset"])
//    {
//        
//        NSLog(@"图集%@",fm.title);
//        [tools G_getNewDayData:fm.photosetID passValue:^(NSMutableArray *array)
//         {
//             NSLog(@"%ld",array.count);
//             self.photos = [NSMutableArray array];
//             MWPhoto *photo;
//             
//             MWPhotoBrowser *browser = [[MWPhotoBrowser alloc] initWithDelegate:self];
//             browser.displayActionButton = YES;
//             browser.displayNavArrows = NO;
//             browser.displaySelectionButtons = NO;
//             browser.alwaysShowControls = YES;
//             browser.zoomPhotosToFill = YES;
//             browser.enableGrid = YES;
//             browser.startOnGrid = YES;
//             browser.enableSwipeToDismiss = NO;
//             browser.autoPlayOnAppear = NO;
//             
//             
//             for (int i = 0; i <array.count; i++) {
//                 photoModel *pm = array[i];
//                 // Photos
//                 photo = [MWPhoto  photoWithURL:[NSURL URLWithString:pm.imgurl]];
//                 photo.caption = [NSString stringWithFormat:@"%@",pm.note];
//                 [self.photos addObject:photo];
//                 
//                 [self.tableView reloadData];
//             }
//             
//             
//             int k = 0;
//             
//             NSLog(@"1111%d",k);
//             [browser setCurrentPhotoIndex:k];
//             //[self.tableView deselectRowAtIndexPath:indexPath animated:YES];
//             [self.navigationController pushViewController:browser animated:YES];
//             
//             
//             
//             
//         }];
//    }
    else   if ([fm.skipType isEqualToString:@"special"])
    {
        
        SpeacilViewController *speacilVC = [[SpeacilViewController alloc] init];
        [tools g_setupProgressHud:self];
        [tools G_getSpecialData:fm.skipID passValue:^(NSMutableArray *array) {
            speacilVC.sm =(SpecialModel *) array[0];
            [tools.hud hide:YES ];
            [self.navigationController pushViewController:speacilVC animated:YES];
            
        }];
        
        
        
    }else  if ([fm.tags isEqualToString:@"视频"])
    {
        
        NSLog(@"%@",[fm.dpcid substringToIndex:16 ]);
        if ([[fm.dpcid substringToIndex:16 ]isEqualToString:@"9IG74V5H00963VRO"]) {
            [AlertShow alertShowWithContent:@"该新闻未找到" Seconds:1.f];
            return;
        }
        
        
        self.NomalVC = [[NomalViewController alloc] init];
        [tools g_setupProgressHud:self];
        [tools G_getNomaleData:fm.dpcid passValue:^(NSMutableArray *array) {
            self.NomalVC.G_getDataArr = array;
            [self.navigationController pushViewController:self.NomalVC animated:YES];
        }];
        
        NSLog(@"视频%@",fm.title);
    }else   if ([fm.tags isEqualToString:@"正在直播"])
    {
        [AlertShow alertShowWithContent:@"不能查看此新闻" Seconds:1.f];
        
        NSLog(@"正在直播%@",fm.title);
    }else
    {
        NSLog(@"-正常-%@",fm.title);
        self.NomalVC = [[NomalViewController alloc] init];
        
        [tools G_getNomaleData:fm.dpcid passValue:^(NSMutableArray *array) {
            self.NomalVC.G_getDataArr = array;
            [self.navigationController pushViewController:self.NomalVC animated:YES];
        }];
        
        
        
    }

}
-(BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
-(void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    
    NSLog(@"fafdfsd");
    
    
    
    
}
-(void)G_getMothData:(NSString *)type id:(NSString *)id1
{
    //    [[G_getDestinaData shareGetDestinData] g_getMonthData:type id:id1 passValue:^(DestinationModel *destionModel) {
    //        self.destinationDilVc.G_destionModel = destionModel;
    //
    //        [[G_getDestinaData shareGetDestinData] G_getInfoData:0 id:id1 count:5 passValue:^(NSMutableArray *array) {
    //            NSLog(@"准备跳入下一页,游记页面");
    //
    //            self.destinationDilVc.G_tripsArr =array;
    //            self.firstCollectionVC.G_tripsArr = array;
    //            [self.navigationController pushViewController:self.destinationDilVc animated:YES];
    //
    //        }];
    //
    //         }];
    //
    
}
#pragma mark <UICollectionViewDelegate>

/*
 // Uncomment this method to specify if the specified item should be highlighted during tracking
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
 }
 */

/*
 // Uncomment this method to specify if the specified item should be selected
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
 return YES;
 }
 */

/*
 // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
 }
 
 - (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
 }
 
 - (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
 }
 */

@end

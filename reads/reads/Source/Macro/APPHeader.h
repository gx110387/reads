//
//  APPHeader.h
//  ProjectMusic
//
//  Created by young on 15/7/31.
//  Copyright (c) 2015年 young. All rights reserved.
//  这里存放普通的app宏定义和声明等信息.

#ifndef Project_APPHeader_h
#define Project_APPHeader_h


#import "UserViewController.h"

#import "ThreeViewController.h"

#import "SecondViewController.h"

#import "FirstViewController.h"

#import "LeftViewController.h"

#import "PlayActivityTableViewController.h"

#import "KeJiTableViewController.h"

#import "CaiJingTableViewController.h"

#import "TiYuTableViewController.h"

#import "CarTableViewController.h"

#import "NomalViewController.h"

#import "SpeacilViewController.h"

#import "VideoViewController.h"

#import "DujiaViewController.h"

#import "BeijingTableViewController.h"

#import "EduTableViewController.h"

#import "ShuMaTableViewController.h"

#import "LvyouTableViewController.h"

#import "ContentViewController.h"

#import "ReadOfOneViewController.h"

#import "DeailThreeViewController.h"

#import "AdviseViewController.h"

#import "AboutUsViewController.h"

#import "LoginViewController.h"

#import "RegiViewController.h"

#import "restartPsdViewController.h"

#import "StartViewController.h"

//#import "NewTableViewController.h"

#import "ReadsTableViewController.h"

#import "CollectionViewController.h"

#import "ReadsViewController.h"

#import "ReadWebViewController.h"

#import "ForgetViewController.h"



//////
#import "G_getDataTools.h"

////

#import "FitstNewDayModel.h"

#import "photoModel.h"

#import "NomelModel.h"

#import "NomelImgModle.h"

#import "VideoModel.h"

#import "SpecialModel.h"

#import "ReadOfOneModel.h"

#import "ReadOfDeailModel.h"

#import "UserLoginModel.h" 

#import "ReadsModel.h"

//////

#import "MovieTableViewCell.h"

#import "FirstTableViewCell.h"

#import "FirstPhotoTableViewCell.h"

#import "NomalVIew.h"

#import "ReadOfOneView.h"

#import "DeailThreeView.h"

#import "UserView.h"

#import "LoginView.h"

#import "RegiView.h"

#import "UserImageView.h"

#import "restartPsdView.h"

#import "CollectionViewCell.h"
#define gname [tools getUserLogin]

#define gShareText @"#悦读新闻#这里有你随时想要了解的新闻,文章,让你随时随地,想看就看,@说谎52_1.点击下载点滴旅行 https://appsto.re/cn/ocb0-.i"
#define  gUrl @"http://weibo.com/u/3149053324"

#define tools [G_getDataTools shareGetdata]

#define bgPhoto [UIImage imageNamed:@"picholder"]
//浅绿色
#define gbgcontentcolor [UIColor colorWithRed:232/255.0 green:239/255.0 blue:185/255.0 alpha:1]
// 蓝色
#define gtbcolor [UIColor colorWithRed:0/255.0 green:175/255.0 blue:240/255.0 alpha:1]
//米黄色
#define gbgcolor [UIColor colorWithRed:251/255.0 green:247/255.0 blue:237/255.0 alpha:1]
//棕色
#define gzgcolor [UIColor whiteColor]// [UIColor colorWithRed:185/255.0 green:172/255.0 blue:124/255.0 alpha:1]

#define delet  [body replaceOccurrencesOfString:@"<p>" withString:@"\n" options:NSCaseInsensitiveSearch range:NSMakeRange(0, body.length)];[body replaceOccurrencesOfString:@"</p>" withString:@"\n" options:NSCaseInsensitiveSearch range:NSMakeRange(0, body.length)];[body replaceOccurrencesOfString:@"<b>" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, body.length)];[body replaceOccurrencesOfString:@"</b>" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, body.length)];[body replaceOccurrencesOfString:@"<strong>" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, body.length)];[body replaceOccurrencesOfString:@"</strong>" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, body.length)];[body replaceOccurrencesOfString:@"<font color=\"#a4512c\">" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, body.length)];[body replaceOccurrencesOfString:@"</font>" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, body.length)];[body replaceOccurrencesOfString:@"<!--SPINFO#0-->" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, body.length)];[body replaceOccurrencesOfString:@"<!--VIDEO#0-->" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, body.length)]; for (int i = 0; i <100; i++) {[body replaceOccurrencesOfString:[NSString stringWithFormat:@"<!--@@VOTEID=460%d-->",i] withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, body.length)];}


#define inum 50

#define G_alertview if ([[fm.docid substringToIndex:16 ]isEqualToString:@"9IG74V5H00963VRO"]) {self.alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"该新闻未找到" delegate:nil cancelButtonTitle:nil otherButtonTitles: nil];[self.alert show];[NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(dismissAlertView) userInfo:nil repeats:YES];return;}


#define  cellInfo  FirstTableViewCell *firstCell = [tableView dequeueReusableCellWithIdentifier:@"firstCell"];FirstPhotoTableViewCell *firstPhotoCell = [tableView dequeueReusableCellWithIdentifier:@"firstPhoto"];if (firstCell ==nil) {    firstCell = [[FirstTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"firstCell"];}if (indexPath.row == 0) {    if (cell == nil) {        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];    }    if (self.g_dataArr.count >4) {                      FitstNewDayModel *fm = self.g_dataArr[0];        FitstNewDayModel *fm1 = self.g_dataArr[1];        FitstNewDayModel *fm2 = self.g_dataArr[2];        FitstNewDayModel *fm3 = self.g_dataArr[3];                NSArray *imagesURL = @[                               [NSURL URLWithString:fm.imgsrc],                               [NSURL URLWithString:fm1.imgsrc],                               [NSURL URLWithString:fm2.imgsrc],                               [NSURL URLWithString:fm3.imgsrc]                               ];                  NSArray *titles = @[fm.title ,                            fm1.title,                           fm2.title,                            fm3.title                            ];        SDCycleScrollView *cycleScrollView2 = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), gHeigth) imageURLsGroup:imagesURL];        cycleScrollView2.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;        cycleScrollView2.delegate = self;        cycleScrollView2.titlesGroup = titles;        cycleScrollView2.dotColor = [UIColor whiteColor];         [self.view addSubview:cycleScrollView2];        cycleScrollView2.autoScrollTimeInterval = 4.0;    }    return cell;}FitstNewDayModel *fm =self.g_dataArr[indexPath.row+3];[firstCell.myImage sd_setImageWithURL:[NSURL URLWithString:fm.imgsrc] placeholderImage:bgPhoto];firstCell.myNameLabel.text = fm.title;firstCell.myDescriptionLabel.text = fm.digest;if ([fm.TAGS isEqualToString:@"独家"]){    NSLog(@"独家%@",fm.title);    firstCell.myRatingLabel.text =[NSString stringWithFormat:@"%@人看过 %@ %@",fm.votecount,[tools g_setTimerTime:fm.ptime],fm.TAGS];}else   if ([fm.TAGS isEqualToString:@"合作"]){       NSLog(@"合作%@",fm.title);    firstCell.myRatingLabel.text =[NSString stringWithFormat:@"%@人看过 %@ %@",fm.votecount,[tools g_setTimerTime:fm.ptime],fm.TAGS];    } else  if ([fm.TAGS isEqualToString:@"订阅"]){    firstCell.myRatingLabel.text =[NSString stringWithFormat:@"%@人看过 %@ %@",fm.votecount,[tools g_setTimerTime:fm.ptime],fm.TAGS];    NSLog(@"订阅%@",fm.title);}else   if ([fm.TAGS isEqualToString:@"语音"]){       firstCell.myRatingLabel.text =[NSString stringWithFormat:@"%@人看过 %@ %@",fm.votecount,[tools g_setTimerTime:fm.ptime],fm.TAGS];    }else  if ([fm.skipType isEqualToString:@"photoset"]){        if (firstPhotoCell == nil) {        firstPhotoCell = [[FirstPhotoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"firstPhoto"];    }    [firstPhotoCell.myBackgroundImage sd_setImageWithURL:[NSURL URLWithString:fm.imgsrc] placeholderImage:bgPhoto];        firstPhotoCell.myNameLabel.text = fm.title;    firstPhotoCell.myDataLabel.text =[NSString stringWithFormat:@"%@ 图集",[tools g_setTimerTime:fm.ptime]];            return firstPhotoCell;}else   if ([fm.skipType isEqualToString:@"special"]){         firstCell.myRatingLabel.text =[NSString stringWithFormat:@" %@ 专题",[tools g_setTimerTime:fm.ptime]];    firstCell.myDescriptionLabel.text = fm.digest;   }else  if ([fm.TAGS isEqualToString:@"视频"]){    firstCell.myRatingLabel.text =[NSString stringWithFormat:@" %@ %@",[tools g_setTimerTime:fm.ptime],fm.TAGS];    NSLog(@"视频%@",fm.title);}else   if ([fm.TAGS isEqualToString:@"正在直播"]){       NSLog(@"正在直播%@",fm.title);    firstCell.myRatingLabel.text =[NSString stringWithFormat:@" %@ %@",[tools g_setTimerTime:fm.ptime],fm.TAGS];}else{    firstCell.myRatingLabel.text =[NSString stringWithFormat:@"%@",[tools g_setTimerTime:fm.ptime]];}

#define  didSelectInfo     [self hideTabBar];FitstNewDayModel *fm =(FitstNewDayModel*) sender;if ([fm.TAGS isEqualToString:@"独家"]){    NSLog(@"独家%@",fm.title);    DujiaViewController *dujiaVC = [[DujiaViewController alloc] init];    [tools g_setupProgressHud:self];    [tools G_getNomaleData:fm.docid passValue:^(NSMutableArray *array) {        dujiaVC.G_getDataArr = array;        [tools.hud hide:YES];        [self.navigationController pushViewController:dujiaVC animated:YES];    }];    }else  if ([fm.TAGS isEqualToString:@"订阅"]){    DujiaViewController *dujiaVC = [[DujiaViewController alloc] init];    [tools g_setupProgressHud:self];    [tools G_getNomaleData:fm.docid passValue:^(NSMutableArray *array) {        dujiaVC.G_getDataArr = array;        [tools.hud hide:YES];        [self.navigationController pushViewController:dujiaVC animated:YES];    }];        NSLog(@"订阅%@",fm.title);}else  if ([fm.TAGS isEqualToString:@"合作"]){    DujiaViewController *dujiaVC = [[DujiaViewController alloc] init];    [tools g_setupProgressHud:self];    [tools G_getNomaleData:fm.docid passValue:^(NSMutableArray *array) {        dujiaVC.G_getDataArr = array;        [tools.hud hide:YES];        [self.navigationController pushViewController:dujiaVC animated:YES];    }];        NSLog(@"合作%@",fm.title);}else  if ([fm.TAGS isEqualToString:@"语音"]){        self.NomalVC = [[NomalViewController alloc] init];    [tools g_setupProgressHud:self];    [tools G_getNomaleData:fm.docid passValue:^(NSMutableArray *array) {        self.NomalVC.G_getDataArr = array;        [self.navigationController pushViewController:self.NomalVC animated:YES];    }];        NSLog(@"语音%@",fm.title);}else if ([fm.skipType isEqualToString:@"photoset"]){        NSLog(@"图集%@",fm.title);    [tools G_getNewDayData:fm.photosetID passValue:^(NSMutableArray *array)     {         NSLog(@"%ld",array.count);         self.photos = [NSMutableArray array];         MWPhoto *photo;                  MWPhotoBrowser *browser = [[MWPhotoBrowser alloc] initWithDelegate:self];         browser.displayActionButton = YES;         browser.displayNavArrows = NO;         browser.displaySelectionButtons = NO;         browser.alwaysShowControls = YES;         browser.zoomPhotosToFill = YES;         browser.enableGrid = YES;         browser.startOnGrid = YES;         browser.enableSwipeToDismiss = NO;         browser.autoPlayOnAppear = NO;                           for (int i = 0; i <array.count; i++) {             photoModel *pm = array[i];                        photo = [MWPhoto  photoWithURL:[NSURL URLWithString:pm.imgurl]];             photo.caption = [NSString stringWithFormat:@"%@",pm.note];             [self.photos addObject:photo];                          [self.tableView reloadData];         }                           int k = 0;                  NSLog(@"1111%d",k);         [browser setCurrentPhotoIndex:k];                [self.navigationController pushViewController:browser animated:YES];                                   }];}else   if ([fm.skipType isEqualToString:@"special"]){        SpeacilViewController *speacilVC = [[SpeacilViewController alloc] init];    [tools g_setupProgressHud:self];    [tools G_getSpecialData:fm.skipID passValue:^(NSMutableArray *array) {        speacilVC.sm =(SpecialModel *) array[0];        [tools.hud hide:YES ];        [self.navigationController pushViewController:speacilVC animated:YES];            }];            }else  if ([fm.TAGS isEqualToString:@"视频"]){        NSLog(@"%@",[fm.docid substringToIndex:16 ]);    if ([[fm.docid substringToIndex:16 ]isEqualToString:@"9IG74V5H00963VRO"]) {        [AlertShow alertShowWithContent:@"该新闻未找到" Seconds:1.f];        return;    }            self.NomalVC = [[NomalViewController alloc] init];    [tools g_setupProgressHud:self];    [tools G_getNomaleData:fm.docid passValue:^(NSMutableArray *array) {        self.NomalVC.G_getDataArr = array;        [self.navigationController pushViewController:self.NomalVC animated:YES];    }];        NSLog(@"视频%@",fm.title);}else   if ([fm.TAGS isEqualToString:@"正在直播"]){    [AlertShow alertShowWithContent:@"不能查看此新闻" Seconds:1.f];        NSLog(@"正在直播%@",fm.title);}else{    NSLog(@"-正常-%@",fm.title);    self.NomalVC = [[NomalViewController alloc] init];        [tools G_getNomaleData:fm.docid passValue:^(NSMutableArray *array) {        self.NomalVC.G_getDataArr = array;        [self.navigationController pushViewController:self.NomalVC animated:YES];    }];            }



#define  gscroll - (void)scrollViewDidScroll:(UIScrollView *)scrollView{    CGFloat y = scrollView.contentOffset.y;        if (y >=5) {        [self hideTabBar];    }else{        [self showTabBar];    }}- (void)showTabBar{    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;        delegate.tab.tabBar.hidden = NO;}- (void)hideTabBar {    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;        delegate.tab.tabBar.hidden = YES;    }


#define gButton     if (fm.docid  == NULL) {if (fm.skipID !=NULL) {    AVUser *currentUser = [AVUser currentUser];    if (currentUser != nil) {        [tools G_isStrat:fm.skipID type:@"skipID" isflag:^(BOOL isflag) {            self.isflog = isflag ;            [self.tableView reloadData];                        if(self.isflog == YES)            {                               [firstCell.dianzanButton setBackgroundImage:[UIImage imageNamed:@"like_sl"] forState:UIControlStateNormal];            }else            {          DoLog(@"<<<<<<<<<<<已收藏>>>>>>>>>");                [firstCell.dianzanButton setBackgroundImage:[UIImage imageNamed:@"like_wl"] forState:UIControlStateNormal];            }        }];        [firstCell.dianzanButton setBackgroundImage:[UIImage imageNamed:@"like_wl"] forState:UIControlStateNormal];    }    else    {        DoLog(@"未登录>>>>>>>>>");                    }    }}else if (fm.skipID == NULL){    if (fm.docid !=NULL) {        DoLog(@"<<<<<<<<<<<<1");                AVUser *currentUser = [AVUser currentUser];        if (currentUser != nil) {            [tools G_isStrat:fm.docid type:@"docid" isflag:^(BOOL isflag) {                self.isflog = isflag ;                                if(self.isflog == YES)                {                    DoLog(@"<<<<<<<<<<<<<2已收藏");                    [firstCell.dianzanButton setBackgroundImage:[UIImage imageNamed:@"like_sl"] forState:UIControlStateNormal];            }else                    {DoLog(@"<<<<<<<<<<<<<已收藏>>>>>>>>>>>>>>>>>>>>");                        [firstCell.dianzanButton setBackgroundImage:[UIImage imageNamed:@"like_wl"] forState:UIControlStateNormal];                    }                            }];            [firstCell.dianzanButton setBackgroundImage:[UIImage imageNamed:@"like_wl"] forState:UIControlStateNormal];        }        else        {            DoLog(@"<<<<<<<<<<<<<<未登录");         }           }}else{    if (fm.docid !=NULL) {        AVUser *currentUser = [AVUser currentUser];        if (currentUser != nil) {            [tools G_isStrat:fm.docid type:@"docid" isflag:^(BOOL isflag) {                self.isflog = isflag ;                                if(self.isflog == YES)                {                    DoLog(@"<<<<<<<<<<<<<2已收藏");                    [firstCell.dianzanButton setBackgroundImage:[UIImage imageNamed:@"like_sl"] forState:UIControlStateNormal];            }else                    {DoLog(@"<<<<<<<<<<<<<已收藏>>>>>>>>>>>>>>>>>>>>");                        [firstCell.dianzanButton setBackgroundImage:[UIImage imageNamed:@"like_wl"] forState:UIControlStateNormal];                    }                            }];            [firstCell.dianzanButton setBackgroundImage:[UIImage imageNamed:@"like_wl"] forState:UIControlStateNormal];        }        else        {            DoLog(@"<<<<<<<<<<<<<<未登录");    }      }   }


#define gStart AVUser *currentUser = [AVUser currentUser];if (currentUser != nil) {     FitstNewDayModel *fm =self.g_dataArr[sender.tag-100+3];   DoLog(@"gao%@==%@==%@===%@==%@",fm.title,fm.ptime, fm.TAGS,fm.docid,fm.skipID);    [tools G_setStart:fm.imgsrc title:fm.title tags:fm.TAGS ptime:fm.ptime docid:fm.docid skipID:fm.skipID skipType:fm.skipType];    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)( 1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{                if (fm.docid  == NULL) {            if (fm.skipID !=NULL) {                AVUser *currentUser = [AVUser currentUser];                if (currentUser != nil) {                    [tools G_isStrat:fm.skipID type:@"skipID" isflag:^(BOOL isflag) {                        self.isflog = isflag ;                                                if(self.isflog == YES)     {      NSIndexSet *indexSet=[[NSIndexSet alloc]initWithIndex:0];                            [self.tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];  } }]; }  else  { } }}  else if (fm.skipID == NULL)  {   if (fm.docid !=NULL) { AVUser *currentUser = [AVUser currentUser];                if (currentUser != nil) {                    [tools G_isStrat:fm.docid type:@"docid"isflag:^(BOOL isflag) {                        self.isflog = isflag ;                                                if(self.isflog == YES)                        {                                                       NSIndexSet *indexSet=[[NSIndexSet alloc]initWithIndex:0];                            [self.tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];      }   }];   } else  {                }            }        }else        {            if (fm.docid !=NULL) { AVUser *currentUser = [AVUser currentUser];                if (currentUser != nil) {                    [tools G_isStrat:fm.docid type:@"docid"isflag:^(BOOL isflag) {                        self.isflog = isflag ;                                                if(self.isflog == YES)                        {                                                       NSIndexSet *indexSet=[[NSIndexSet alloc]initWithIndex:0];   [self.tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];  }  }];    }  else { }} } });} else {    [AlertShow alertShowWithContent:@"请先登录" Seconds:1.f];}


#define g100 CGRectGetHeight([UIScreen mainScreen].bounds)/6.6
#define g200 CGRectGetHeight([UIScreen mainScreen].bounds)/3.3























#define gHeight  if (indexPath.row ==0) {return gHeigth;}return CGRectGetHeight(self.view.frame)/6;

#define gHeigth CGRectGetHeight(self.view.frame)/3


/** 输出*/
#ifdef DEBUG
#define DoLog(...) NSLog(__VA_ARGS__)
#else
#define DoLog(...)
#endif


















//TODO 提示
#define STRINGIFY(S) #S
#define DEFER_STRINGIFY(S) STRINGIFY(S)
#define PRAGMA_MESSAGE(MSG) _Pragma(STRINGIFY(message(MSG)))
#define FORMATTED_MESSAGE(MSG) "[TODO-" DEFER_STRINGIFY(__COUNTER__) "] " MSG " \n" \
DEFER_STRINGIFY(__FILE__) " line " DEFER_STRINGIFY(__LINE__)
#define KEYWORDIFY try {} @catch (...) {}
// 最终使用下面的宏
#define TODO(MSG) KEYWORDIFY PRAGMA_MESSAGE(FORMATTED_MESSAGE(MSG))


#endif

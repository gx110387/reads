//
//  G_getDataTools.h
//  reads
//
//  Created by lanou3g on 15/11/4.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>
@class MBProgressHUD;

typedef void(^pushArr)(NSMutableArray *array);
typedef void(^G_isStart)(BOOL isflag);

@interface G_getDataTools : NSObject
@property (nonatomic,retain) MBProgressHUD * hud;
@property(nonatomic,assign)BOOL isFlag;
+(instancetype)shareGetdata;
#pragma mark 得到今日头条首页的数据
-(void)G_getNewInfoData:(NSInteger)num forword:(NSInteger)count passValue:(pushArr)value;

#pragma mark 得到娱乐首页的数据
-(void)G_getPlayInfoData:(NSInteger)num forword:(NSInteger)count passValue:(pushArr)value;
#pragma mark 得到科技首页的数据
-(void)G_getKejiInfoData:(NSInteger)num forword:(NSInteger)count passValue:(pushArr)value;
#pragma mark 得到财经首页的数据
-(void)G_getCaijingInfoData:(NSInteger)num forword:(NSInteger)count passValue:(pushArr)value;
#pragma mark 得到体育首页的数据
-(void)G_getTiyuInfoData:(NSInteger)num forword:(NSInteger)count passValue:(pushArr)value;
#pragma mark 得到汽车首页的数据
-(void)G_getCarInfoData:(NSInteger)num forword:(NSInteger)count passValue:(pushArr)value;
#pragma mark 得到北京首页的数据
-(void)G_getBeiInfoData:(NSInteger)num forword:(NSInteger)count passValue:(pushArr)value;
#pragma mark 得到教育首页的数据
-(void)G_getEduInfoData:(NSInteger)num forword:(NSInteger)count passValue:(pushArr)value;
#pragma mark 得到数码首页的数据
-(void)G_getShumaInfoData:(NSInteger)num forword:(NSInteger)count passValue:(pushArr)value;
#pragma mark 得到旅游首页的数据
-(void)G_getTripsInfoData:(NSInteger)num forword:(NSInteger)count passValue:(pushArr)value;


#pragma mark 得到首页照片的数据
-(void)G_getNewDayData:(NSString *)id1 passValue:(pushArr)value;

#pragma mark-得到正常新闻的数据
-(void)G_getNomaleData:(NSString *)id1 passValue:(pushArr)value;

#pragma mark -得到专题的分组数据
-(void)G_getSpecialData:(NSString *)id1 passValue:(pushArr)value;

#pragma mark -得到最近的时间
-(NSString *)g_setTimerTime:(NSString *)str;

#pragma mark -得到字符串的高度
-(CGFloat)G_heightForString:(NSString *)aString;

#pragma mark -得到时间具体到分
-(NSString *)g_setTimerjuti:(NSString *)str;

#pragma mark 小菊花
- (void)g_setupProgressHud:(UIViewController *)sender;

//////////
#pragma  mark第二页的数据
-(void)G_getNewSecondInfo:(NSString *)identifier forword:(NSInteger)forword count:(NSInteger)count passValue:(pushArr)value;

#pragma mark - 得到具体的年月日
-(NSString *)g_setTimeYear;
////
#pragma  mark - 得到第三页照片的数据
-(void)G_getThreeDataInfoStart:(NSString *)date  passValue:(pushArr)value;

-(void)G_getThreeDataInfo:(pushArr)value;
#pragma  mark - 得到第三页内容的数据
-(void)G_getThreeDataInfo:(NSInteger)id1 passValue:(pushArr)value;


#pragma mark 设置用户名
-(void)setUserLogin:(UserLoginModel*)sender;

#pragma mark 通过传进来的数字来计算日期
-(NSString *)setNumToStringDate:(NSInteger)num;
#pragma mark 取出用户名
-(NSString *)getUserLogin;
#pragma mark 设置签名
-(void)setUserLabel:(NSString *)text;
#pragma mark 取出签名
-(NSString  *)getUserLabel;

#pragma mark -收藏 // 网址 // 标题 // TAGS类型 // 时间 // docid // skipID//

-(void)G_setStart:(NSString *)url title:(NSString *)title tags:(NSString*)tags ptime:(NSString*)ptime docid:(NSString *)dpcid skipID:(NSString *)skipID skipType:(NSString *)skipType;
#pragma mark  查询收藏 高星
-(void)G_selectStart:(NSInteger)forwardNum count:(NSInteger)count value:(pushArr)passValue;

#pragma mark 是否收藏 高星

-(void)G_isStrat:(NSString *)id1 type:(NSString*)type isflag:(G_isStart)isflag;

#pragma mark - 收藏文章

-(void)G_setReads:(NSString *)title ptime:(NSString *)ptime url:(NSString *)url;


#pragma mark - 查询收藏
-(void)G_selectReads:(NSInteger)forwardNum count:(NSInteger)count value:(pushArr)passValue;

#pragma mark - 是否收藏
-(void)G_isReads:(NSString *)ptime  isflag:(G_isStart)isflag;


@property(nonatomic,assign)NSInteger num;
@end

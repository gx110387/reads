//
//  ReadOfOneModel.h
//  reads
//
//  Created by lanou3g on 15/11/11.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ReadOfOneModel : NSObject
@property(nonatomic,strong)NSString *sWebLk; // webVIew的网址
@property(nonatomic,strong)NSString *strAuthor; // 作者
@property(nonatomic,strong)NSString *strContent; // 内容
@property(nonatomic,strong)NSString *strDayDiffer;
@property(nonatomic,strong)NSString *strHpId;
@property(nonatomic,strong)NSString *strHpTitle; // 标题
@property(nonatomic,strong)NSString *strLastUpdateDate; // 发布时间
@property(nonatomic,strong)NSString *strMarketTime; // 今天
@property(nonatomic,strong)NSString *strOriginalImgUrl; // 图片
@property(nonatomic,strong)NSString *strPn; //
@property(nonatomic,strong)NSString *strThumbnailUrl;
@property(nonatomic,strong)NSString *wImgUrl; // 缩略图~


@end

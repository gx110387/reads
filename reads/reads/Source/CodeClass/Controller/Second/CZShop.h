//
//  CZShop.h
//  02-自定义流水布局(瀑布流)
//
//  Created by 刘超 on 15/10/18.
//  Copyright © 2015年  All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface CZShop : NSObject




//高
@property (nonatomic, assign)CGFloat  h;
//宽
@property (nonatomic, assign)CGFloat  w;
//图片的URL
@property (nonatomic, copy) NSString *img;
//商品的价格
@property (nonatomic, strong) NSString *pixel;
@property(nonatomic,assign)CGFloat weight;
@property(nonatomic,assign)CGFloat height;

@property(nonatomic,strong)NSString *alias;
@property(nonatomic,strong)NSString *cid;
@property(nonatomic,strong)NSString *docid;// 重复.有用
@property(nonatomic,strong)NSString *ename;
@property(nonatomic,strong)NSString *hasAD;
@property(nonatomic,strong)NSString *hasHead;
@property(nonatomic,strong)NSString *imgsrc;//// 重复.有用
@property(nonatomic,strong)NSString *lmodify;// 重复.有用
@property(nonatomic,strong)NSString *photosetID;
@property(nonatomic,strong)NSString *priority;// 重复.有用
@property(nonatomic,strong)NSString *ptime;// 重复.有用
@property(nonatomic,strong)NSString *replyCount;// 重复.有用
@property(nonatomic,strong)NSString *skipID;
@property(nonatomic,strong)NSString *skipType;///
@property(nonatomic,strong)NSString *title;//// 重复.有用
@property(nonatomic,strong)NSString *tname;//
@property(nonatomic,strong)NSArray *imgextra;

///////////////////头条第二个
@property(nonatomic,strong)NSString *subtitle;
@property(nonatomic,strong)NSString *boardid;
@property(nonatomic,strong)NSString *digest;///有用
@property(nonatomic,strong)NSString *source;
@property(nonatomic,strong)NSString *TAG;
@property(nonatomic,strong)NSString *TAGS;
@property(nonatomic,strong)NSString *votecount;///

@property(nonatomic,strong)NSString *url;//

- (instancetype)initWithDict:(NSDictionary *)dict;

+ (instancetype)shopWithDict:(NSDictionary *)dict;

@end

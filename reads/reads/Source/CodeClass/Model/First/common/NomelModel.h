//
//  NomelModel.h
//  reads
//
//  Created by lanou3g on 15/11/5.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NomelModel : NSObject
@property(nonatomic,strong)NSString *body;//
@property(nonatomic,strong)NSString *digest;
@property(nonatomic,strong)NSString *dkeys;
@property(nonatomic,strong)NSString *docid;
@property(nonatomic,strong)NSString *hasNext;
@property(nonatomic,strong)NSArray *img;
@property(nonatomic,strong)NSArray *keyword_search;
@property(nonatomic,strong)NSString *ptime;//
@property(nonatomic,strong)NSArray *relative_sys;
@property(nonatomic,strong)NSString *replyBoard;
@property(nonatomic,strong)NSString *replyCount;
@property(nonatomic,strong)NSString *source;
@property(nonatomic,strong)NSString *source_url;
@property(nonatomic,strong)NSArray *video;

@property(nonatomic,strong)NSString *title;//
////


@end

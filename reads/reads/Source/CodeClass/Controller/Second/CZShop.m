//
//  CZShop.m
//  02-自定义流水布局(瀑布流)
//
//  Created by 刘超 on 15/10/18.
//  Copyright © 2015年  All rights reserved.
//

#import "CZShop.h"

@implementation CZShop

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)shopWithDict:(NSDictionary *)dict
{

    return [[self alloc]initWithDict:dict];

}

@end

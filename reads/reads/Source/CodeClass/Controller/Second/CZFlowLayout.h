//
//  CZFlowLayout.h
//  02-自定义流水布局(瀑布流)
//
//  Created by 刘超 on 15/10/18.
//  Copyright © 2015年  All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CZFlowLayout : UICollectionViewFlowLayout



@property (nonatomic, assign) int  colCount;

@property (nonatomic, strong) NSArray *shops;

@end
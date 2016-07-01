//
//  CZFlowLayout.m
//  02-自定义流水布局(瀑布流)
//
//  Created by 刘超 on 15/10/18.
//  Copyright © 2015年  All rights reserved.
//

#import "CZFlowLayout.h"

#import "CZShop.h"

@interface CZFlowLayout ()

@property (nonatomic, strong) NSMutableArray *arr;

@end

@implementation CZFlowLayout

- (NSMutableArray *)arr
{
    if (_arr == nil) {
        
        _arr = [NSMutableArray array];
    }

    return _arr;
}


//当collectionView修改布局的时候会掉用次方法
//一般在这个方法里面,设置准备工作, 如 itemSize  滚动方向  内边距 如果不设置,则默认是sb中设置的数值

- (void)prepareLayout
{
    [super prepareLayout];
    
   NSMutableArray *arr = [NSMutableArray array];
    //内容的宽度
    CGFloat contentW = self.collectionView.frame.size.width - self.sectionInset.left - self.sectionInset.right - (self.colCount - 1) * self.minimumInteritemSpacing;
    //item的宽度
    CGFloat itemW = contentW / self.colCount;
    
    CGFloat itemH = 0;
    
    //定义C语言数组
    CGFloat colHeight[self.colCount];
    
    for (int j = 0; j < self.colCount; j ++) {
        
        colHeight[j] = self.sectionInset.top;
    }
    
    
    //遍历数组
    
    for (int i = 0; i < self.shops.count; i ++) {
        
        CZShop *shop = self.shops[i];
        
        
        
       // NSLog(@">>>>>%@",self.shops[i]);
        
        // 数组存放被切割的像素
        if (shop.pixel !=NULL) {
            NSArray *pixel = [shop.pixel componentsSeparatedByString:@"*"];
            CGFloat width = [[pixel firstObject]floatValue];
            CGFloat height = [[pixel lastObject]floatValue];
            itemH = height / width  * itemW;
           // NSLog(@"itemH %fheight %fwidth %fitemW %fheight / width %f",itemH,height,width,itemW,height / width);
            if (itemH <150) {
               itemH = itemH *2;
            }
        }else
        {
            itemH = arc4random()%200+150;
        }
        //创建 UICollectionViewLayoutAttributes对象  保存每个item的frame
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        
        UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes  layoutAttributesForCellWithIndexPath:indexPath];
        
        
        //获取行高最短的一列   保证添加一个item的时候,添加在最短的那一列上面
        CGFloat temp = colHeight[0];
        
        int min = 0;
        
        for (int a = 1; a < self.colCount; a++) {
            
            if (temp >colHeight[a]) {
                
                temp = colHeight[a];
                
                min = a;
              }
        }

        
        //特别注意  放在哪个位置  也就是第几列 和 X,Y 值都有联系
        CGFloat itemX = self.sectionInset.left + min * (self.minimumInteritemSpacing   + itemW);
        attributes.frame = CGRectMake(itemX, temp, itemW, itemH);
        
        colHeight[min] = temp + itemH  + self.minimumLineSpacing;
        
        [arr addObject:attributes];
        
    }
    
    
    //判断哪一列最高
    CGFloat maxHeight = 0;
    
    for ( int j = 0; j <self.colCount; j ++) {
        
        
        if (maxHeight < colHeight[j]) {
            
            maxHeight = colHeight[j];
        }
    }
    
    
    //判断一列有多少个item
//    
//    int line = 0;
//    
//    if (self.shops.count  % self.colCount == 0 ) {
//        
//        line = (int)self.shops.count / self.colCount;
//    }else{
//    
//        line  = (int)self.shops.count /  self.colCount + 1;
//        
//    }
//
   
    
    //计算总数 total
    
    int total;
    
    for (int q = 0; q < MAXFLOAT; q ++) {
        
        if (((int)self.shops.count + q ) % self.colCount == 0) {
            
            total = (int)self.shops.count + q;
            break;
        }
    }
    
    //滚动范围由itemSize决定  设置不准确导致滚动范围有差距  如有问题,请私聊
    self.itemSize = CGSizeMake(itemW, (maxHeight - self.sectionInset.top) * self.colCount / total);
    
    
    NSIndexPath *footerIndexPath = [NSIndexPath indexPathForItem:0 inSection:0];
    
    UICollectionViewLayoutAttributes *footerAtt = [UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionFooter withIndexPath:footerIndexPath];
    
    footerAtt.frame = CGRectMake(0, maxHeight, self.collectionView.frame.size.width, 100);
    
    [arr addObject:footerAtt];

    
    self.arr = arr;
}



//返回一个数组  数组里面盛放的是  UICollectionViewLayoutAttributes 对象  布局属性
//UICollectionViewLayoutAttributes  里面的frame 正好对应item的frame
//是根据 itemSize 自动算出来的 如果想改变每个的位置,提前计算出来,并且创建 布局属性保存
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    
//
  // NSArray *arr =  [super layoutAttributesForElementsInRect:CGRectMake(0, 0, self.collectionView.frame.size.width, self.collectionView.contentSize.height)];
//   
//    if (![self.arr  containsObject:arr.lastObject]) {
//        [self.arr  addObject:arr.lastObject];
//    }
//    
    
    

  // NSLog(@"%@",self.arr);
    
    return  self.arr;
}

@end

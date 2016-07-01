//
//  CZCollectionViewCell.m
//  02-自定义流水布局(瀑布流)
//
//  Created by 刘超 on 15/10/18.
//  Copyright © 2015年  All rights reserved.
//

#import "CZCollectionViewCell.h"
#import "CZShop.h"
#import "UIImageView+WebCache.h"
@interface CZCollectionViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@end
@implementation CZCollectionViewCell


- (void)setShop:(CZShop *)shop
{
    _shop = shop;
    
    self.priceLabel.text = [NSString stringWithFormat:@"%@",shop.title];
    
    if ([shop.imgsrc isEqualToString:@""]) {
        self.imageView .image = [UIImage imageNamed:@"suolvtu"];
        
    }else
    {
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:shop.imgsrc] placeholderImage:bgPhoto];
    }
}

@end

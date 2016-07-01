//
//  UserImageView.m
//  reads
//
//  Created by lanou3g on 15/11/13.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "UserImageView.h"

@implementation UserImageView

//- (instancetype)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//        [self G_setupView];
//    }
//    return self;
//}
//-(void)G_setupView
//{
//
//    
//    self.myImage = [[UIImageView alloc] init];
//}
-(UIImageView *)myImage
{
    if (_myImage == nil) {
        _myImage = [[UIImageView alloc] init];
       
        [self addSubview: _myImage];
    }
    return _myImage;

}

-(UILabel *)myLabel
{
    if (_myLabel == nil) {
        _myLabel = [[UILabel alloc] init];
        _myLabel.textAlignment = NSTextAlignmentCenter;
        
        [self addSubview: _myLabel];
    }
    return _myLabel;
    
}
@end

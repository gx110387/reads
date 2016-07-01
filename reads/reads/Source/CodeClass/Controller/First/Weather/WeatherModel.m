//
//  WeatherModel.m
//  reads
//
//  Created by lanou3g on 15/11/10.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "WeatherModel.h"

@implementation WeatherModel
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
    if ([key isEqualToString:@"北京|北京"]) {
        self.deailArr = value;
    }
}
@end

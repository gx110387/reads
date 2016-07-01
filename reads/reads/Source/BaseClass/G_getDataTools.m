//
//  G_getDataTools.m
//  reads
//
//  Created by lanou3g on 15/11/4.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "G_getDataTools.h"

static G_getDataTools *gd = nil;
@interface G_getDataTools ()
@property(nonatomic,strong)NSMutableArray *G_getNewInfoArr;
@property(nonatomic,strong)NSMutableArray *G_getNewTouArr;
@property(nonatomic,strong)NSMutableArray *G_getNomelTouArr;
@property(nonatomic,strong)NSMutableArray *G_getSpecialArr;

@end


@implementation G_getDataTools


+(instancetype)shareGetdata
{
    
    if (gd==nil) {
        static dispatch_once_t token;
        dispatch_once(&token, ^{
            gd = [[G_getDataTools alloc] init];
        });
    }
    return gd;
}
#pragma  mark 封装处理数据 返回数组
-(void)G_setHttpToJson:(NSString *)url passValue:(pushArr)value
{
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc]initWithRequest:request];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSString *html = operation.responseString;
        NSData* data=[html dataUsingEncoding:NSUTF8StringEncoding];
         if (data != 0) {
      NSMutableArray *array =[NSJSONSerialization  JSONObjectWithData:data options:0 error:nil];
        
        value(array);
         }
    }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"发生错误！%@",error);
        
    }];
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue addOperation:operation];

}

#pragma mark 得到今日头条首页的数据
-(void)G_getNewInfoData:(NSInteger)num forword:(NSInteger)count passValue:(pushArr)value
{
    
    NSString *url = [NSString stringWithFormat:@"http://c.3g.163.com/nc/article/headline/T1348647853363/%ld-%ld.html",num,count];
    NSLog(@"%@",url);
  

    self.G_getNewInfoArr = [NSMutableArray array];
  [self G_setHttpToJson:url passValue:^(NSMutableArray *array) {
      
      for (NSDictionary *dict in [array valueForKey:@"T1348647853363"]) {
          FitstNewDayModel *FM = [[FitstNewDayModel alloc] init];
          [FM setValuesForKeysWithDictionary:dict];
          
          [self.G_getNewInfoArr addObject:FM];
          
      }
      value(self.G_getNewInfoArr);
  }];
   
}
#pragma mark 得到娱乐首页的数据
-(void)G_getPlayInfoData:(NSInteger)num forword:(NSInteger)count passValue:(pushArr)value
{
    
    NSString *url = [NSString stringWithFormat:@"http://c.3g.163.com/nc/article/list/T1348648517839/%ld-%ld.html",num,count];
    NSLog(@"%@",url);
   // http://c.3g.163.com/nc/article/list/T1348648517839/0-40.html
    
    self.G_getNewInfoArr = [NSMutableArray array];
    [self G_setHttpToJson:url passValue:^(NSMutableArray *array) {
        
        for (NSDictionary *dict in [array valueForKey:@"T1348648517839"]) {
            FitstNewDayModel *FM = [[FitstNewDayModel alloc] init];
            [FM setValuesForKeysWithDictionary:dict];
            
            [self.G_getNewInfoArr addObject:FM];
            
        }
        value(self.G_getNewInfoArr);
    }];

    
}
#pragma mark 得到科技首页的数据
-(void)G_getKejiInfoData:(NSInteger)num forword:(NSInteger)count passValue:(pushArr)value
{
    // 科技 http://c.3g.163.com/nc/article/list/T1348649580692/0-40.html
    NSString *url = [NSString stringWithFormat:@"http://c.3g.163.com/nc/article/list/T1348649580692/%ld-%ld.html",num,count];
    NSLog(@"%@",url);
  
    
    self.G_getNewInfoArr = [NSMutableArray array];
    [self G_setHttpToJson:url passValue:^(NSMutableArray *array) {
        
        for (NSDictionary *dict in [array valueForKey:@"T1348649580692"]) {
            FitstNewDayModel *FM = [[FitstNewDayModel alloc] init];
            [FM setValuesForKeysWithDictionary:dict];
            
            [self.G_getNewInfoArr addObject:FM];
            
        }
        value(self.G_getNewInfoArr);
    }];

   
}
#pragma mark 得到财经首页的数据
-(void)G_getCaijingInfoData:(NSInteger)num forword:(NSInteger)count passValue:(pushArr)value
{
    ////财经   http://c.3g.163.com/nc/article/list/T1348648756099/0-40.html
    NSString *url = [NSString stringWithFormat:@"http://c.3g.163.com/nc/article/list/T1348648756099/%ld-%ld.html",num,count];
    NSLog(@"%@",url);
    
    
    self.G_getNewInfoArr = [NSMutableArray array];
    [self G_setHttpToJson:url passValue:^(NSMutableArray *array) {
        
        for (NSDictionary *dict in [array valueForKey:@"T1348648756099"]) {
            FitstNewDayModel *FM = [[FitstNewDayModel alloc] init];
            [FM setValuesForKeysWithDictionary:dict];
            
            [self.G_getNewInfoArr addObject:FM];
            
        }
        value(self.G_getNewInfoArr);
    }];
    

}
#pragma mark 得到体育首页的数据
-(void)G_getTiyuInfoData:(NSInteger)num forword:(NSInteger)count passValue:(pushArr)value
{
    //http://c.3g.163.com/nc/article/list/T1348649079062/0-40.html
    NSString *url = [NSString stringWithFormat:@"http://c.3g.163.com/nc/article/list/T1348649079062/%ld-%ld.html",num,count];
    NSLog(@"%@",url);
    
    
    self.G_getNewInfoArr = [NSMutableArray array];
    [self G_setHttpToJson:url passValue:^(NSMutableArray *array) {
        
        for (NSDictionary *dict in [array valueForKey:@"T1348649079062"]) {
            FitstNewDayModel *FM = [[FitstNewDayModel alloc] init];
            [FM setValuesForKeysWithDictionary:dict];
            
            [self.G_getNewInfoArr addObject:FM];
            
        }
        value(self.G_getNewInfoArr);
    }];
    

}
#pragma mark 得到汽车首页的数据
-(void)G_getCarInfoData:(NSInteger)num forword:(NSInteger)count passValue:(pushArr)value
{
    // 汽车  http://c.3g.163.com/nc/article/list/T1348654060988/0-40.html

    NSString *url = [NSString stringWithFormat:@"http://c.3g.163.com/nc/article/list/T1348654060988/%ld-%ld.html",num,count];
    NSLog(@"%@",url);
    
    
    self.G_getNewInfoArr = [NSMutableArray array];
    [self G_setHttpToJson:url passValue:^(NSMutableArray *array) {
        
        for (NSDictionary *dict in [array valueForKey:@"T1348654060988"]) {
            FitstNewDayModel *FM = [[FitstNewDayModel alloc] init];
            [FM setValuesForKeysWithDictionary:dict];
            
            [self.G_getNewInfoArr addObject:FM];
            
        }
        value(self.G_getNewInfoArr);
    }];
    

    
}

#pragma mark 得到北京首页的数据
-(void)G_getBeiInfoData:(NSInteger)num forword:(NSInteger)count passValue:(pushArr)value
{
    
    NSString *url = [NSString stringWithFormat:@"http://c.3g.163.com/nc/article/local/5YyX5Lqs/%ld-%ld.html",num,count];
    NSLog(@"%@",url);
    
    
    self.G_getNewInfoArr = [NSMutableArray array];
    [self G_setHttpToJson:url passValue:^(NSMutableArray *array) {
        
        for (NSDictionary *dict in [array valueForKey:@"北京"]) {
            FitstNewDayModel *FM = [[FitstNewDayModel alloc] init];
            [FM setValuesForKeysWithDictionary:dict];
            
            [self.G_getNewInfoArr addObject:FM];
            
        }
        value(self.G_getNewInfoArr);
    }];

}



#pragma mark 得到教育首页的数据
-(void)G_getEduInfoData:(NSInteger)num forword:(NSInteger)count passValue:(pushArr)value
{
    NSString *url = [NSString stringWithFormat:@"http://c.m.163.com/nc/article/list/T1348654225495/%ld-%ld.html",num,count];
    NSLog(@"%@",url);
    
    
    self.G_getNewInfoArr = [NSMutableArray array];
    [self G_setHttpToJson:url passValue:^(NSMutableArray *array) {
        
        for (NSDictionary *dict in [array valueForKey:@"T1348654225495"]) {
            FitstNewDayModel *FM = [[FitstNewDayModel alloc] init];
            [FM setValuesForKeysWithDictionary:dict];
            
            [self.G_getNewInfoArr addObject:FM];
            
        }
        value(self.G_getNewInfoArr);
    }];

}
#pragma mark 得到数码首页的数据
-(void)G_getShumaInfoData:(NSInteger)num forword:(NSInteger)count passValue:(pushArr)value
{
    NSString *url = [NSString stringWithFormat:@"http://c.m.163.com/nc/article/list/T1348649776727/%ld-%ld.html",num,count];
    NSLog(@"%@",url);
    
    
    self.G_getNewInfoArr = [NSMutableArray array];
    [self G_setHttpToJson:url passValue:^(NSMutableArray *array) {
        
        for (NSDictionary *dict in [array valueForKey:@"T1348649776727"]) {
            FitstNewDayModel *FM = [[FitstNewDayModel alloc] init];
            [FM setValuesForKeysWithDictionary:dict];
            
            [self.G_getNewInfoArr addObject:FM];
            
        }
        value(self.G_getNewInfoArr);
    }];

}
#pragma mark 得到旅游首页的数据
-(void)G_getTripsInfoData:(NSInteger)num forword:(NSInteger)count passValue:(pushArr)value
{
    NSString *url = [NSString stringWithFormat:@"http://c.m.163.com/nc/article/list/T1348654204705/%ld-%ld.html",num,count];
    NSLog(@"%@",url);
    
    
    self.G_getNewInfoArr = [NSMutableArray array];
    [self G_setHttpToJson:url passValue:^(NSMutableArray *array) {
        
        for (NSDictionary *dict in [array valueForKey:@"T1348654204705"]) {
            FitstNewDayModel *FM = [[FitstNewDayModel alloc] init];
            [FM setValuesForKeysWithDictionary:dict];
            
            [self.G_getNewInfoArr addObject:FM];
            
        }
        value(self.G_getNewInfoArr);
    }];

    
}


#pragma mark 得到首页照片的数据
-(void)G_getNewDayData:(NSString *)id1 passValue:(pushArr)value
{
    
    NSString *two = [id1 substringFromIndex:4];
    NSArray *three = [two componentsSeparatedByString:@"|"];
    
    NSString *url = [NSString stringWithFormat:@"http://c.m.163.com/photo/api/set/%@/%@.json",[three firstObject],[three lastObject]];
     NSLog(@"%@",url);
    self.G_getNewTouArr = [NSMutableArray array];
    
    [self G_setHttpToJson:url passValue:^(NSMutableArray *array) {
        for (NSDictionary *dict in [array valueForKey:@"photos"]) {
            photoModel *pm = [[photoModel alloc] init];
            [pm setValuesForKeysWithDictionary:dict];
            [self.G_getNewTouArr addObject:pm];
        }
        value(self.G_getNewTouArr);

    }];
   }



#pragma  mark第二页的数据
-(void)G_getNewSecondInfo:(NSString *)identifier forword:(NSInteger)forword count:(NSInteger)count passValue:(pushArr)value
{
    
    
    NSString *url = [NSString stringWithFormat:@"http://c.m.163.com/nc/article/list/%@/%ld-%ld.html",identifier,forword,count];
    NSLog(@"%@",url);
    
    
    self.G_getNewInfoArr = [NSMutableArray array];
    [self G_setHttpToJson:url passValue:^(NSMutableArray *array) {
        
        for (NSDictionary *dict in [array valueForKey:identifier]) {
            FitstNewDayModel *FM = [[FitstNewDayModel alloc] init];
            [FM setValuesForKeysWithDictionary:dict];
            
            [self.G_getNewInfoArr addObject:FM];
            
        }
        value(self.G_getNewInfoArr);
    }];

    
    
    
    
}
#pragma mark-得到正常新闻的数据 // 独家
-(void)G_getNomaleData:(NSString *)id1 passValue:(pushArr)value
{
 NSString *urlPath = [NSString stringWithFormat:@"http://c.m.163.com/nc/article/%@/full.html",id1];
  // NSString *urlPath =[NSString stringWithFormat:@"http://c.m.163.com/nc/article/B7IDNTGV00963VRO/full.html"];
    NSLog(@"%@",urlPath);
    self.G_getNomelTouArr = [NSMutableArray array];
    
    [self G_setHttpToJson:urlPath passValue:^(NSMutableArray *array) {
        NomelModel *nm = [[NomelModel alloc] init];
        [nm setValuesForKeysWithDictionary:[array valueForKey:id1]];
        [self.G_getNomelTouArr  addObject:nm];
        
        value(self.G_getNomelTouArr);
        
    }];

    
    
}


#pragma mark -得到专题的分组数据
-(void)G_getSpecialData:(NSString *)id1 passValue:(pushArr)value
{
    self.G_getSpecialArr = [NSMutableArray array];
    NSString *url = [NSString stringWithFormat:@"http://c.m.163.com/nc/special/%@.html",id1];
    NSLog(@"%@",url);
    [self G_setHttpToJson:url passValue:^(NSMutableArray *array) {
        
        
            SpecialModel *sm = [SpecialModel alloc];
             [sm setValuesForKeysWithDictionary:[array valueForKey:id1]];
        
              [self.G_getSpecialArr addObject:sm];
        
          value(self.G_getSpecialArr);
    }];
    
    
}


#pragma mark -得到时间,具体到时
-(NSString *)g_setTimerjuti:(NSString *)str
{
    NSDateFormatter *f2 = [[NSDateFormatter alloc] init];
    [f2 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date4 = [f2 dateFromString:str];
    NSString *s =[NSString stringWithFormat:@"%@",date4];
    NSString *t = [s substringToIndex:16];
        return t;
}
#pragma mark -得到最近的时间
-(NSString *)g_setTimerTime:(NSString *)str
{
    
    NSDate *date3 = [NSDate date];
    
    NSTimeZone *zone2 = [[NSTimeZone alloc] init];
    zone2 = [NSTimeZone localTimeZone];
    
   // NSInteger nowTime = [zone2 secondsFromGMT];
    
  // NSDate *date5 = [date3 initWithTimeIntervalSinceNow:nowTime];
    
    // NSLog(@"当前时间:%@",date5);
    
    NSDateFormatter *f2 = [[NSDateFormatter alloc] init];
    [f2 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date4 = [f2 dateFromString:str];
    NSTimeInterval time2 = [date3 timeIntervalSinceDate:date4];
    // NSLog(@"新闻时间%@",str);
    // NSDate *fixedDate = [date4 dateByAddingTimeInterval:60*60*9];
    //  NSLog(@"时间差%f",time2);
    if (time2<=60) {
        NSLog(@"刚刚");
        
        return [NSString stringWithFormat:@"刚刚"];
    }else if(time2 >60 &&time2 <3600){
        //  NSLog(@"%f分钟前",time2/60);
        return [NSString stringWithFormat:@"%.0f分钟前",time2/60];
    }else if(time2 >3600 && time2 <3600*24)
    {
        //  NSLog(@"%f小时前",time2/60/60);
        return [NSString stringWithFormat:@"%.0f小时前",time2/60/60];
    }else if (time2 >3600*24 && time2 <3600*24*30)
    {
        //  NSLog(@"%f天前",time2/60/60);
        return [NSString stringWithFormat:@"%.0f天前",time2/60/60/24];
    }else
    {
         return [NSString stringWithFormat:@"%.0f月前",time2/60/60/24/30];
    }
    
}
#pragma mark -得到字符串的高度
-(CGFloat)G_heightForString:(NSString *)aString
{
    NSDictionary *dict = @{NSFontAttributeName:[UIFont systemFontOfSize:17.2]};// 一定要大于等于实际的字体
    //将传进来的字符串放在一个矩形中
    CGRect rect = [aString boundingRectWithSize:CGSizeMake(CGRectGetWidth([UIScreen mainScreen].bounds)-20, 16000) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
    return rect.size.height;
}

#pragma mark 小菊花
- (void)g_setupProgressHud:(UIViewController *)sender
{
//    NSInteger s = 0;
//    NSString *s  = [NSString stringWithFormat:@"http://app6.117go.com/demo27/php/interestAction.php?length=20&start=6863165_%ld&submit=getPlaza6_2&v=a6.4.2",num];
    self.hud = [[MBProgressHUD alloc] initWithView:sender.view] ;
    _hud.frame = sender.view.bounds;
    _hud.minSize = CGSizeMake(100, 100);
    _hud.mode = MBProgressHUDModeIndeterminate;
    [sender.view addSubview:_hud];
    
    [_hud show:YES];
}

#pragma mark - 得到具体的年月日
-(NSString *)g_setTimeYear
{
    
    NSDate *date3 = [NSDate date];
    
    NSTimeZone *zone2 = [[NSTimeZone alloc] init];
    zone2 = [NSTimeZone localTimeZone];
    
    NSInteger nowTime = [zone2 secondsFromGMT];
    
    NSDate *date5 = [date3 initWithTimeIntervalSinceNow:nowTime];
    
    
    NSString*str = [NSString stringWithFormat:@"%@",date5];
    
    return [str substringToIndex:10];
}
#pragma mark 通过传进来的数字来计算日期
-(NSString *)setNumToStringDate:(NSInteger)num
{
    
   // NSInteger Now =   60*60*60*24;
    
    
    
    
    
    return nil;
}

#pragma mark 设置用户名

-(void)setUserLogin:(UserLoginModel*)sender
{
    NSUserDefaults *user = [[NSUserDefaults alloc] init];
    [user setObject:sender.username forKey:@"Entity"];
    
    
}

#pragma mark 取出用户名
-(NSString *)getUserLogin
{
    NSUserDefaults *user =[[NSUserDefaults alloc] init];
    
    return  [user objectForKey:@"Entity" ];
}


#pragma mark 设置签名
-(void)setUserLabel:(NSString *)text
{
    NSUserDefaults *user = [[NSUserDefaults alloc] init];
    [user setObject:text forKey:[self getUserLogin]];
    
}
#pragma mark 取出签名
-(NSString *)getUserLabel
{
    NSUserDefaults *user =[[NSUserDefaults alloc] init];
    
    return  [user objectForKey:[self getUserLogin] ];
    
}

#pragma  mark - 得到第三页照片的数据
-(void)G_getThreeDataInfoStart:(NSString *)date  passValue:(pushArr)value
{    //http://rest.wufazhuce.com/OneForWeb/one/getHp_N?strDate=2015-10-14&strRow=1
    DoLog(@"未做");
    NSString *url = [NSString stringWithFormat:@"http://rest.wufazhuce.com/OneForWeb/one/getHp_N?strDate=%@&strRow=1",date];
    NSLog(@"%@",url);
    
    
    self.G_getNewInfoArr = [NSMutableArray array];
    [self G_setHttpToJson:url passValue:^(NSMutableArray *array) {
        
        ReadOfOneModel   *rm = [[ReadOfOneModel alloc] init];
        [rm setValuesForKeysWithDictionary:[array valueForKey:@"hpEntity"]];
        [self.G_getNewInfoArr addObject:rm];
        
        
        value(self.G_getNewInfoArr);
    }];


}

-(void)G_getThreeDataInfo:(pushArr)value
{
    NSString *url = [NSString stringWithFormat:@"http://rest.wufazhuce.com/OneForWeb/one/getHp_N?strDate=%@&strRow=%ld",[self g_setTimeYear],self.num+1];
    NSLog(@"%@",url);
    
    
    self.G_getNewInfoArr = [NSMutableArray array];
    [self G_setHttpToJson:url passValue:^(NSMutableArray *array) {
        
        ReadOfOneModel   *rm = [[ReadOfOneModel alloc] init];
        [rm setValuesForKeysWithDictionary:[array valueForKey:@"hpEntity"]];
        [self.G_getNewInfoArr addObject:rm];
        
        
        value(self.G_getNewInfoArr);
    }];
    

}

#pragma  mark - 得到第三页内容的数据
-(void)G_getThreeDataInfo:(NSInteger)id1 passValue:(pushArr)value
{
    NSString *url = [NSString stringWithFormat:@"http://rest.wufazhuce.com/OneForWeb/one/getC_N?strDate=%@&strRow=%ld&strMS=1",[self g_setTimeYear],id1];
    NSLog(@"%@",url);
    
    
    self.G_getNewInfoArr = [NSMutableArray array];
    [self G_setHttpToJson:url passValue:^(NSMutableArray *array) {
        
        ReadOfDeailModel   *rm = [[ReadOfDeailModel alloc] init];
        [rm setValuesForKeysWithDictionary:[array valueForKey:@"contentEntity"]];
        [self.G_getNewInfoArr addObject:rm];
        
        
        value(self.G_getNewInfoArr);
    }];
 
    
}

#pragma mark - 收藏文章

-(void)G_setReads:(NSString *)title ptime:(NSString *)ptime url:(NSString *)url
{
    
    AVObject *testObject = [AVObject objectWithClassName:[NSString stringWithFormat:@"%@Reads",[self getUserLogin]]];
    [testObject save];
    [testObject deleteInBackground];
    AVQuery *query = [AVQuery queryWithClassName:[NSString stringWithFormat:@"%@Reads",[self getUserLogin]]];
     [query whereKey:@"ptime" equalTo:ptime];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // 检索成功
            NSLog(@"Successfully retrieved %lu posts.-------文章", (unsigned long)objects.count);
            
            if(objects.count != 0){
                [AlertShow alertShowWithContent:@"收藏已存在：" Seconds:1.f];
                return ;
            }
            
            NSLog(@"%@",url);
            NSLog(@"%@",[NSString stringWithFormat:@"%@Reads",[self getUserLogin]]);
            AVObject *testObject = [AVObject objectWithClassName:[NSString stringWithFormat:@"%@Reads",[self getUserLogin]]];
            [testObject setObject:url  forKey:@"url"];
            [testObject setObject:title  forKey:@"title"];
            [testObject setObject:ptime  forKey:@"ptime"];
            [testObject save];
            
            [AlertShow alertShowWithContent:@"文章已收藏 " Seconds:1.f];
        }
        
        else {
            // 输出错误信息
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];

    
}


#pragma mark - 查询收藏
-(void)G_selectReads:(NSInteger)forwardNum count:(NSInteger)count value:(pushArr)passValue
{
    
    
    ////[query whereKey:@"pubUser" notEqualTo:@"LeanCloud官方客服"];
    self.G_getNewInfoArr = [NSMutableArray array];
    AVQuery *query = [AVQuery queryWithClassName:[NSString stringWithFormat:@"%@Reads",[self getUserLogin]]];
    // [query whereKey:@"destion" equalTo:@"地点"];
    // 一次性只能取两条数据 count
     query.limit = count;
    
    // 跳过前 10 条结果 forword
    query.skip = forwardNum;
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // 检索成功
            NSLog(@"Successfully retrieved %lu posts-----查询收藏", (unsigned long)objects.count);
            
            if(objects.count == 0){
                [AlertShow alertShowWithContent:@"没有数据：" Seconds:1.f];
            }
            
            NSDictionary *dict = [objects valueForKey:@"localData"];
            
            for (NSDictionary   *s in dict) {
                ReadsModel *user = [[ReadsModel alloc] init];
                [user setValuesForKeysWithDictionary:s];
                
                [self.G_getNewInfoArr addObject:user];
            }
            //DoLog(@"%@",self.G_getNewInfoArr);
            passValue(self.G_getNewInfoArr);
        }
        else
        {
            // 输出错误信息
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    

}

#pragma mark - 是否收藏
-(void)G_isReads:(NSString *)ptime  isflag:(G_isStart)isflag
{
    
    AVQuery *query = [AVQuery queryWithClassName:[NSString stringWithFormat:@"%@Reads",[self getUserLogin]]];
    // [query whereKey:id1 equalTo:id1];
    
        [query whereKey:@"ptime" equalTo:ptime];
    
    
    
    //[query findObjectsInBackgroundWithTarget:self selector:@selector(callbackWithResult:error:)];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // 检索成功
            NSLog(@"Successfully retrieved %lu posts.------是否收藏", (unsigned long)objects.count);
            
            if(objects.count != 0){
                self.isFlag = YES;
                isflag(self.isFlag);
            }else
            { self.isFlag = NO;
                isflag(self.isFlag);
                
            }
        }else {
            // 输出错误信息
            NSLog(@"Error: %@ %@", error, [error userInfo]);
            self.isFlag=NO;
            
        }
    }];

}


#pragma mark -收藏 // 网址 // 标题 // TAGS类型 // 时间 // docid // skipID//

-(void)G_setStart:(NSString *)url title:(NSString *)title tags:(NSString*)tags ptime:(NSString*)ptime docid:(NSString *)dpcid skipID:(NSString *)skipID skipType:(NSString *)skipType
{
    if ([tags isEqualToString:@"视频"] ||[tags isEqualToString:@"正在直播"]) {
        if ([[dpcid substringToIndex:16 ]isEqualToString:@"9IG74V5H00963VRO"]) {
            [AlertShow alertShowWithContent:@"该新闻无法收藏" Seconds:1.f];
            return;
        }
        
    }
   
    
    
    AVObject *testObject = [AVObject objectWithClassName:[self getUserLogin]];
    NSLog(@"%@",[self getUserLogin]);
    [testObject save];
    [testObject deleteInBackground];
    AVQuery *query = [AVQuery queryWithClassName:[self getUserLogin]];
    
    DoLog(@"%@===%@",skipID,dpcid);
    if (dpcid  == NULL) {
        if (skipID !=NULL) {
            DoLog(@">>>>>>>>>>>>%@",skipID);
            [query whereKey:@"skipID" equalTo:skipID];
        }
           }
    else if (skipID == NULL)
    {
        if (dpcid !=NULL) {
             DoLog(@"<<<<<<<<<<<<%@",dpcid);
        [query whereKey:@"dpcid" equalTo:dpcid];
        }
    }else
    {
        if (dpcid !=NULL) {
            DoLog(@"<<<<<<<<<<<<%@",dpcid);
            [query whereKey:@"dpcid" equalTo:dpcid];
        }
    }
  
    
    
    
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // 检索成功
            NSLog(@"Successfully retrieved %lu posts.-------热门新闻", (unsigned long)objects.count);
            
            if(objects.count != 0){
                [AlertShow alertShowWithContent:@"收藏已存在：" Seconds:1.f];
                return ;
            }
            
            NSLog(@"%@",url);
            NSLog(@"%@",[self getUserLogin]);
            AVObject *testObject = [AVObject objectWithClassName:[self getUserLogin]];
            [testObject setObject:url  forKey:@"url"];
            [testObject setObject:title  forKey:@"title"];
            [testObject setObject:tags  forKey:@"tags"];
            [testObject setObject:ptime  forKey:@"ptime"];
            [testObject setObject:dpcid  forKey:@"dpcid"];
            [testObject setObject:skipType forKey:@"skipType"];
            [testObject setObject:[NSString stringWithFormat:@"%@",skipID] forKey:@"skipID"];
            [testObject save];
            
            [AlertShow alertShowWithContent:@"已收藏 " Seconds:1.f];
        }
        
        else {
            // 输出错误信息
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
   }

#pragma mark  查询收藏 高星
-(void)G_selectStart:(NSInteger)forwardNum count:(NSInteger)count value:(pushArr)passValue
{
    
    ////[query whereKey:@"pubUser" notEqualTo:@"LeanCloud官方客服"];
    self.G_getNewInfoArr = [NSMutableArray array];
    AVQuery *query = [AVQuery queryWithClassName:[self getUserLogin]];
   // [query whereKey:@"destion" equalTo:@"地点"];
    // 一次性只能取两条数据 count
   query.limit = count;
    
    // 跳过前 10 条结果 forword
    query.skip = forwardNum;
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // 检索成功
            NSLog(@"Successfully retrieved %lu posts-----查询收藏", (unsigned long)objects.count);
            
            if(objects.count == 0){
                [AlertShow alertShowWithContent:@"没有数据：" Seconds:1.f];
            }
            
            NSDictionary *dict = [objects valueForKey:@"localData"];
            
            for (NSDictionary   *s in dict) {
                UserLoginModel *user = [[UserLoginModel alloc] init];
                [user setValuesForKeysWithDictionary:s];
                
                [self.G_getNewInfoArr addObject:user];
                            }
            //DoLog(@"%@",self.G_getNewInfoArr);
            passValue(self.G_getNewInfoArr);
                   }
        else
        {
            // 输出错误信息
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    

}
#pragma mark 是否收藏 高星

-(void)G_isStrat:(NSString *)id1  type:(NSString*)type isflag:(G_isStart)isflag
{
    
    AVObject *testObject = [AVObject objectWithClassName:[self getUserLogin]];
    NSLog(@"%@",[self getUserLogin]);
    [testObject save];
    [testObject deleteInBackground];

    AVQuery *query = [AVQuery queryWithClassName:[self getUserLogin]];
   // [query whereKey:id1 equalTo:id1];
    if ([type isEqualToString:@"skipID"]) {
        [query whereKey:@"skipID" equalTo:id1];
    }else
    {
         [query whereKey:@"dpcid" equalTo:id1];
    }
    
   
   
    //[query findObjectsInBackgroundWithTarget:self selector:@selector(callbackWithResult:error:)];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // 检索成功
            NSLog(@"Successfully retrieved %lu posts.------是否收藏", (unsigned long)objects.count);
            
            if(objects.count != 0){
                self.isFlag = YES;
                isflag(self.isFlag);
            }else
            { self.isFlag = NO;
                isflag(self.isFlag);
                
            }
        }else {
            // 输出错误信息
            NSLog(@"Error: %@ %@", error, [error userInfo]);
            self.isFlag=NO;
        }
    }];
    
    
}


@end

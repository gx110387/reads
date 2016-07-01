//
//  DeailThreeViewController.m
//  reads
//
//  Created by lanou3g on 15/11/11.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "DeailThreeViewController.h"

@interface DeailThreeViewController ()
@property(nonatomic,strong)DeailThreeView *dm;
@end

@implementation DeailThreeViewController

-(void)loadView
{
    self.dm = [[DeailThreeView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view = self.dm;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = gbgcontentcolor;
    ReadOfDeailModel *rm =self.G_dataArr[0];
    
    NSString *stirng1 = [self touchBody];
   
    NSString *str1 = [stirng1 substringToIndex:stirng1.length/2];
    NSString *str2 = [stirng1 substringFromIndex:stirng1.length/2];
      NSLog(@"%f====%f==%f",[tools G_heightForString:stirng1],[tools G_heightForString:str1],[tools G_heightForString:str2]);
    self.dm.myTimeLabel.text = rm.strContMarketTime;
    self.dm.myConTitleLabel.text = rm.strContTitle;
    self.dm.myContAuthorLabel.text = rm.strContAuthor;
    self.dm.myContentLabel.text =  str1;
     self.dm.myContentLabel2.text =  str2;
    self.dm.myContentLabel.frame = CGRectMake(CGRectGetMinX(self.dm.myContAuthorLabel.frame), CGRectGetMaxY(self.dm.myContAuthorLabel.frame)+5, CGRectGetWidth(self.dm.myContAuthorLabel.frame), [tools G_heightForString:str1]);
    
       self.dm.myContentLabel2.frame = CGRectMake(CGRectGetMinX(self.dm.myContentLabel.frame), CGRectGetMaxY(self.dm.myContentLabel.frame), CGRectGetWidth(self.dm.myContentLabel.frame), [tools G_heightForString:str2]);
   
    self.dm.myContAuthorLabel.text = rm.strContAuthor;
    
    self.dm.myContAuthorLabel2.text = rm.strContAuthor;
    self.dm.myContAuthorWithLabel.text = rm.sWbN;
    self.dm.myAuthLabel.text = rm.sAuth;
    
    
    
    self.dm.myScrollView.contentSize  = CGSizeMake(CGRectGetWidth(self.dm.myTimeLabel.frame),CGRectGetMaxY(self.dm.myContAuthorLabel.frame)+CGRectGetHeight(self.dm.myContentLabel.frame)+CGRectGetHeight(self.dm.myContentLabel2.frame)+30+60);
    
   
    
  //  DoLog(@"%@",self.G_dataArr);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSString *)touchBody
{
   ReadOfDeailModel *rm =self.G_dataArr[0];
    NSMutableString *body = [NSMutableString string];
    if (rm.strContent != nil) {
        [body appendString:rm.strContent];
    }
    
   // DoLog(@"%@",body);
        
        [body replaceOccurrencesOfString:[NSString stringWithFormat:@"<br><br>"] withString:@"\n" options:NSCaseInsensitiveSearch range:NSMakeRange(0, body.length)];
    [body replaceOccurrencesOfString:[NSString stringWithFormat:@"<br>"] withString:@"\n\n" options:NSCaseInsensitiveSearch range:NSMakeRange(0, body.length)];
    [body replaceOccurrencesOfString:[NSString stringWithFormat:@"<br> <br>"] withString:@" \n" options:NSCaseInsensitiveSearch range:NSMakeRange(0, body.length)];
        // DoLog(@"%@",body);
        
   
    
    return body;
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

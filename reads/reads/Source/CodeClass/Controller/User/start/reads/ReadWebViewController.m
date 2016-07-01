//
//  ReadWebViewController.m
//  reads
//
//  Created by lanou3g on 15/11/14.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "ReadWebViewController.h"

@interface ReadWebViewController ()<UIWebViewDelegate>
@property(nonatomic,strong)UIWebView *webview;
@end

@implementation ReadWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view .backgroundColor = [UIColor cyanColor];
    NSLog(@"%f", self.view.frame.size.height);
    if (self.view.frame.size.height <1024) {
         self.webview = [[UIWebView alloc]initWithFrame:CGRectMake(0, -44, self.view.frame.size.width, self.view.frame.size.height+self.view.frame.size.height/1.2)];
    }else
    {
       self.webview = [[UIWebView alloc]initWithFrame:CGRectMake(0, -44, self.view.frame.size.width, self.view.frame.size.height+self.view.frame.size.height/2)];
    }
   
    self.webview.backgroundColor = [UIColor yellowColor];
    self.webview.dataDetectorTypes = UIWebViewNavigationTypeLinkClicked;
    self.webview.delegate = self;
    UIScrollView *scrollView = (UIScrollView *)[[self.webview subviews] objectAtIndex:0];
    scrollView.bounces = NO;
    [self.view addSubview:self.webview];
    
    NSString  *str = [NSString stringWithFormat: @"http://m.wufazhuce.com/article/%@",self.ptime];
    [self loadString:str];
}
- (void)loadString:(NSString *)str
{
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:str]];
    [self.webview loadRequest:request];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

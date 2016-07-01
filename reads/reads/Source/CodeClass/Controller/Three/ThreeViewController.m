//
//  ThreeViewController.m
//  reads
//
//  Created by lanou3g on 15/11/3.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "ThreeViewController.h"


@interface ThreeViewController ()
@property(nonatomic,strong)UIWebView *webview;
@end

@implementation ThreeViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     self.view.backgroundColor = [UIColor yellowColor];
     self.navigationItem.title = @"每日一读";
    GTPageController *pageController = [self getDefaultController];
 
    [self addChildViewController:pageController];
    [self.view addSubview:pageController.view];
 
    
}

- (GTPageController *)getDefaultController{
    NSMutableArray *viewControllers = [[NSMutableArray alloc] init];
    NSMutableArray *titles = [[NSMutableArray alloc] init];
    NSInteger num = 10;
    GTPageController *pageVC;
    
    for (int i = 0; i < num; i++) {
        Class vcClass;
        NSString *title;
        
        vcClass = [ReadOfOneViewController class];
        
       title = @"旅行";
        [viewControllers addObject:vcClass];
        [titles addObject:title];
       
        pageVC = [[GTPageController alloc] initWithViewControllerClasses:viewControllers andTheirTitles:titles];
        pageVC.num = num;
           }
   

    pageVC.pageAnimatable = YES;
    pageVC.menuItemWidth = CGRectGetWidth([UIScreen mainScreen].bounds);
   pageVC.menuHeight  =0.1;
    pageVC.postNotification = YES;
    return pageVC;
}

//gscroll
//- (void)loadString:(NSString *)str
//{
//    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:str]];
//    [self.webview loadRequest:request];
//}
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

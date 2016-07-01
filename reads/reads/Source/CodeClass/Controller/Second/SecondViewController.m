//
//  SecondViewController.m
//  reads
//
//  Created by lanou3g on 15/11/3.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()<NKJPagerViewDataSource, NKJPagerViewDelegate>

@end

@implementation SecondViewController

- (void)viewDidLoad
{
    
    self.dataSource = self;
    self.delegate = self;
    self.navigationItem.title =@"自媒体";
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - NKJPagerViewDataSource

- (NSUInteger)numberOfTabView
{
    return 6;
}

- (UIView *)viewPager:(NKJPagerViewController *)viewPager viewForTabAtIndex:(NSUInteger)index
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame)/3, 44)];
    
   
    UIColor *color = [UIColor whiteColor];
    label.backgroundColor = color;
    
    label.font = [UIFont systemFontOfSize:17.0];
    if (index == 0) {
        
        label.text = [NSString stringWithFormat:@"知媒%ld",index];
    }
    if (index == 1) {
        
        label.text = [NSString stringWithFormat:@"过客%ld",index];
    }
    if (index == 2) {
        
        label.text = [NSString stringWithFormat:@"野玩儿%ld",index];
    }
    if (index == 3) {
        label.text = [NSString stringWithFormat:@"网易灼见%ld",index];
        
    }if (index == 4) {
        
        label.text = [NSString stringWithFormat:@"中关村在线%ld",index];
    }if (index == 5) {
        
        label.text = [NSString stringWithFormat:@"一刻talk%ld",index];
    }
   
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor blackColor];
    
    return label;
}

- (UIViewController *)viewPager:(NKJPagerViewController *)viewPager contentViewControllerForTabAtIndex:(NSUInteger)index
{
   // ContentViewController  *contentVC = [[ContentViewController alloc] init];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"contentView" bundle:nil];
    ContentViewController *contentVC = [storyboard instantiateViewControllerWithIdentifier:@"ContentViewController"];
    contentVC.num = index;
    
    
    return contentVC;
}

- (NSInteger)widthOfTabView
{
    return CGRectGetWidth(self.view.frame)/3;
}

#pragma mark - NKJPagerViewDelegate

- (void)viewPager:(NKJPagerViewController *)viewPager didSwitchAtIndex:(NSInteger)index withTabs:(NSArray *)tabs
{
    [UIView animateWithDuration:0.1
                     animations:^{
                         for (UIView *view in self.tabs) {
                             if (index == view.tag) {
                                 view.alpha = 1.0;
                             } else {
                                 view.alpha = 0.5;
                             }
                         }
                     }
                     completion:^(BOOL finished){}];
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

//
//  ReadsViewController.m
//  reads
//
//  Created by lanou3g on 15/11/14.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "ReadsViewController.h"

@interface ReadsViewController ()
@property(nonatomic,strong)ReadOfOneViewController *readOneVC;
@property(nonatomic,strong)ReadWebViewController *readWebVC;
@property(nonatomic,strong)UISegmentedControl *segment;
@end

@implementation ReadsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
 
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(leftBarButtonAction:)];

    self.readOneVC = [[ReadOfOneViewController  alloc] init];
    self.readOneVC.ptime = self.time;
    self.readOneVC.isStart = YES;
    self.readWebVC = [[ReadWebViewController alloc] init];
    self.readWebVC.ptime = self.time;
    
    [self addChildViewController:self.readOneVC];
    [self addChildViewController:self.readWebVC];
    [self.view addSubview:self.readOneVC.view];
     [self setSegmentView];
}

-(void)leftBarButtonAction:(UIBarButtonItem *)sender
{
   
    [self.navigationController popViewControllerAnimated:YES];
    
}

-(void)setSegmentView
{
    
    NSArray *arr = [NSArray arrayWithObjects:@"首页",@"阅读", nil];
    self.segment = [[UISegmentedControl alloc] initWithItems:arr];
    self.segment.frame = CGRectMake(100, 0, 150, 33);
    
    
    // 默认被选中的背景、
    self.navigationItem.titleView  = self. segment;
    
    self. segment.selectedSegmentIndex =0;
    self.view.tag = 0;
    // 边框和字体颜色
    self. segment.tintColor = [UIColor cyanColor];
    [self. segment addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
   }
-(void)segmentAction:(UISegmentedControl *)sender
{
    NSInteger index = [sender selectedSegmentIndex];
    NSLog(@"text:%ld",index);
    switch ([sender selectedSegmentIndex]) {
            
        case 0:
            self.navigationItem.rightBarButtonItem.enabled = YES;
            [self.readWebVC.view removeFromSuperview];
            [self.view addSubview:self.readOneVC.view];
             self.readOneVC.ptime = self.time;
             self.readOneVC.isStart = YES;
            
            
            break;
            
        case 1:
            self.navigationItem.rightBarButtonItem.enabled = NO;
            
            [self.readOneVC.view removeFromSuperview];
            
            [self.view addSubview:self.readWebVC.view];
            self.readWebVC.ptime = self.time;

            break;
            
        default:
            NSLog(@"segmentActionDefault");
            break;
    }
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

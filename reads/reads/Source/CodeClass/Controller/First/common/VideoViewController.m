//
//  VideoViewController.m
//  reads
//
//  Created by lanou3g on 15/11/8.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "VideoViewController.h"

@interface VideoViewController ()

@end

@implementation VideoViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
   
   // NSLog(@"%@",self.url);
     [self addVideoPlayerWithURL:self.url];
   // self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(leftAction)];
    
}
- (void)addVideoPlayerWithURL:(NSString *)url{
    if (!self.movieViewController) {
        
        self.movieViewController = [[KrVideoPlayerController alloc] initWithFrame:CGRectMake(20, CGRectGetHeight(self.view.frame)/2-(CGRectGetWidth(self.view.frame)/2)  , CGRectGetWidth(self.view.frame)-40, CGRectGetWidth(self.view.frame)/2)];
        __weak typeof(self)weakSelf = self;
        [self.movieViewController setDimissCompleteBlock:^{
            weakSelf.movieViewController = nil;
            NSLog(@"video.view 消失");
        }];
        [self.movieViewController setWillBackOrientationPortrait:^{
            NSLog(@"进入最小化状态");
           [weakSelf toolbarHidden:NO];
        }];
        [self.movieViewController setWillChangeToFullscreenMode:^{
            NSLog(@"进入全屏状态");
           [weakSelf toolbarHidden:YES];
        }];
        [self.view addSubview:self.movieViewController.view];
    }
    self.movieViewController.contentURL =[NSURL URLWithString:url];
    
}
- (void)toolbarHidden:(BOOL)Bool{
    
    [self.navigationController setNavigationBarHidden:Bool animated:YES];
  
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

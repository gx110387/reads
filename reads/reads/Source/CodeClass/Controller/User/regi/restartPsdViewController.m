//
//  restartPsd.m
//  ZouZou
//
//  Created by lanou3g on 15/10/24.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "restartPsdViewController.h"

@interface restartPsdViewController ()<restartPasViewDelegate>
@property(nonatomic,strong)restartPsdView *rv;
@end

@implementation restartPsdViewController
-(void)loadView
{
    self.rv = [[restartPsdView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view = self.rv;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.rv.delegate = self;
    self.navigationItem.title = @"密码修改";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(leftBarButtonAction:)];
}



-(void)leftBarButtonAction:(UIBarButtonItem *)sender
{
    [self.navigationController  dismissViewControllerAnimated:YES completion:nil];
    
}

-(void)getData
{
   
    
    if ([self.rv.nameTextField.text isEqualToString:@""]) {
        
        [AlertShow alertShowWithContent:@"请输入用户名" Seconds:0.5f];
        
    } else  if ([self.rv.nameTextField.text  isEqualToString:[tools getUserLogin]]== NO) {
        
        [AlertShow alertShowWithContent:@"用户名错误,请重新输入" Seconds:1.f];
        
        
    }
    else  if ([self.rv.passTextField.text isEqualToString:@""]) {
        [AlertShow alertShowWithContent:@"请输入旧密码" Seconds:0.5f];
        
    }
    
    else  if ([self.rv.passaginTextField.text isEqualToString:@""]) {
        [AlertShow alertShowWithContent:@"请输入新密码" Seconds:0.5f];
        
        
    }
else
    {
    
    NSString *oldPsd = [NSString stringWithFormat:@"%@",self.rv.passTextField.text];
    NSString *newPsd = [NSString stringWithFormat:@"%@",self.rv.passaginTextField.text];
    [[AVUser currentUser] updatePassword:oldPsd newPassword:newPsd  block:^(id object, NSError *error) {
      
      
        if (!error) {
            
            
            NSLog(@"zhenggong");
            [AlertShow alertShowWithContent:@"修改密码成功" Seconds:0.5f];
            
            
            [AVUser logOut];  //清除缓存用户对象
                        
            // 调到首界面
            [self.navigationController dismissViewControllerAnimated:YES completion:nil];
            
            
            
        } else {
            
            // 修改失败
            NSLog(@"失败");
            [AlertShow alertShowWithContent:@"修改密码失败" Seconds:0.5f];
        }
        
        
        
    }];
    
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

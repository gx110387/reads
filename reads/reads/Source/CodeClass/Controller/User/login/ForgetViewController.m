//
//  ForgetViewController.m
//  reads
//
//  Created by lanou3g on 15/11/15.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "ForgetViewController.h"

@interface ForgetViewController ()<restartPasViewDelegate>
@property(nonatomic,strong)restartPsdView *rv;
@end

@implementation ForgetViewController
-(void)loadView
{
    self.rv = [[restartPsdView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view = self.rv;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.rv.delegate = self;
    
    self.rv.nameLabel.text =@"邮箱";
    self.rv.nameTextField.placeholder =@"请输入邮箱找回密码";
    self.rv.passLabel.hidden = YES;
    self.rv.passTextField.hidden = YES;
    self.rv.passagainLabel.hidden = YES;
    self.rv.passaginTextField.hidden = YES;
    self.navigationItem.title = @"密码重置";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(leftBarButtonAction:)];

}
-(void)leftBarButtonAction:(UIBarButtonItem *)sender
{
    [self.navigationController  dismissViewControllerAnimated:YES completion:nil];
    
}

-(void)getData
{
    
    if ([self.rv.nameTextField.text isEqualToString:@""])
    {
        [AlertShow alertShowWithContent:@"请输入邮箱" Seconds:1.f];
    }else
    {
        
        [AVUser requestPasswordResetForEmailInBackground:self.rv.nameTextField.text block:^(BOOL succeeded, NSError *error) {
            if (succeeded) {
                
             // [AlertShow alertShowWithContent:@"请去邮箱查收你的重置密码邮件" Seconds:3.f];
                
                [UIAlertController showAlertInViewController:self
                                                   withTitle:@"提示"
                                                     message:@"请去邮箱查收你的重置密码邮件"
                                           cancelButtonTitle:nil
                                      destructiveButtonTitle:@"确定"
                                           otherButtonTitles:nil
                                                    tapBlock:^(UIAlertController *controller, UIAlertAction *action, NSInteger buttonIndex){
                                                        
                                                        if (buttonIndex == controller.cancelButtonIndex) {
                                                            
                                                            
                                                        } else if (buttonIndex == controller.destructiveButtonIndex) {
                                                            
                                                           self.rv.nameTextField.text =@"";
                                                            
                                                            // self.rv.makeSubmit.enabled = NO;
                                                        }
                                                        
                                                    }];

                
            } else {
               
                if (error.code ==205) {
                     [AlertShow alertShowWithContent:@"邮箱不存在!请检查输入" Seconds:1.f];
                }
             
                
            }
        }];

        
    }
    
    
    
//    if ([self.rv.passTextField.text isEqualToString:@""]&&[self.rv.passaginTextField.text isEqualToString:@""]) {
//        [AlertShow alertShowWithContent:@"新密码或旧密码不能为空" Seconds:1.f];
//    }else
//    {
//        
//        NSString *oldPsd = [NSString stringWithFormat:@"%@",self.rv.passTextField.text];
//        NSString *newPsd = [NSString stringWithFormat:@"%@",self.rv.passaginTextField.text];
//        [[AVUser currentUser] updatePassword:oldPsd newPassword:newPsd  block:^(id object, NSError *error) {
//            
//            
//            if (object != nil) {
//                // 修改成功
//                [AlertShow alertShowWithContent:@"修改密码成功" Seconds:1.f];
//                [AVUser logOut];  //清除缓存用户对象
//                
//                
//                // 调到首界面
//                
//                
//                
//                [self.navigationController dismissViewControllerAnimated:YES completion:nil];
//                
//                
//                
//            } else {
//                
//                // 修改失败
//                NSLog(@"失败");
//            }
//            
//            
//        }];
//        
//    }
    
    
    
    
    
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

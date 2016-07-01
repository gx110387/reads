//
//  AdviseViewController.m
//  reads
//
//  Created by lanou3g on 15/11/12.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "AdviseViewController.h"

@interface AdviseViewController ()
@property (weak, nonatomic) IBOutlet UITextField *eamilTextField;
@property (weak, nonatomic) IBOutlet UITextView *deailTextView;

@end

@implementation AdviseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"问题反馈";
      self.view.backgroundColor =   gbgcolor;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"提交" style:UIBarButtonItemStyleDone target:self action:@selector(rightAction)];
     self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(leftAction)];
    self.eamilTextField.clearsOnBeginEditing = YES;
    self.eamilTextField.keyboardAppearance = UIKeyboardTypeEmailAddress;
    self.deailTextView.clearsContextBeforeDrawing = YES;
    self.deailTextView.keyboardAppearance = UIKeyboardTypeEmailAddress;
    // Do any additional setup after loading the view from its nib.
}
-(void)leftAction
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
-(void)rightAction
{
    
    if ([self.eamilTextField.text isEqualToString:@""] ){
        [AlertShow alertShowWithContent:@"邮箱不能为空" Seconds:1.0f];
    }else if ([self.deailTextView.text isEqualToString:@""])
    {
         [AlertShow alertShowWithContent:@"问题不能为空" Seconds:1.0f];
        
    }else if([AdviseViewController validateEmail:self.eamilTextField.text] == NO)
    {
        [AlertShow alertShowWithContent:@"你说的邮箱格式不正确,请重新输入" Seconds:1.0f];
        self.eamilTextField.text = @"";
    }
    else
    {
        AVObject *testObject = [AVObject objectWithClassName:[NSString stringWithFormat:@"question"]];
        [testObject save];
        [testObject deleteInBackground];
        AVQuery *query = [AVQuery queryWithClassName:[NSString stringWithFormat:@"question"]];
       
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            if (!error) {
                // 检索成功
                NSLog(@"Successfully retrieved %lu posts.-------问题", (unsigned long)objects.count);
                
                
                
                AVObject *testObject = [AVObject objectWithClassName:[NSString stringWithFormat:@"question"]];
                [testObject setObject:[tools getUserLogin]  forKey:@"UserName"];
                [testObject setObject:self.eamilTextField.text  forKey:@"emil"];
                [testObject setObject:self.deailTextView.text  forKey:@"quest"];
                [testObject save];
                
                [AlertShow alertShowWithContent:@"感谢你的反馈,我们会在第一时间及时处理你的问题~" Seconds:1.f];
            }
            
            else {
                // 输出错误信息
                NSLog(@"Error: %@ %@", error, [error userInfo]);
            }
        }];

        DoLog(@"未处理 问题反馈");
    }
 
    
    
}
//邮箱
+ (BOOL) validateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
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

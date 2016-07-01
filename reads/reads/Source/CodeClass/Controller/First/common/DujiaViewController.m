//
//  DujiaViewController.m
//  reads
//
//  Created by lanou3g on 15/11/7.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "DujiaViewController.h"

@interface DujiaViewController ()
@property(nonatomic,strong)NomalVIew *nv;
@property(nonatomic,strong)NSMutableArray *arr;

@end

@implementation DujiaViewController

-(void)loadView
{
    self.nv = [[NomalVIew alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view  = self.nv;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.arr = [ NSMutableArray array];
    NomelModel *nm =[NomelModel alloc];
    nm = (NomelModel *)self.G_getDataArr[0];
    NSString  *bodyString = [NSString stringWithFormat:@"%@",[self touchBody]];
    self.nv.titleLabel.text =[NSString stringWithFormat:@"%@",nm.title];
    
    self.nv.sourceLabel.text = [NSString stringWithFormat:@"%@ %@",nm.source,[tools g_setTimerjuti:nm.ptime]];
    if (nm.img.count != 0) {
        UIImageView *myImage;
        int i =0;
        CGFloat heightPhoto =CGRectGetMaxY(self.nv.sourceLabel.frame)+5;
        for (NSDictionary *s in nm.img) {
            
            NomelImgModle *detailImgModel = [[NomelImgModle alloc] init];
            [detailImgModel  setValuesForKeysWithDictionary: s];
            
            // 数组存放被切割的像素
            NSArray *pixel = [detailImgModel.pixel componentsSeparatedByString:@"*"];
            CGFloat width = [[pixel firstObject]floatValue];
            CGFloat height = [[pixel lastObject]floatValue];
            // 判断是否超过最大宽度
            CGFloat maxWidth = [UIScreen mainScreen].bounds.size.width * 0.90;
            if (width > maxWidth) {
                height = maxWidth / width * height;
                width = maxWidth;
            }
            myImage =[[UIImageView alloc] init];
            myImage.frame = CGRectMake(CGRectGetMinX(self.nv.titleLabel.frame), heightPhoto, width-10, height);
            [myImage sd_setImageWithURL:[NSURL URLWithString:detailImgModel.src]placeholderImage:bgPhoto];
            myImage.backgroundColor = [UIColor clearColor];
            myImage.tag = 2;
            [self.nv.backScrollView addSubview:myImage];
            
            // 给图片设置点击事件
            myImage.userInteractionEnabled = YES;
            UITapGestureRecognizer *singleTap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(UserPhontAction:)];
            
            [  myImage addGestureRecognizer:singleTap1];
            UILabel *bodyLabel = [[UILabel alloc] init];
            
            bodyLabel.frame =CGRectMake(CGRectGetMinX(self.nv.titleLabel.frame), heightPhoto+height+5, CGRectGetWidth(self.nv.titleLabel.frame), [tools G_heightForString:self.arr[i]]+166);
            NSString * s  = self.arr[i];
            bodyLabel.numberOfLines = 0;
            bodyLabel.text = [NSString stringWithFormat:@"%@",s];
            bodyLabel.font = [UIFont systemFontOfSize:20];
            [self.nv.backScrollView addSubview:bodyLabel];
             heightPhoto = heightPhoto+height+[tools G_heightForString:self.arr[i]]+166+10;
            self.nv.backScrollView.contentSize = CGSizeMake(CGRectGetWidth(self.nv.frame)-20,heightPhoto+66);
            
           
            i++;
            
        }
    }else
    {
        self.nv.bodyLabel.text = bodyString;//nm.body;
        self.nv.bodyLabel.frame =CGRectMake(CGRectGetMinX(self.nv.titleLabel.frame), CGRectGetMaxY(self.nv.sourceLabel.frame)+5, CGRectGetWidth(self.nv.titleLabel.frame), [tools G_heightForString:bodyString]+166);
        self.nv.backScrollView.contentSize = CGSizeMake(CGRectGetWidth(self.nv.frame)-20,[tools G_heightForString:bodyString]+166+166);
        
    }
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(leftAction)];
}
-(void)leftAction
{
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)UserPhontAction:(UITapGestureRecognizer*)tap
{
     UIImageView *imageView=(UIImageView*)[tap.view viewWithTag:2];
    

    [self zoomImage:imageView.frame image:imageView];

}
#pragma mark -图片保存
-(void)saveImageAction:(UIButton *)sender
{
    [UIAlertController showAlertInViewController:self
                                       withTitle:@"提示"
                                         message:@"是否将图片保存到本地?"
                               cancelButtonTitle:@"取消"
                          destructiveButtonTitle:@"确定"
                               otherButtonTitles:nil
                                        tapBlock:^(UIAlertController *controller, UIAlertAction *action, NSInteger buttonIndex){
                                            
                                            if (buttonIndex == controller.cancelButtonIndex) {
                                                
                                            } else if (buttonIndex == controller.destructiveButtonIndex) {
                                                
                                                UIImageWriteToSavedPhotosAlbum(sender.imageView.image, nil, nil, nil);
                                            }
                                            //                                            else if (buttonIndex >= controller.firstOtherButtonIndex) {
                                            //                                                NSLog(@"Other Button Index %ld", (long)buttonIndex - controller.firstOtherButtonIndex);
                                            //                                            }
                                        }];

    

}
//放大图片
-(void)zoomImage:(CGRect)frame image:(UIImageView*)zoomImageView
{
    NSLog(@"zoule me ");
    UIImage *image=zoomImageView.image;
    //图片缩小到的frame
  CGRect  oldframe=frame;
    //新创建的图层和底层图片位置大小相同
UIView*    backgViewTop=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view .frame.size.width, self.view.frame.size.height)];
    backgViewTop.backgroundColor=[UIColor colorWithRed:251/255.0 green:247/255.0 blue:237/255.0 alpha:1];
    UIButton *saveImge = [UIButton buttonWithType:UIButtonTypeSystem];
    saveImge.frame = CGRectMake(CGRectGetWidth(backgViewTop.frame)-inum*3, CGRectGetHeight(backgViewTop.frame)-inum-inum/2 , inum*2, inum);
    [saveImge setTintColor:[UIColor blackColor]];
    saveImge.layer.borderWidth = 0.5;
    saveImge.layer.cornerRadius = 10;
    saveImge.imageView.image = zoomImageView.image;
    [saveImge setTitle:@"保存图片" forState:UIControlStateNormal];
    [saveImge addTarget:self action:@selector(saveImageAction:) forControlEvents:UIControlEventTouchUpInside];
    [backgViewTop addSubview:saveImge];
  UIImageView *imageViewZoom = [[UIImageView alloc]initWithFrame:oldframe];
     imageViewZoom.backgroundColor = [ UIColor clearColor];
     imageViewZoom.image=image;
     imageViewZoom.tag=1;
    [backgViewTop addSubview: imageViewZoom];
    [self.nv addSubview:backgViewTop];
    
    UITapGestureRecognizer *tapHideImage=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hideImage:)];
    [backgViewTop addGestureRecognizer: tapHideImage];
    //图片放大动画
    [UIView animateWithDuration:0.2f delay:0.0f options:UIViewAnimationOptionLayoutSubviews animations:^{
        imageViewZoom.frame=CGRectMake(10, inum*2, self.view .frame.size.width-20, self.view.frame.size.height-inum*4);
         imageViewZoom.layer.masksToBounds = YES;
         imageViewZoom.layer.cornerRadius = 20;
    } completion:^(BOOL finished)
     {
          imageViewZoom.layer.masksToBounds = NO;
          imageViewZoom.layer.cornerRadius = 0;
     }];
    
   
}
-(void)hideImage:(UITapGestureRecognizer*)tap
{
    [NSThread sleepForTimeInterval:0.1];
    
    
    UIView *backgroundViewTop=tap.view;
    UIImageView *imageView=(UIImageView*)[tap.view viewWithTag:1];
    [UIView animateWithDuration:1.f animations:^{
        //imageView.frame=CGRectMake(0, 100, 400, 200);
        imageView.layer.masksToBounds = YES;
        imageView.layer.cornerRadius = 20;
    } completion:^(BOOL finished) {
        [backgroundViewTop removeFromSuperview];
    }];
    //延迟执行显示按钮
   
}

- (NSString *)touchBody
{
    NomelModel *nm =[NomelModel alloc];
    nm = (NomelModel *)self.G_getDataArr[0];
    NSMutableString *body = [NSMutableString string];
    if (nm.body != nil) {
        [body appendString:nm.body];
    }
    
    delet
    
    for (int i = 0; i <nm.img.count+1; i++) {
        
        NSString *string2 = [NSString stringWithFormat:@"<!--IMG#%d-->",i];
        
        NSRange range = [body  rangeOfString:string2];
        if (range.length <1) {
            [self.arr addObject:body];
            return body;
        }
        int location = range.location;
        int leight = range.length;
        NSString *astring = [[NSString alloc] initWithString:[NSString stringWithFormat:@"Location:%i,Leight:%i",location,leight]];
        
        NSString  *s = [NSString stringWithFormat:@"%@",[body substringWithRange:NSMakeRange(0, location)]];
        
        [self.arr addObject:s];
        
        [body deleteCharactersInRange:NSMakeRange(0, location)];
        
       DoLog(@"%@==",body);
        [body replaceOccurrencesOfString:[NSString stringWithFormat:@"<!--IMG#%d-->",i] withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, body.length)];
        
        
    }
    
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

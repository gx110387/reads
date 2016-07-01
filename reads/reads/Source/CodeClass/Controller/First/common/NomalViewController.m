//
//  NomalViewController.m
//  reads
//
//  Created by lanou3g on 15/11/5.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "NomalViewController.h"

@interface NomalViewController ()
@property(nonatomic,strong)NomalVIew *nv;
@property(nonatomic,strong)NomelModel *nm;
@property(nonatomic,strong) VideoModel *vm;
@property(nonatomic,strong) UIImageView *image;
@property(nonatomic,strong)VideoViewController  *videoVC;
@property(nonatomic,strong)NSString *bodyString;
@end

@implementation NomalViewController
-(void)loadView
{
    self.nv = [[NomalVIew alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view  = self.nv;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.nm =[[NomelModel alloc] init];
    self.nm = (NomelModel *)self.G_getDataArr[0];
   
    [self photo];
    
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(leftAction)];
}

// 如果照片不等于零
-(void)photo
{
    self.nv.titleLabel.text =[NSString stringWithFormat:@"%@",self.nm.title];
    self.bodyString = [NSString stringWithFormat:@"%@",[self touchBody]];
    self.nv.sourceLabel.text = [NSString stringWithFormat:@"%@ %@",self.nm.source,[tools g_setTimerjuti:self.nm.ptime]];
    if (self.nm.video.count !=0) {
        self.vm = [[VideoModel alloc] init];
      [ self.vm setValuesForKeysWithDictionary: self.nm.video[0]];
       //NSLog(@"%@", self.vm.url_m3u8);
        // 一,有照片的情况下        
        if (self.nm.img.count != 0) {
            NSLog(@"有视频有照片");
            UIImageView *myImage;
           int i =0;
           //  CGFloat width = [UIScreen mainScreen].bounds.size.width;
            CGFloat heightPhoto =CGRectGetMaxY(self.nv.sourceLabel.frame)+5;
            for (NSDictionary *s in self.nm.img) {
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
                myImage.frame = CGRectMake(CGRectGetMinX(self.nv.titleLabel.frame), heightPhoto, width-20, height);
                [myImage sd_setImageWithURL:[NSURL URLWithString:detailImgModel.src]placeholderImage:bgPhoto];
                myImage.backgroundColor = [UIColor clearColor];
                myImage.tag =2;
                [self.nv.backScrollView addSubview:myImage];
                // 给图片设置点击事件
                myImage.userInteractionEnabled = YES;
                UITapGestureRecognizer *singleTap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(UserPhontAction:)];
                [  myImage addGestureRecognizer:singleTap1];                                //
                heightPhoto = heightPhoto +height+5;
                 // 有视频 和图片
                if (i <self.nm.video.count) {
                    self.image = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.nv.titleLabel.frame), CGRectGetMaxY(myImage.frame)+5, width-20, CGRectGetWidth(self.view.frame)/2)];
                    
                    [self.nv.backScrollView addSubview:self.image];
                     [ self.vm setValuesForKeysWithDictionary: self.nm.video[i]];
                     self.image.image =   [KrVideoPlayerController thumbnailImageForVideo:[NSURL URLWithString: self.vm.url_m3u8] atTime:1];
                    NSLog(@"%@===%ld",self.vm.url_m3u8,self.nm.video.count);
                    [tools.hud hide:YES];
                    UIImageView *playImage = [[UIImageView alloc] initWithFrame:CGRectMake((width-20)/2-inum, (CGRectGetMaxY(self.image.frame)-CGRectGetMinY(self.image.frame))/2-inum, inum*2, inum*2)];
                    playImage.image = [UIImage imageNamed:@"play"];
                    [self.image addSubview:playImage];
                    self.image.userInteractionEnabled = YES;
                    UITapGestureRecognizer *singleTap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageAction)];
                    [self.image addGestureRecognizer:singleTap2];
                    ;
                    heightPhoto = heightPhoto+CGRectGetWidth(self.view.frame)/2+5;
                }

                self.nv.bodyLabel.text =[NSString stringWithFormat:@"%@",self.bodyString];//nm.body;
                
                self.nv.bodyLabel.frame =CGRectMake(CGRectGetMinX(self.nv.titleLabel.frame), heightPhoto, CGRectGetWidth(self.nv.titleLabel.frame), [tools G_heightForString:self.bodyString]+66);
                self.nv.backScrollView.contentSize = CGSizeMake(CGRectGetWidth(self.nv.frame)-20,[tools G_heightForString:self.bodyString]+166+heightPhoto);                }

                    }
        else// 二,没有照片的情况下
        {
            CGFloat heightPhoto =CGRectGetMaxY(self.nv.sourceLabel.frame)+5;
          
             CGFloat width = [UIScreen mainScreen].bounds.size.width;
             NSLog(@"有视频无照片");
            self.image = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.nv.titleLabel.frame), heightPhoto, width-40, CGRectGetWidth(self.view.frame)/2)];
            
            [self.nv.backScrollView addSubview:self.image];
            for (int i =0; i <self.nm.video.count; i++) {
                self.image.image =   [KrVideoPlayerController thumbnailImageForVideo:[NSURL URLWithString: self.vm.url_m3u8] atTime:1];
                [tools.hud hide:YES];
                UIImageView *playImage = [[UIImageView alloc] initWithFrame:CGRectMake((width-20)/2-inum, (CGRectGetMaxY(self.image.frame)-CGRectGetMinY(self.image.frame))/2-inum, inum*2, inum*2)];
                playImage.image = [UIImage imageNamed:@"play"];
                [self.image addSubview:playImage];
                self.image.userInteractionEnabled = YES;
                UITapGestureRecognizer *singleTap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageAction)];
                
                [self.image addGestureRecognizer:singleTap1];
                
                heightPhoto = heightPhoto +inum*4+5;

            }
           // NSLog(@"%@",self.bodyString);
            self.nv.bodyLabel.frame =CGRectMake(CGRectGetMinX(self.nv.titleLabel.frame), CGRectGetMaxY(self.image.frame)+5, CGRectGetWidth(self.nv.titleLabel.frame), [tools G_heightForString:self.bodyString]+66);
            self.nv.bodyLabel.text =[NSString stringWithFormat:@"%@",self.bodyString];//nm.body;
          //  self.nv.bodyLabel.backgroundColor = [UIColor yellowColor];
            self.nv.backScrollView.contentSize = CGSizeMake(CGRectGetWidth(self.nv.frame)-20,[tools G_heightForString:self.bodyString]+166+heightPhoto);
            

        }
        
        
    }else if(self.nm.img.count!=0)
    {
        UIImageView *myImage;
        int i =0;
        CGFloat heightPhoto =CGRectGetMaxY(self.nv.sourceLabel.frame)+5;
        for (NSDictionary *s in self.nm.img) {
            
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
            myImage.frame = CGRectMake(CGRectGetMinX(self.nv.titleLabel.frame), heightPhoto, width-20, height);
            [myImage sd_setImageWithURL:[NSURL URLWithString:detailImgModel.src]placeholderImage:bgPhoto];
            myImage.backgroundColor = [UIColor clearColor];
            myImage.tag =2;
            [self.nv.backScrollView addSubview:myImage];
            
            // 给图片设置点击事件
            myImage.userInteractionEnabled = YES;
            UITapGestureRecognizer *singleTap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(UserPhontAction:)];
            
            [  myImage addGestureRecognizer:singleTap1];
            
            //
            heightPhoto = heightPhoto +height+5;
            self.nv.bodyLabel.text =[NSString stringWithFormat:@"%@",self.bodyString];//nm.body;
            
            self.nv.bodyLabel.frame =CGRectMake(CGRectGetMinX(self.nv.titleLabel.frame), CGRectGetMaxY(myImage.frame)+5, CGRectGetWidth(self.nv.titleLabel.frame), [tools G_heightForString:self.bodyString]+66);
            self.nv.backScrollView.contentSize = CGSizeMake(CGRectGetWidth(self.nv.frame)-20,[tools G_heightForString:self.bodyString]+166+heightPhoto);
            i++;
            
            
            
        }
        
    }
    else
    {
        self.nv.bodyLabel.text = self.bodyString;//nm.body;
        self.nv.bodyLabel.frame =CGRectMake(CGRectGetMinX(self.nv.titleLabel.frame), CGRectGetMaxY(self.nv.sourceLabel.frame)+5, CGRectGetWidth(self.nv.titleLabel.frame), [tools G_heightForString:self.bodyString]+16+inum*3);
        self.nv.backScrollView.contentSize = CGSizeMake(CGRectGetWidth(self.nv.frame)-20,[tools G_heightForString:self.bodyString]+inum*6.64 );
    }
}
#pragma mark -视频未处理
-(void)imageAction
{
    NSLog(@"视频已处理");
    [self.image removeFromSuperview];
   [UIView animateWithDuration:2.f delay:0.f options:UIViewAnimationOptionLayoutSubviews animations:^{
       
       self.videoVC = [[VideoViewController alloc] init];
       
       self.videoVC.url = self.vm.url_m3u8;
       self.videoVC.view.backgroundColor = [UIColor clearColor];
       
       
       [self addChildViewController: self.videoVC];
       [self.view addSubview: self.videoVC.view];
       
       UITapGestureRecognizer *singleTap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewAction)];
       
       [ self.videoVC.view  addGestureRecognizer:singleTap1];

   } completion:^(BOOL finished) {
    
   }];
   //UINavigationController *videoNC = [[UINavigationController alloc] initWithRootViewController:videoVC];
//   [self.navigationController pushViewController:videoNC animated:YES];
    
    
}
-(void)viewAction
{
    NSLog(@"我想退出视频");
    
   [ UIView animateWithDuration:2.f delay:0.f options:UIViewAnimationOptionLayoutSubviews animations:^{
       
       
       [ self.videoVC.movieViewController dismiss];
       [self.videoVC.view removeFromSuperview];
        [self.nv.backScrollView addSubview:self.image];
       
    } completion:^(BOOL finished) {
        
    }];
    
}
#pragma mark -返回键
-(void)leftAction
{
    
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark -图片保存
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
    imageViewZoom.backgroundColor = [ UIColor redColor];
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
#pragma mark - ******************** 保存到相册方法
- (void)savePictureToAlbum:(NSString *)src
{
    
}
#pragma mark - 处理字符串
- (NSString *)touchBody
{
    NomelModel *nm =[NomelModel alloc];
    nm = (NomelModel *)self.G_getDataArr[0];
    NSMutableString *body = [NSMutableString string];
    if (nm.body != nil) {
        [body appendString:nm.body];
    }
    delet
    
    for (int i = 0; i <nm.img.count; i++) {
        [body replaceOccurrencesOfString:[NSString stringWithFormat:@"<!--IMG#%d-->",i] withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, body.length)];
        
        
    }
    
    return body;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

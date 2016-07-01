//
//  StartViewController.m
//  reads
//
//  Created by lanou3g on 15/11/13.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "StartViewController.h"

@interface StartViewController ()
@property(nonatomic,strong)UISegmentedControl *segment;
@property(nonatomic,strong)ReadsTableViewController *reads;
@property(nonatomic,strong)CollectionViewController *news;
@property(nonatomic,assign)BOOL isEditing;

@end

@implementation StartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(leftBarButtonAction:)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"删除" style:UIBarButtonItemStyleDone target:self action:@selector(rightBarButtonItemAction:)];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
    

    self.view.backgroundColor = [UIColor whiteColor];
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    
    flow.itemSize = CGSizeMake(CGRectGetWidth([UIScreen mainScreen].bounds)/2.2, CGRectGetWidth([UIScreen mainScreen].bounds)/2.1);
    flow.minimumInteritemSpacing = 5;
    flow.minimumLineSpacing =10;
    flow.scrollDirection = UICollectionViewScrollDirectionVertical;
    flow.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    
    self.isEditing = NO;
    
    self.news = [[CollectionViewController alloc] initWithCollectionViewLayout:flow];
   
    self.reads = [[ReadsTableViewController alloc] initWithStyle:UITableViewStylePlain];
    
   // self.news = [[CollectionViewController alloc] initWithStyle:UITableViewStylePlain];
   
    [self addChildViewController:self.reads];
    [self addChildViewController:self.news];
    
    [self.view addSubview:self.news.view];
    
     [self setSegmentView];
    
    
    
}

-(void)rightBarButtonItemAction:(UIBarButtonItem *)sender
{
    self.isEditing =YES;
     self.news.isEditing = self.isEditing;
    self.navigationItem.leftBarButtonItem.enabled = NO;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(right2BarButtonItemAction:)];
    
}
-(void)right2BarButtonItemAction:(UIBarButtonItem *)sender
{
    self.isEditing =NO;
    self.news.isEditing = self.isEditing;
    self.navigationItem.leftBarButtonItem.enabled = YES;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"删除" style:UIBarButtonItemStyleDone target:self action:@selector(rightBarButtonItemAction:)];
    
}

-(void)leftBarButtonAction:(UIBarButtonItem *)sender
{
    [self.navigationController  dismissViewControllerAnimated:YES completion:nil];
    
}

-(void)setSegmentView
{
    
    NSArray *arr = [NSArray arrayWithObjects:@"新闻",@"文章", nil];
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
            [self.reads.view removeFromSuperview];
           [self.view addSubview:self.news.view];
            
            
          break;
            
        case 1:
             self.navigationItem.rightBarButtonItem.enabled = NO;
          
            [self.news.view removeFromSuperview];
            [self.view addSubview:self.reads.view];
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

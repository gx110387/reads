//
//  LeftViewController.m
//  test123
//
//  Created by kf1 on 14-9-20.
//  Copyright (c) 2014年 kf1. All rights reserved.
//

#import "LeftViewController.h"

@interface LeftViewController ()
@property(nonatomic,strong) FirstViewController *firstVC;
@property(nonatomic,strong) PlayActivityTableViewController *playVC;
@property(nonatomic,strong) KeJiTableViewController *kejiVC;
@property(nonatomic,strong) CaiJingTableViewController *caijingVC;
@property(nonatomic,strong) TiYuTableViewController *tiyuVC;
@property(nonatomic,strong) CarTableViewController *carVC;
@property(nonatomic,strong) BeijingTableViewController *beiVC;
@property(nonatomic,strong) EduTableViewController *eduVC;
@property(nonatomic,strong) ShuMaTableViewController *shumaVC;
@property(nonatomic,strong) LvyouTableViewController *lvyouVC;
@end

@implementation LeftViewController

//- (id)initWithStyle:(UITableViewStyle)style
//{
//    self = [super initWithStyle:UITableViewStylePlain];
//    if (self) {
//        // Custom initialization
//    }
//    return self;
//}

-(id)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor clearColor]];
    tableview = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    tableview.backgroundColor = [UIColor clearColor];
    tableview.separatorStyle = UITableViewCellSeparatorStyleSingleLineEtched;
    tableview.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    tableview.delegate = self;
    tableview.dataSource = self;
    [self.view addSubview:tableview];
    
     self.firstVC = [[FirstViewController alloc] initWithStyle:UITableViewStylePlain];
     self.playVC = [[PlayActivityTableViewController alloc] initWithStyle:UITableViewStylePlain];
    self.kejiVC = [[KeJiTableViewController alloc] initWithStyle:UITableViewStylePlain];
    self.caijingVC = [[CaiJingTableViewController alloc] initWithStyle:UITableViewStylePlain];
     self.tiyuVC = [[TiYuTableViewController alloc] initWithStyle:UITableViewStylePlain];
    self.carVC = [[CarTableViewController alloc] initWithStyle:UITableViewStylePlain];
    self.beiVC = [[BeijingTableViewController alloc] initWithStyle:UITableViewStylePlain];
    self.eduVC = [[EduTableViewController alloc] initWithStyle:UITableViewStylePlain];
    self.shumaVC = [[ShuMaTableViewController alloc] initWithStyle:UITableViewStylePlain];
    self.lvyouVC = [[LvyouTableViewController alloc] initWithStyle:UITableViewStylePlain];
    
}


#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == Nil) {
        cell = [[UITableViewCell alloc]  initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.contentView.backgroundColor = [UIColor clearColor];
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    
    if (indexPath.row == 0) {
        cell.textLabel.text = [NSString stringWithFormat:@"头条%ld",indexPath.row];
    }
    if (indexPath.row == 1) {
        cell.textLabel.text = [NSString stringWithFormat:@"娱乐%ld",indexPath.row];
    }
    if (indexPath.row == 2) {
        cell.textLabel.text = [NSString stringWithFormat:@"科技%ld",indexPath.row];
    }
    if (indexPath.row == 3) {
        cell.textLabel.text = [NSString stringWithFormat:@"财经%ld",indexPath.row];
    }
    if (indexPath.row == 4) {
        cell.textLabel.text = [NSString stringWithFormat:@"体育%ld",indexPath.row];
    }
    if (indexPath.row == 5) {
        cell.textLabel.text = [NSString stringWithFormat:@"汽车%ld",indexPath.row];
    }if (indexPath.row == 6) {
        cell.textLabel.text = [NSString stringWithFormat:@"北京%ld",indexPath.row];
    }if (indexPath.row == 7) {
        cell.textLabel.text = [NSString stringWithFormat:@"教育%ld",indexPath.row];
    }
    if (indexPath.row == 8) {
        cell.textLabel.text = [NSString stringWithFormat:@"数码%ld",indexPath.row];
    }
   if (indexPath.row == 9) {
        cell.textLabel.text = [NSString stringWithFormat:@"旅游%ld",indexPath.row];
    }
    
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
       
              // [controller1.view setBackgroundColor:[UIColor redColor]];
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:_firstVC];
        
        AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
       [delegate.menuViewController setNewRootViewController:nav animation:YES];
 
       [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];//取消cell的选中效果
    }else if(indexPath.row == 1){
 
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:_playVC];
        
        AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        [delegate.menuViewController setNewRootViewController:nav animation:YES];
    }
    else if(indexPath.row == 2){
               UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:_kejiVC];
        
        AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        [delegate.menuViewController setNewRootViewController:nav animation:YES];
    }
    else if(indexPath.row == 3){
               UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:_caijingVC];
        
        AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        [delegate.menuViewController setNewRootViewController:nav animation:YES];
    }
    else if(indexPath.row == 4){
       
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:_tiyuVC];
        
        AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        [delegate.menuViewController setNewRootViewController:nav animation:YES];
    }
    else if(indexPath.row == 5){
               UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:_carVC];
        
        AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        [delegate.menuViewController setNewRootViewController:nav animation:YES];
    }
    else if(indexPath.row == 6){
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:_beiVC];
        
        AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        [delegate.menuViewController setNewRootViewController:nav animation:YES];
    }
    else if(indexPath.row == 7){
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:_eduVC];
        
        AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        [delegate.menuViewController setNewRootViewController:nav animation:YES];
    }
    else if(indexPath.row == 8){
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:_shumaVC];
        
        AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        [delegate.menuViewController setNewRootViewController:nav animation:YES];
    }
    else if(indexPath.row == 9){
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:_lvyouVC];
        
        AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        [delegate.menuViewController setNewRootViewController:nav animation:YES];
    }
    else{
        UIViewController *controller3 = [[UIViewController alloc]init];
        [controller3.view setBackgroundColor:[UIColor magentaColor]];
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:controller3];
        AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        [delegate.menuViewController setNewRootViewController:nav animation:YES];
         [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end

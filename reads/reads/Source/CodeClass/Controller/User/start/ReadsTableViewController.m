//
//  ReadsTableViewController.m
//  reads
//
//  Created by lanou3g on 15/11/13.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "ReadsTableViewController.h"
 
@interface ReadsTableViewController ()
@property(nonatomic,strong)NSMutableArray *G_dataArr;
@end

@implementation ReadsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.frame =CGRectMake(0, 22, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)-88);
    self.G_dataArr = [NSMutableArray array];
    
    
     [self setupRefresh];
}
/**
 *  集成刷新控件
 */
- (void)setupRefresh

{
    
    
    [self.tableView addLegendHeaderWithRefreshingTarget:self refreshingAction:@selector(headerRereshing) dateKey:@"table"];
    
    [self.tableView.header beginRefreshing];
    
    
    [self.tableView addLegendFooterWithRefreshingTarget:self refreshingAction:@selector(footerRereshing)];
    
    
}
#pragma mark 开始进入刷新状态
- (void)headerRereshing
{
    [tools G_selectReads:0 count:5 value:^(NSMutableArray *array) {
        self.G_dataArr = array;
        [self.tableView reloadData];
          [self.tableView. header endRefreshing];
       // DoLog(@"%@",array);
    }];

    }

- (void)footerRereshing
{
    
    [tools G_selectReads:self.G_dataArr.count count:5 value:^(NSMutableArray *array) {
   [self.G_dataArr addObjectsFromArray: array];
        [self.tableView reloadData];
          [self.tableView.footer endRefreshing];
        // DoLog(@"%@",array);
    }];
    }


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
// 
//    return 2;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
 
    return  self.G_dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MovieTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" ];
    if (cell == nil) {
        cell = [[MovieTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    ReadsModel *rm = self.G_dataArr[indexPath.row];
    NSArray *pixel = [rm.title componentsSeparatedByString:@"&"];
    cell.titleLabel .text  =   [pixel firstObject];
   
    cell.deatilLabel.text= [pixel lastObject];
    [cell.photoImage sd_setImageWithURL:[NSURL URLWithString:rm.url] placeholderImage:bgPhoto];
   
    
    
    //cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",rm.];
    return cell;
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 1 删除数据源
    ReadsModel *user = self.G_dataArr[indexPath.row];
    AVQuery *query = [AVQuery queryWithClassName:[NSString stringWithFormat:@"%@Reads",[tools getUserLogin]]];
    [query whereKey:@"ptime" equalTo:user.ptime];
    
    
    [query  findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        
        if (!error) {
            
            AVObject *local = [ AVObject objectWithClassName:[NSString stringWithFormat:@"%@Reads",[tools getUserLogin]]];
            for ( NSDictionary *dic in [objects valueForKey:@"localData"]) {
                
                [[local objectForKey:@"localData"] setValuesForKeysWithDictionary:dic];
            }
            for ( NSDictionary *dic in [objects valueForKey:@"objectId"] ) {
                
                local.objectId = [NSString stringWithFormat:@"%@",dic];
            }
            
            [local deleteInBackground];
            
            NSLog(@"%@",local);
        }else
        {
            NSLog(@"ddddddd");
            
        }
        
        
    }];
    
    
    //  dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)( 1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    [self.G_dataArr removeObjectAtIndex:indexPath.row ];
    //    NSLog(@"%@",self.G_UserArr);
    
    //2 操作ui
    NSLog(@"%@d",@[indexPath]);
    // [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];
    [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
    
    //  });
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
     ReadsModel *user = self.G_dataArr[indexPath.row];
    ReadsViewController  *readVC = [[ReadsViewController alloc] init];
    readVC.time =user.ptime;
    [self.navigationController pushViewController:readVC animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return CGRectGetWidth([UIScreen mainScreen].bounds)/4;
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

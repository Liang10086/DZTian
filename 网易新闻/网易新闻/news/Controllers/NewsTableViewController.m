//
//  NewsTableViewController.m
//  网易新闻
//
//  Created by 王明亮 on 16/7/21.
//  Copyright © 2016年 china. All rights reserved.
//

#import "NewsTableViewController.h"
#import "NewModel.h"
#import "NewsTableViewCell.h"

@interface NewsTableViewController ()
@property (strong, nonatomic)NSArray *arrData;
@end

@implementation NewsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

}

- (void)setUrl:(NSString *)url{
  
    [NewModel downloadWithurl:url successBlock:^(NSArray *arr) {
        //给 arrdata 赋值
        
        self.arrData = arr;

        //刷新表格
        [self.tableView reloadData];
        
    } failureBlock:^(NSError *error) {
        
        NSLog(@"失败 %@",error);
        
    }];
    

}

#pragma mark -数据源方法


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.arrData.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NewModel *model = self.arrData[indexPath.row];
    
    NSString *name;
    
    if (model.imgType) {
        
        name = @"bigcell";
    
    }else if(model.imgextra){
    
        name = @"imgs";
        
    }else{
     
        name = @"cell";
    
    }
 
    
    NewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:name forIndexPath:indexPath];

    cell.model = model;
    
    return cell;
}

#pragma
#pragma mark -- 返回 cell 行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NewModel *model = self.arrData[indexPath.row];
    
  
    
    if (model.imgType) {
        
        return 200;
        
    }else if(model.imgextra){
        
        return 150;
        
    }else{
        
      return 80;
        
    }

}

@end

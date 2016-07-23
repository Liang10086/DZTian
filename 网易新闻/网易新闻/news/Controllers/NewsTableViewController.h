//
//  NewsTableViewController.h
//  网易新闻
//
//  Created by 王明亮 on 16/7/21.
//  Copyright © 2016年 china. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsTableViewController : UITableViewController

//接收 collectionViewcell 传递过来的网址
@property (copy, nonatomic)NSString *url;

@end

//
//  NewsTableViewCell.h
//  网易新闻
//
//  Created by 王明亮 on 16/7/21.
//  Copyright © 2016年 china. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewModel.h"
@interface NewsTableViewCell : UITableViewCell
@property (strong, nonatomic)NewModel *model;
@end

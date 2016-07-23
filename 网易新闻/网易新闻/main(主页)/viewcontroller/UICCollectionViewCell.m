//
//  UICCollectionViewCell.m
//  网易新闻
//
//  Created by 王明亮 on 16/7/21.
//  Copyright © 2016年 china. All rights reserved.
//

#import "UICCollectionViewCell.h"
#import "NewsTableViewController.h"

@interface UICCollectionViewCell ()

@property(strong, nonatomic)NewsTableViewController *news;
@end

@implementation UICCollectionViewCell


- (void)awakeFromNib{

//    NSLog(@"111");
    
    UIStoryboard *Story = [UIStoryboard storyboardWithName:@"News" bundle:nil];
    
    self.news = [Story instantiateInitialViewController];
    self.news.tableView.frame = self.contentView.bounds;
    
    self.news.tableView.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1];
    
    [self addSubview:self.news.tableView];
}

- (void)setUrl:(NSString *)url{

    _url = url;
    
    self.news.url = url;
    
}

@end

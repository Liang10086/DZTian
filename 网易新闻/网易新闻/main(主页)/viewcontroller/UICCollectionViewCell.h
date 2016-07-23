//
//  UICCollectionViewCell.h
//  网易新闻
//
//  Created by 王明亮 on 16/7/21.
//  Copyright © 2016年 china. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICCollectionViewCell : UICollectionViewCell
//用来接收 mainViewControle 传递过来的url
@property (copy, nonatomic)NSString *url;
@end

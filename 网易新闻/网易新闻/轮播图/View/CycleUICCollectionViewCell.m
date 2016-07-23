//
//  CycleUICCollectionViewCell.m
//  网易新闻
//
//  Created by 王明亮 on 16/7/22.
//  Copyright © 2016年 china. All rights reserved.
//

#import "CycleUICCollectionViewCell.h"
#import "UIImageView+WebCache.h"
@interface CycleUICCollectionViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *imagName;

@property (weak, nonatomic) IBOutlet UILabel *titleName;

@end


@implementation CycleUICCollectionViewCell



- (void)setModel:(CycleModel *)model{

    _model = model;
    
    [self.imagName sd_setImageWithURL:[NSURL URLWithString:model.imgsrc]];
    
    self.titleName.text = model.title;

}

@end

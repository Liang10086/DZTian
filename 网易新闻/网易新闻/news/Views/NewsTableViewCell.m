//
//  NewsTableViewCell.m
//  网易新闻
//
//  Created by 王明亮 on 16/7/21.
//  Copyright © 2016年 china. All rights reserved.
//

#import "NewsTableViewCell.h"
#import "UIImageView+WebCache.h"

@interface NewsTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imgsrcImageView;
@property (weak, nonatomic) IBOutlet UILabel *TitleLab;
@property (weak, nonatomic) IBOutlet UILabel *sourceLab;
@property (weak, nonatomic) IBOutlet UILabel *replyLab;

//多张图片
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *imgsView;


@end



@implementation NewsTableViewCell


- (void)setModel:(NewModel *)model{


    
    
    _model = model;

        [self.imgsrcImageView sd_setImageWithURL:[NSURL URLWithString:model.imgsrc]];
        self.TitleLab.text = model.title;
        self.sourceLab.text = model.source;
        self.replyLab.text = [NSString stringWithFormat:@"%@",model.replyCount];
   
    

        for (int i = 0; i < model.imgextra.count; i ++) {
            
            //取出控件
            UIImageView *img = self.imgsView[i];
            
            NSDictionary *dict = model.imgextra[i];
            
            NSString *imgsrc = [dict objectForKey:@"imgsrc"];
            
            //给控件赋值
            [img sd_setImageWithURL:[NSURL URLWithString:imgsrc]];
        }
        
        
    
    
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

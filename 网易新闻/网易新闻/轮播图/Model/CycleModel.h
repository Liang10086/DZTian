//
//  CycleModel.h
//  网易新闻
//
//  Created by 王明亮 on 16/7/22.
//  Copyright © 2016年 china. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CycleModel : NSObject

//轮播图标题
@property (copy, nonatomic)NSString *title;
//轮播图片
@property (copy, nonatomic)NSString *imgsrc;
//下载方法
+ (void)loadCycleDataWithUrl:(NSString *)url successBlock:(void(^)(NSArray *listArr))successBlock failBlock:(void (^)(NSError *error))failBlock;


@end

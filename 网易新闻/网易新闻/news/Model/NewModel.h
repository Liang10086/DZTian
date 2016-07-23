//
//  NewModel.h
//  网易新闻
//
//  Created by 王明亮 on 16/7/21.
//  Copyright © 2016年 china. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewModel : NSObject
//网路请求方法
+ (void)downloadWithurl:(NSString *)url successBlock:(void (^)(NSArray *arr))successBlock failureBlock:(void(^)(NSError *error))failureBlock;

/// 新闻标题
@property (nonatomic,copy) NSString *title;
/// 新闻图标
@property (nonatomic,copy) NSString *imgsrc;
/// 新闻来源
@property (nonatomic,copy) NSString *source;
/// 新闻回复数
@property (nonatomic,strong) NSNumber *replyCount;
/// 多张配图
@property (nonatomic, strong) NSArray *imgextra;
/// 大图标记
@property (nonatomic, assign) BOOL imgType;



@end

//
//  NetworlTool.h
//  网易新闻
//
//  Created by 王明亮 on 16/7/21.
//  Copyright © 2016年 china. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface NetworlTool : AFHTTPSessionManager

+ (instancetype)sharedNetworlTool;

@end

//
//  NetworlTool.m
//  网易新闻
//
//  Created by 王明亮 on 16/7/21.
//  Copyright © 2016年 china. All rights reserved.
//

#import "NetworlTool.h"

@implementation NetworlTool

static id _instancetype;
+ (instancetype)sharedNetworlTool{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        NSURL *baseurl = [NSURL URLWithString:@"http://c.m.163.com/nc/"];
        _instancetype = [[self alloc]initWithBaseURL:baseurl];
    });
    
    return _instancetype;
}
@end

//
//  CycleModel.m
//  网易新闻
//
//  Created by 王明亮 on 16/7/22.
//  Copyright © 2016年 china. All rights reserved.
//

#import "CycleModel.h"
#import "NetworlTool.h"
@implementation CycleModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{}

//字典转模型
+ (instancetype)CycleModelWithDic:(NSDictionary *)dict{

    CycleModel *model = [[CycleModel alloc]init];
    //KVC
    [model setValuesForKeysWithDictionary:dict];

    return model;
}
//下载方法
+ (void)loadCycleDataWithUrl:(NSString *)url successBlock:(void (^)(NSArray *))successBlock failBlock:(void (^)(NSError *))failBlock{


    [[NetworlTool sharedNetworlTool]GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *responseObject) {
        
        //取出 key
        NSString *key = responseObject.keyEnumerator.nextObject;
        NSLog(@"key %@",key);
        
        //数组
        NSArray *arr = [responseObject objectForKey:key];
        
        //定义可变数组
        NSMutableArray *arrM = [NSMutableArray array];
        
        //遍历 arr
        [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
           //模型
            CycleModel *model = [self CycleModelWithDic:obj];
            //模型添加到可变数组里
            [arrM addObject:model];
            
        }];
        
        //判断 successBlock
        if (successBlock) {
            successBlock(arrM.copy);
        }

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (failBlock) {
            failBlock(error);
        }
        
    }];
 
}

@end

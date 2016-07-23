//
//  NewModel.m
//  网易新闻
//
//  Created by 王明亮 on 16/7/21.
//  Copyright © 2016年 china. All rights reserved.
//

#import "NewModel.h"
#import "NetworlTool.h"
@implementation NewModel

+ (void)downloadWithurl:(NSString *)url successBlock:(void (^)(NSArray *arr))successBlock failureBlock:(void (^)(NSError *))failureBlock{

    [[NetworlTool sharedNetworlTool]GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//       
//        NSLog(@"responseObject == %@",responseObject);
        NSDictionary *dic = responseObject;
        
        NSString *key = dic.keyEnumerator.nextObject;
        
        NSArray *arr = [dic objectForKey:key];
        //可变数组
        NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:arr.count];
        
        //遍历 arr
        [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
           
            NewModel *model = [self NewsModelWithDict:obj];
            
            [arrM addObject:model];
        }];
        if (successBlock) {
            
            successBlock(arrM.copy);
        
        }
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    
        if (failureBlock) {
            failureBlock(error);
        }
        
    }];

}

+ (instancetype)NewsModelWithDict:(NSDictionary *)dict{

    NewModel *model = [[NewModel alloc]init];
    
    [model setValuesForKeysWithDictionary:dict];

    return model;

}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{}
@end


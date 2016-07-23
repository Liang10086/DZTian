//
//  SSSSSSSmodel.m
//  网易新闻
//
//  Created by 王明亮 on 16/7/19.
//  Copyright © 2016年 china. All rights reserved.
//

#import "SSSSSSSmodel.h"

@implementation SSSSSSSmodel

+ (instancetype)SSSSSSSmodelWithDict:(NSDictionary *)dict{

    SSSSSSSmodel *model = [[SSSSSSSmodel alloc]init];
    
    [model setValuesForKeysWithDictionary:dict];

    return model;

}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{}

+ (NSArray *)array{

    //获取 json 地址
    NSString *path = [[NSBundle mainBundle]pathForResource:@"topic_news.json"ofType:nil];
    //转换成二进制数据
    NSData *data = [NSData  dataWithContentsOfFile:path];
    //反序列化
    NSDictionary *rootDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    //取出节点下的数组
    NSArray *tList = rootDict[@"tList"];
    
    //定义临时的可变数据,添加每次转好的模型对象
    NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:tList.count];
   
    
    //遍历.取出字典转模型
    [tList enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       
        //字典转模型
        SSSSSSSmodel *model = [SSSSSSSmodel SSSSSSSmodelWithDict:obj];
        //把模型添加到字典数组
        [arrM addObject:model];
        
    }];
    
    //排序
    [arrM sortUsingComparator:^NSComparisonResult(SSSSSSSmodel *obj1, SSSSSSSmodel *obj2) {
        return [obj1.tid compare:obj2.tid];
    }];
    
    
    return arrM.copy;
}
@end

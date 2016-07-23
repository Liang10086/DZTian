//
//  SSSSSSSmodel.h
//  网易新闻
//
//  Created by 王明亮 on 16/7/19.
//  Copyright © 2016年 china. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SSSSSSSmodel : NSObject
//标题
@property (copy, nonatomic)NSString *tname;
//id
@property (copy, nonatomic)NSString *tid;

+ (NSArray *)array;

/*
 {
 "tList": [
 {
 "template": "manual",
 "topicid": "00040BGE",
 "hasCover": false,
 "alias": "The Truth",
 "subnum": "6.8万",
 "tag": "hot",
 "recommendOrder": 0,
 "isNew": 0,
 "img": "http://img2.cache.netease.com/m/newsapp/banner/zhenhua.png",
 "isHot": 1,
 "hasIcon": true,
 "cid": "C1348654575297",
 "recommend": "0",
 "headLine": false,
 "tagDate": "2015-06-16 10:45:34.0",
 "color": "",
 "bannerOrder": 105,
 "tname": "原创",
 "ename": "zhenhua",
 "showType": "comment",
 "special": 0,
 "tid": "T1370583240249"
 }
 */
@end

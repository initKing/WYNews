//
//  WYChannelModel.m
//  WYNews
//
//  Created by CrazyHacker on 16/6/17.
//  Copyright © 2016年 CrazyHacker. All rights reserved.
//

#import "WYChannelModel.h"
#import "YYModel.h"

@implementation WYChannelModel
- (NSString *)description {
    return [self yy_modelDescription];
}

+ (NSArray *)channelList {
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"topic_news.json" withExtension:nil];
    
    // NSData 加载json数据
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    // 反序列化
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
    // 字典转模型
    NSArray *modelArray = [NSArray yy_modelArrayWithClass:[self class] json:dict[@"tList"]];
    
    // 返回排序后的结果 - 升序
   return [modelArray sortedArrayUsingComparator:^NSComparisonResult(WYChannelModel *obj1, WYChannelModel *obj2) {
        return [obj1.tid compare:obj2.tid];
    }];
}

@end

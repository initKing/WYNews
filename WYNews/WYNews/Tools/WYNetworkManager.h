//
//  WYNetworkManager.h
//  WYNews
//
//  Created by CrazyHacker on 16/6/15.
//  Copyright © 2016年 CrazyHacker. All rights reserved.
//

#import "AFHTTPSessionManager.h"

/** 负责网易新闻下载的工具类 */
@interface WYNetworkManager : AFHTTPSessionManager

+ (instancetype)sharedManager;

/** 定义接口方法, 负责下载数据工作,
    回调参数：返回的字典数组 & 加载失败的错误信息
 */
- (void)newsListWithChannel:(NSString *)channel Start:(NSInteger)start completion:(void(^)(NSArray *newsList, NSError *error))completion;

@end

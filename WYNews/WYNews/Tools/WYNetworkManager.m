//
//  WYNetworkManager.m
//  WYNews
//
//  Created by CrazyHacker on 16/6/15.
//  Copyright © 2016年 CrazyHacker. All rights reserved.
//

#import "WYNetworkManager.h"

@implementation WYNetworkManager

/** 负责网络下载工作的单例 */
+ (instancetype)sharedManager {
    static WYNetworkManager *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // 需要带反斜线
        NSURL *baseUrl = [NSURL URLWithString:@"http://c.m.163.com/nc/article/"];
        instance = [[self alloc] initWithBaseURL:baseUrl];
       
        // 设置解析格式
        instance.responseSerializer.acceptableContentTypes = [[NSSet alloc] initWithObjects:@"application/xml", @"text/xml",@"text/html",@"application/json", nil];
        
    });
    return instance;
}

// 封装AFN 的get方法, 是为了保证替换网络框架
- (void)GETRequest:(NSString *)URLString parameters:(NSDictionary *)parameters completion:(void(^)(id json, NSError *error))completion {
    
    [self GET:URLString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        // 完成回调
        completion(responseObject, nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"网络请求失败,%@",error);
        completion(nil, error);
    }];
    
}

- (void)newsListWithChannel:(NSString *)channel Start:(NSInteger)start completion:(void (^)(NSArray *, NSError *))completion {
    // 拼接URL
    NSString *urlStr = [NSString stringWithFormat:@"list/%@/%zd-20.html",channel, start];
    
    // 发起网络请求
    [self GETRequest:urlStr parameters:nil completion:^(id json, NSError *error) {
        
        NSLog(@"json --> %@",json);
        NSArray *array = json[channel];
        completion(array, nil);
        
    }];

}

@end

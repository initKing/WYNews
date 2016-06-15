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
        NSURL *baseUrl = [NSURL URLWithString:@"http://c.m.163.com/nc/article/list/"];
        instance = [[self alloc] initWithBaseURL:baseUrl];
       
        // 设置解析格式
        instance.responseSerializer.acceptableContentTypes = [[NSSet alloc] initWithObjects:@"application/xml", @"text/xml",@"text/html", nil];
        
    });
    return instance;
}






@end

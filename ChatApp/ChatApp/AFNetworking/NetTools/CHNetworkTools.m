//
//  CHNetworkTools.m
//  ChatApp
//
//  Created by CrazyHacker on 16/6/17.
//  Copyright © 2016年 CrazyHacker. All rights reserved.
//

#import "CHNetworkTools.h"

@implementation CHNetworkTools
+ (instancetype)sharedManager {
    static CHNetworkTools *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [self new];
    });
    return instance;
}


- (void)loginWithCompletion:(void (^)(BOOL isSuccess))completion {
    
    // 0. 判断用户名、密码是否存在
    if (self.userPassword == nil && self.userName == nil) {
        return;
    }
    
    // 1. url - 单纯负责登录的脚本
    NSURL *url = [NSURL URLWithString:@"http://localhost/login.php"];
    
    // 2. 建立 POST 请求
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    // 1> 指定请求方法
    request.HTTPMethod = @"POST";
    
    // 2> 指定要发送给服务器的数据体
   
    NSString *formString = [NSString stringWithFormat:@"username=%@&password=%@", self.userName, self.userPassword];
    NSData *formData = [formString dataUsingEncoding:NSUTF8StringEncoding];
    
    request.HTTPBody = formData;
    
    // 3. 发送数据任务，并且启动
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error != nil) {
            NSLog(@"请求错误!");
            
            return;
        }
        
        // 反序列化
        NSDictionary *result = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
        
        NSLog(@"%@", result);
        
        // 判断返回的 userId > 0 表示登录成功
        BOOL isSuccess = ([result[@"userId"] integerValue] > 0);
        
        // 使用属性记录是否登录成功
        self.isLogin = isSuccess;
        
        
        // 登录成功和失败都要在`主线程`执行完成回调
        if (completion != nil) {
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(isSuccess);
            });
        }
    }] resume];

    
    
}


@end

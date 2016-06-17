//
//  CHNetworkTools.h
//  ChatApp
//
//  Created by CrazyHacker on 16/6/17.
//  Copyright © 2016年 CrazyHacker. All rights reserved.
//

#import <Foundation/Foundation.h>
/** 负责网络登录的工具类 */
@interface CHNetworkTools : NSObject

+ (instancetype)sharedManager;

/**
 * 用户名
 */
@property (nonatomic, copy) NSString *userName;
/**
 * 用户口令
 */
@property (nonatomic, copy) NSString *userPassword;

/**
 * 是否登录成功标记
 */
@property (nonatomic, assign) BOOL isLogin;

/**
 * 异步的用户登录(发起了两次网络请求)
 */
- (void)loginWithCompletion:(void (^)(BOOL isSuccess))completion;

@end

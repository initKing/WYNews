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
@end

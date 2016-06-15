//
//  AppDelegate.m
//  WYNews
//
//  Created by CrazyHacker on 16/6/14.
//  Copyright © 2016年 CrazyHacker. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self setupAppearence];
    _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
   // Class cls = NSClassFromString(@"WYMainViewController");
     Class cls = NSClassFromString(@"WYNewsListController");
    _window.rootViewController = [[cls alloc] init];
    
    [_window makeKeyAndVisible];
    
    
    
    return YES;
}

- (void)setupAppearence {
    // 设置导航栏的外观颜色 - 尽可能早的使用 appearance 方法设置
    [UITabBar appearance].tintColor = [UIColor cz_colorWithHex:0xDF0000];
}

@end

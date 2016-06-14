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
    
    _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    UITabBarController *tabCtl = [[UITabBarController alloc] init];
    tabCtl.view.backgroundColor = [UIColor whiteColor];
    
    
    _window.rootViewController = tabCtl;
    
    [_window makeKeyAndVisible];
    
    
    
    return YES;
}


@end

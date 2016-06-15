//
//  WYMainViewController.m
//  WYNews
//
//  Created by CrazyHacker on 16/6/15.
//  Copyright © 2016年 CrazyHacker. All rights reserved.
//

#import "WYMainViewController.h"

@interface WYMainViewController ()

@end

@implementation WYMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 设置子控制器
    [self setupChildViewController];
}

- (void)setupChildViewController {
    NSArray *array = @[
                       @{@"ctrlName": @"WYHomeViewController", @"title":@"新闻", @"imgName":@"news"},
                       @{@"ctrlName":@"UIViewController", @"title":@"阅读", @"imgName":@"reader"},
                       @{@"ctrlName":@"UIViewController", @"title":@"视频", @"imgName":@"media"},
                       @{@"ctrlName":@"UIViewController", @"title":@"话题", @"imgName":@"bar"},
                       @{@"ctrlName":@"UIViewController", @"title":@"我", @"imgName":@"me"}
        ];
    
    // 遍历数组
    NSMutableArray <__kindof UIViewController *>*arrayM = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        UIViewController *vc = [self creatChildViewControllerWithDict:dict];
        // 添加到可变数组
        [arrayM addObject:vc];
    }
    
    // 设置tabBar的子控制器
    self.viewControllers = arrayM.copy;

}

- (UIViewController *)creatChildViewControllerWithDict:(NSDictionary *)dict {
   
   
    // 1. 创建控制器
    
    NSString *clsName = dict[@"ctrlName"];
    Class cls = NSClassFromString(clsName);
    
     // 断言
    NSAssert(cls != nil, @"传入了错误类名");

    UIViewController *vc = [[cls alloc] init];
    
    // 2. 设置标题
    vc.title = dict[@"title"];
    
    // 3. 设置普通状态图像
    vc.tabBarItem.image = [UIImage imageNamed:[NSString stringWithFormat:@"tabbar_icon_%@_normal",dict[@"imgName"]]];
    
    // 4. 设置高亮状态图像 设置渲染
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:[NSString stringWithFormat:@"tabbar_icon_%@_highlight",dict[@"imgName"]]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 5. 设置导航控制器
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    
    // 6. 返回控制器
    return nav;
}

@end

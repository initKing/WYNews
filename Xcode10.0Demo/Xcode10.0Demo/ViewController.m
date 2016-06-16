//
//  ViewController.m
//  Xcode10.0Demo
//
//  Created by CrazyHacker on 16/6/16.
//  Copyright © 2016年 CrazyHacker. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@",[[UIDevice currentDevice] systemVersion]);
    
    
    // 正式版才可以上架框架
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

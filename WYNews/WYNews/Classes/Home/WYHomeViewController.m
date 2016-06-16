//
//  WYHomeViewController.m
//  WYNews
//
//  Created by CrazyHacker on 16/6/15.
//  Copyright © 2016年 CrazyHacker. All rights reserved.
//

#import "WYHomeViewController.h"
#import "WYNewsChannelView.h"

@interface WYHomeViewController ()

@end

@implementation WYHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupUI];
    
}

- (void)setupUI {
    
 
    WYNewsChannelView *cv = [WYNewsChannelView initChannelView];
//    self.automaticallyAdjustsScrollViewInsets = YES;
    [self.view addSubview:cv];
    
    [cv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.equalTo(self.view);
        make.top.equalTo(self.mas_topLayoutGuideBottom);
        make.height.mas_equalTo(38);
    }];
    
    
    
}
@end

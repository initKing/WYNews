//
//  WYHomeViewController.m
//  WYNews
//
//  Created by CrazyHacker on 16/6/15.
//  Copyright © 2016年 CrazyHacker. All rights reserved.
//

#import "WYHomeViewController.h"
#import "WYNewsChannelView.h"
#import "WYChannelModel.h"

@interface WYHomeViewController ()

/** 频道模型数组 */
@property (nonatomic, strong) NSArray <WYChannelModel *> *channelList;
@end

@implementation WYHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupUI];
    
}

#pragma mark - 搭建频道视图
- (void)setupUI {
    
    WYNewsChannelView *cv = [WYNewsChannelView initChannelView];
//    self.automaticallyAdjustsScrollViewInsets = YES;
    [self.view addSubview:cv];
    
    [cv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.equalTo(self.view);
        make.top.equalTo(self.mas_topLayoutGuideBottom);
        make.height.mas_equalTo(38);
    }];
    
    // load channel data
    [self loadData];
    
}

#pragma mark - 加载频道模型数组
- (void)loadData {
    NSArray *array = [WYChannelModel channelList];
    _channelList = array;
}
@end

//
//  WYNewsListController.m
//  WYNews
//
//  Created by CrazyHacker on 16/6/15.
//  Copyright © 2016年 CrazyHacker. All rights reserved.
//

#import "WYNewsListController.h"


static NSString *simpleCell = @"simpleCell";
@interface WYNewsListController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation WYNewsListController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupUI];
}

- (void)setupUI {
    // 1. 创建tableView
    UITableView *tv = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    
    // 2. 添加
    [self.view addSubview:tv];
    
    [tv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    // 3. 设置细节
    tv.rowHeight = 100;
    
    // 4. 注册原型cell
    [tv registerNib:[UINib nibWithNibName:@"" bundle:nil] forCellReuseIdentifier:simpleCell];
    
    // 5. 指定代理、数据源
    tv.delegate = self;
    tv.dataSource = self;
    
}


@end

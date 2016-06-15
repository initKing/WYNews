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

@property (nonatomic, weak) UITableView *tableView;

@end

@implementation WYNewsListController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupUI];
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleCell forIndexPath:indexPath];
    
    cell.textLabel.text = @(indexPath.row).description;
    
    return cell;
}


#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - setupUI
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
#warning TODO 替换cell
 //  [tv registerNib:[UINib nibWithNibName:@"" bundle:nil] forCellReuseIdentifier:simpleCell];
   
    [tv registerClass:[UITableViewCell class] forCellReuseIdentifier:simpleCell];
    
    // 5. 指定代理、数据源
    tv.delegate = self;
    tv.dataSource = self;
    _tableView = tv;
    
}


@end

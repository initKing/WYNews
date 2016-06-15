//
//  WYNewsListController.m
//  WYNews
//
//  Created by CrazyHacker on 16/6/15.
//  Copyright © 2016年 CrazyHacker. All rights reserved.
//

#import "WYNewsListController.h"
#import "WYNetworkManager.h"
#import "WYNewsListModel.h"

static NSString *simpleCell = @"simpleCell";
@interface WYNewsListController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray <__kindof WYNewsListModel *> *newsList;
@property (nonatomic, weak) UITableView *tableView;

@end

@implementation WYNewsListController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupUI];
    
    [self loadData];
}

#pragma mark - loadData
- (void)loadData{
        [[WYNetworkManager sharedManager] newsListWithChannel:@"T1348648517839" Start:0 completion:^(NSArray *newsList, NSError *error) {
            
            // 1. 字典转模型
          NSArray *list = [NSArray yy_modelArrayWithClass:[WYNewsListModel class] json:newsList];
            
            // 2. 记录模型数组
            self.newsList = [NSMutableArray arrayWithArray:list];
            // 3. 更新数据
            [self.tableView reloadData];
        }];
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.newsList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleCell forIndexPath:indexPath];
    
    cell.textLabel.text = _newsList[indexPath.row].title;
    
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

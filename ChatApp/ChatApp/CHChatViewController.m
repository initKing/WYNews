//
//  CHChatViewController.m
//  ChatApp
//
//  Created by CrazyHacker on 16/6/17.
//  Copyright © 2016年 CrazyHacker. All rights reserved.
//

#import "CHChatViewController.h"
#import "CZAdditions.h"
#import "YYModel.h"
#import "ChatModel.h"
#import "CHChatDetailViewController.h"
#import "CHChatCell.h"

static NSString *cellId = @"cellId";
@interface CHChatViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@end

@implementation CHChatViewController {
    NSArray <ChatModel *> *_dataList;
}

- (void)loadView {
    _tableView = [[UITableView alloc] init];
    
    self.view = _tableView;
    
    _tableView.rowHeight = 100;
    
    [self loadData];
    
    [_tableView registerClass:[CHChatCell class] forCellReuseIdentifier:cellId];
    _tableView.dataSource = self;
    _tableView.delegate = self;

}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor whiteColor];
    
}

- (void)loadData {
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"itcast.json" withExtension:nil];
    
    // NSData 加载json数据
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    // 反序列化
    NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
    // 字典转模型
    NSArray *arr = [NSArray yy_modelArrayWithClass:[self class] json:array];
    
    NSLog(@"arr = %@",arr);
    _dataList = arr;
    
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [_tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    CHChatDetailViewController *dc = [[CHChatDetailViewController alloc] init];
    [self.navigationController pushViewController:dc animated:YES];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CHChatCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    cell.textLabel.text = _dataList[indexPath.row].title;
    
//    cell.model = _dataList[indexPath.row];
    
    
    return cell;
    
}

@end

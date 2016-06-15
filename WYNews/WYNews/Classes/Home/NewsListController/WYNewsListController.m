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
#import "WYNewsListCell.h"
#import "UIImageView+WebCache.h"

static NSString *simpleCell = @"simpleCell";
static NSString *exeraCell = @"exeraCell";
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
    // 1. 根据model的属性判断使用何种cell
    WYNewsListModel *model = self.newsList[indexPath.row];
    
//    NSString *cellId = model.imgextra.count > 0 ? exeraCell : simpleCell;
    NSString *cellId;
    if (model.imgextra.count > 0) {
        cellId = exeraCell;
    } else {
        cellId = simpleCell;
    }
    
    // 2. 查询出队cell
    WYNewsListCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    
    // 3. 设置cell的属性
    cell.titleLabel.text = model.title;
    cell.sourceLabel.text = model.source;
    
    if (model.replyCount >= 10000) {
        cell.replyCountLabel.text = [NSString stringWithFormat:@"%@万跟帖",@(model.replyCount / 10000).description];
    } else if (model.replyCount > 0 && model.replyCount < 10000){
        cell.replyCountLabel.text = [NSString stringWithFormat:@"%@跟帖",@(model.replyCount).description];
    } else {
        cell.replyCountLabel.text = @"";
    }
    
    NSURL *imgURL = [NSURL URLWithString:model.imgsrc];
    [cell.iconView sd_setImageWithURL:imgURL];
    
    // 设置多张图像
    NSInteger index = 0;
    for (NSDictionary *dict in model.imgextra) {
       NSURL *extraImg = [NSURL URLWithString:dict[@"imgsrc"]];
        UIImageView *iv = cell.iconViewSet[index++];
        [iv sd_setImageWithURL:extraImg];
        
    }
    
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
    tv.estimatedRowHeight = 100;
    tv.rowHeight = UITableViewAutomaticDimension;
    tv.separatorStyle = UITableViewCellSeparatorStyleNone;
    // 4. 注册原型cell

   [tv registerNib:[UINib nibWithNibName:@"WYNewsNormalCell" bundle:nil] forCellReuseIdentifier:simpleCell];
   
    [tv registerNib:[UINib nibWithNibName:@"WYNewsExtraCell" bundle:nil] forCellReuseIdentifier:exeraCell];

    // 5. 指定代理、数据源
    tv.delegate = self;
    tv.dataSource = self;
    _tableView = tv;
    
}


@end

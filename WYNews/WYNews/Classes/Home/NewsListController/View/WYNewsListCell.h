//
//  WYNewsListCell.h
//  WYNews
//
//  Created by CrazyHacker on 16/6/15.
//  Copyright © 2016年 CrazyHacker. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WYNewsListModel;
@interface WYNewsListCell : UITableViewCell

/** 新闻数据模型 */
@property (nonatomic, strong) WYNewsListModel *newsModel;
@end

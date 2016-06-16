//
//  WYNewsListCell.m
//  WYNews
//
//  Created by CrazyHacker on 16/6/15.
//  Copyright © 2016年 CrazyHacker. All rights reserved.
//

#import "WYNewsListCell.h"
#import "WYNewsListModel.h"
#import "UIImageView+CH_ImageView.h"

@interface WYNewsListCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *sourceLabel;
@property (weak, nonatomic) IBOutlet UILabel *replyCountLabel;
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *iconViewSet;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@end
@implementation WYNewsListCell
- (void)setNewsModel:(WYNewsListModel *)newsModel {
    _newsModel = newsModel;
    // 3. 设置cell的属性
    _titleLabel.text = _newsModel.title;
    _sourceLabel.text = _newsModel.source;
    
    if (_newsModel.replyCount >= 10000) {
        _replyCountLabel.text = [NSString stringWithFormat:@"%@万跟帖",@(_newsModel.replyCount / 10000).description];
    } else if (_newsModel.replyCount > 0 && _newsModel.replyCount < 10000){
        _replyCountLabel.text = [NSString stringWithFormat:@"%@跟帖",@(_newsModel.replyCount).description];
    } else {
        _replyCountLabel.text = @"";
    }
    
    [_iconView ch_setImageWithURLString:_newsModel.imgsrc];
    
    // 设置多张图像
    NSInteger index = 0;
    for (NSDictionary *dict in _newsModel.imgextra) {
    
        [_iconViewSet[index++] ch_setImageWithURLString:dict[@"imgsrc"]];
        }
    }

@end

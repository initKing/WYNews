//
//  WYNewsListCell.h
//  WYNews
//
//  Created by CrazyHacker on 16/6/15.
//  Copyright © 2016年 CrazyHacker. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WYNewsListCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *sourceLabel;
@property (weak, nonatomic) IBOutlet UILabel *replyCountLabel;
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *iconViewSet;

@end

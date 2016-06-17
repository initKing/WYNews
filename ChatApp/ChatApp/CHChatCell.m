//
//  CHChatCell.m
//  ChatApp
//
//  Created by CrazyHacker on 16/6/17.
//  Copyright © 2016年 CrazyHacker. All rights reserved.
//

#import "CHChatCell.h"
#import "Masonry.h"
#import "CZAdditions.h"
#import "ChatModel.h"
#import "UIImageView+WebCache.h"

@interface CHChatCell()

@property (nonatomic, weak) UIImageView *icon;
@property (nonatomic, weak) UILabel *titleLabel;
@property (nonatomic, weak) UILabel *lesstionLabel;
@property (nonatomic, weak) UILabel *teacherLable;
@end
@implementation CHChatCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        //[self setupCell];
    }
    return self;
}


- (void)setModel:(ChatModel *)model {
    _model = model;
    _lesstionLabel.text = model.day;
    _teacherLable.text = model.teacher;
    _titleLabel.text = model.title;
    NSURL *url = [NSURL URLWithString:model.imageName];
    [_icon sd_setImageWithURL:url];
    
}

- (void)setupCell {
    UIImageView *iv = [[UIImageView alloc] init];
    [self.contentView addSubview:iv];
    
    [iv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self.contentView).offset(15);
        make.height.with.mas_equalTo(50);
    }];
    
    UILabel *title = [UILabel cz_labelWithText:@"" fontSize:17 color:[UIColor darkGrayColor]];
      [self.contentView addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(iv);
        make.left.equalTo(iv.mas_right).offset(10);
    }];
    
    
    UILabel *lesstion = [UILabel cz_labelWithText:@"" fontSize:17 color:[UIColor darkGrayColor]];
    [self.contentView addSubview:lesstion];
    [lesstion mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(title);
        make.top.equalTo(title.mas_bottom).offset(30);
    }];
    
    
    UILabel *teacher = [UILabel cz_labelWithText:@"" fontSize:17 color:[UIColor darkGrayColor]];
    [self.contentView addSubview:teacher];
    [teacher mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(lesstion.mas_right).offset(15);
        make.baseline.equalTo(lesstion);
    }];
    
    _titleLabel = title;
//    _icon = iv;
//    _teacherLable = teacher;
//    _lesstionLabel = lesstion;
}
@end

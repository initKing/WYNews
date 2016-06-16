//
//  WYNewsChannelView.h
//  WYNews
//
//  Created by CrazyHacker on 16/6/17.
//  Copyright © 2016年 CrazyHacker. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WYChannelModel;
@interface WYNewsChannelView : UIView

@property (nonatomic, strong) NSArray <WYChannelModel *> *channewList;
+ (instancetype)initChannelView;
@end

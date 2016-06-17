//
//  CHChatCell.h
//  ChatApp
//
//  Created by CrazyHacker on 16/6/17.
//  Copyright © 2016年 CrazyHacker. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ChatModel;
@interface CHChatCell : UITableViewCell

@property (nonatomic, strong) ChatModel *model;
@end

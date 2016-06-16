//
//  WYChannelModel.h
//  WYNews
//
//  Created by CrazyHacker on 16/6/17.
//  Copyright © 2016年 CrazyHacker. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WYChannelModel : NSObject
/** 频道名 */
@property (nonatomic, copy) NSString *tname;

/** 频道ID */
@property (nonatomic, copy) NSString *tid;

+ (NSArray *)channelList;
@end

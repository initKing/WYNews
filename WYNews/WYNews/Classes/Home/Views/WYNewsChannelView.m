//
//  WYNewsChannelView.m
//  WYNews
//
//  Created by CrazyHacker on 16/6/17.
//  Copyright © 2016年 CrazyHacker. All rights reserved.
//

#import "WYNewsChannelView.h"

@implementation WYNewsChannelView

+ (instancetype)initChannelView {
    UINib *nib = [UINib nibWithNibName:@"WYNewsChannelView" bundle:nil];
    
    return [nib instantiateWithOwner:nil options:nil].lastObject;
}
@end

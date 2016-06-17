//
//  ChatModel.m
//  ChatApp
//
//  Created by CrazyHacker on 16/6/17.
//  Copyright © 2016年 CrazyHacker. All rights reserved.
//

#import "ChatModel.h"
#import "YYModel.h"

@implementation ChatModel

- (NSString *)description {
    
    return [self yy_modelDescription];
}
@end

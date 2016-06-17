//
//  WYNewsChannelLabel.m
//  WYNews
//
//  Created by CrazyHacker on 16/6/17.
//  Copyright © 2016年 CrazyHacker. All rights reserved.
//

#define kLabelNormalFont 14
#define kLabelSelectedFont 18

#import "WYNewsChannelLabel.h"



@implementation WYNewsChannelLabel
+ (UILabel *)labelWithTitle:(NSString *)title fontSize:(float )fontSize {
    
    UILabel *label = [UILabel cz_labelWithText:title fontSize:kLabelSelectedFont color:[UIColor whiteColor]];
    
    return label;
}

@end

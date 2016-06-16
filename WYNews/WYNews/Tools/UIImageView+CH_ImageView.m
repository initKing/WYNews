//
//  UIImageView+CH_ImageView.m
//  WYNews
//
//  Created by CrazyHacker on 16/6/17.
//  Copyright © 2016年 CrazyHacker. All rights reserved.
//

#import "UIImageView+CH_ImageView.h"
#import "UIImageView+WebCache.h"

@implementation UIImageView (CH_ImageView)
- (void)ch_setImageWithURLString:(NSString *)urlString {
    NSURL *url = [NSURL URLWithString:urlString];
    if (url != nil) {
        [self sd_setImageWithURL:url];
    }
    
}
@end

//
//  WYNewsListModel.h
//  WYNews
//
//  Created by CrazyHacker on 16/6/15.
//  Copyright © 2016年 CrazyHacker. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WYNewsListModel : NSObject
/** 新闻标题 */
@property (nonatomic, copy) NSString *title;
/** 新闻摘要 */
@property (nonatomic, copy) NSString *digest;
/** 跟帖数量 */
@property (nonatomic, assign) NSInteger replyCount;
/** 配图 */
@property (nonatomic, copy) NSString *imgsrc;

/** 多图 */
@property (nonatomic, strong) NSArray *imgextra;
/** 新闻来源*/
@property (nonatomic, copy) NSString *source;

@end

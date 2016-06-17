//
//  ChatModel.h
//  ChatApp
//
//  Created by CrazyHacker on 16/6/17.
//  Copyright © 2016年 CrazyHacker. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChatModel : NSObject

/**
 *  内容
 */
@property (nonatomic, strong) NSString *desc;
/**
 *
 */
@property (nonatomic, copy) NSString *day;

@property (nonatomic, copy) NSString *teacher;

@property (nonatomic, copy) NSString *imageName;

@property (nonatomic, copy) NSString *title;
@end

//
//  ViewController.m
//  ChatApp
//
//  Created by CrazyHacker on 16/6/17.
//  Copyright © 2016年 CrazyHacker. All rights reserved.
//

#import "ViewController.h"
#import "CHNetworkTools.h"
#import "CHChatViewController.h"
@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *pwd;
@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.iconView.layer.cornerRadius = 45;
}

#pragma mark - 登录
- (IBAction)logIn {
    
    CHNetworkTools *tools = [CHNetworkTools sharedManager];
    tools.userPassword = self.pwd.text;
    tools.userName = self.userName.text;
    
    [tools loginWithCompletion:^(BOOL isSuccess) {
        if (isSuccess) {
            CHChatViewController *chatVC = [[CHChatViewController alloc] init];
            
            [self.navigationController pushViewController:chatVC animated:YES];

        }
    }];
}


@end

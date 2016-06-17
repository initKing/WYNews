//
//  AppDelegate.m
//  ChatApp
//
//  Created by CrazyHacker on 16/6/17.
//  Copyright © 2016年 CrazyHacker. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
/*
 二、简答题
 1、多线程的优缺点?
 答:   
   优点：  能适当提高程序的执行效率
              能适当提高资源的利用率（CPU，内存）
              线程上的任务执行完成后，线程会自动销毁
 
   缺点: 开启线程需要占用一定的内存空间（默认情况下，每一个线程都占 512 KB）
        如果开启大量的线程，会占用大量的内存空间，降低程序的性能
        线程越多，CPU 在调用线程上的开销就越大
        程序设计更加复杂，比如线程间的通信、多线程的数据共享
 
 2、互斥锁和自旋锁的异同点？
    答  1> 相同点 ： - 能够保证同一时间，只有一条线程执行锁定范围的代码
        2> 不同点
            互斥锁
                如果发现其他线程正在执行锁定代码，线程会进入休眠(就绪状态)
                等待其他线程时间片到打开锁后，线程会被唤醒(执行)
            自旋锁
                如果发现有其他线程正在锁定代码，线程会用死循环的方式，一直等待锁定的代码执行完成
        结论
            a> 自旋锁更适合执行非常短的代码
            b> 无论什么锁，都是要付出代价
 
 3、全局队列 & 并发队列的区别
    答：全局队列 是系统为了方便程序员开发提供的，其工作表现与并发队列一致
 - 全局队列
        没有名称
        无论 MRC & ARC 都不需要考虑释放
        日常开发中，建议使用"全局队列"
 - 并发队列
       有名字，和 NSThread 的 name 属性作用类似
       如果在 MRC 开发时，需要使用 dispatch_release(q); 释放相应的对象
       dispatch_barrier 必须使用自定义的并发队列
       开发第三方框架时，建议使用并发队列
 
 
 4、HTTPS与 HTTP 的区别
 答： HTTPS（全称：Hyper Text Transfer Protocol over Secure Socket Layer），是以安全为目标的HTTP通道，简单讲是 HTTP 的安全版
 
 区别： https 协议需要到 ca 申请证书，一般免费证书很少，需要交费
       http 是超文本传输协议，信息是明文传输，https 则是具有安全性的 ssl 加密传输协议
       http 和 https 使用的是完全不同的连接方式，用的端口也不一样，前者是 80，后者是 443
       http 的连接很简单，是无状态的；HTTPS协议是由 SSL+HTTP 协议构建的可进行加密传输、身份认证的网络协议，比 http 协议安全
 

 三、编程题
 编程题要求
 完成登陆页面
 点击登陆按钮，进行网络请求，如果成功切换到主控制器，失败弹出提示框
 主控制器中，点击cell切换控制器展示详细信息
 
 
 
 */

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

@end

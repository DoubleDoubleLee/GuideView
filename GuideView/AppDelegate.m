//
//  AppDelegate.m
//  GuideView
//
//  Created by luds on 15/12/3.
//  Copyright © 2015年 luds. All rights reserved.
//

#import "AppDelegate.h"

#import "GuideViewController.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    // 引导页只出现一次/ 从引导页跳转到主界面之后, 就不再显示引导页
    
    // 1. 在本地设置一个标志 "shouldJumpGuide", 值为BOOL类型
    // 2. 当用户点击了最后一张图片, 程序切换到主界面的时候, 给 "shouldJumpGuide" 一个状态为YES
    // 3. 当程序再次启动的时候, 从本地读取 "shouldJumpGuide" 这个key对应的值, 如果是YES, 就跳过引导页, 直接将window的根视图控制器设置为主界面. 如果是NO, 就显示引导页.
    
    
    // 读取 "shouldJumpGuide" 这个key对应的值
    BOOL shouldJumpGuide = [[[NSUserDefaults standardUserDefaults] valueForKey:@"shouldJumpGuide"] boolValue];
    
    // 判断本地的标志
    if (shouldJumpGuide) {
        // 上次已经点击过引导页了, 直接显示主界面
        [self setViewControllerRoot];
    }
    else {
        // 还没有跳过引导页, 显示引导页
        [self setGuideViewControllerRoot];
    }
    
    
    
    return YES;
}

/**
 *  将引导页设置为window的根视图控制器
 */
- (void)setGuideViewControllerRoot {
    
    // 1. 实例化GuideViewController对象
    GuideViewController *guide = [[GuideViewController alloc] init];
    
    // 代码块中内容
    guide.complete = ^{
        // 将本地存储是否需要跳过引导页的标志, 置为YES
        [[NSUserDefaults standardUserDefaults] setValue:@YES forKey:@"shouldJumpGuide"];
        
        // 切换window的根视图控制器
        [self setViewControllerRoot];
    };
    
    
    // 2. 设置设置根视图控制器
    self.window.rootViewController = guide;
    
}
/**
 *  将viewController设置为window的根视图控制器
 */
- (void)setViewControllerRoot {
    
    ViewController *vc = [[ViewController alloc] init];
    
    self.window.rootViewController = vc;
    
}
















@end

//
//  GuideViewController.h
//  GuideView
//
//  Created by luds on 15/12/3.
//  Copyright © 2015年 luds. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GuideViewController : UIViewController

// 点击引导页最后一张图, 跳转到应用程序的主界面
@property (nonatomic, copy) void (^complete)();


@end









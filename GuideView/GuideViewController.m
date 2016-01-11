//
//  GuideViewController.m
//  GuideView
//
//  Created by luds on 15/12/3.
//  Copyright © 2015年 luds. All rights reserved.
//

#import "GuideViewController.h"

@interface GuideViewController ()<UIScrollViewDelegate>

@end

@implementation GuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createScrollView];
    
    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(run) userInfo:nil repeats:YES];
    
}

- (void)run {
    // 1. 获取scrollView
    UIScrollView *sc = (UIScrollView *)[self.view viewWithTag:987];
    
    // 2. 自动滚动
    CGPoint point = sc.contentOffset;
    point.x += CGRectGetWidth(sc.frame);
    [sc setContentOffset:point animated:YES];
}

// 以setContentOffset: animaed:YES 实现滚动的, 滚动结束会调用这个方法
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    
    NSInteger page = scrollView.contentOffset.x / CGRectGetWidth(scrollView.frame);
    
    NSLog(@"%zd", page);
}




// 创建一个scrollView
- (void)createScrollView {
    // 1. 创建一个scrollView
    UIScrollView *sc = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    
    // 2.
    // 每一个图片的宽
    float width = CGRectGetWidth(sc.frame);
    // 每一个图片的高
    float height = CGRectGetHeight(sc.frame);
    
    for (int i = 0; i < 4; i++) {
        
        // 1. 创建imageView
        UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(width * i, 0, width, height)];
        
        // 设置图片
        img.image = [UIImage imageNamed:[NSString stringWithFormat:@"火影%02d", i + 1]];
        
        // 2. 给图片添加点击事件
        if (i == 3) {
            // imageView默认的交互是关闭的, 我们需要手动打开
            img.userInteractionEnabled = YES;
            // 给最后一张图片添加点击事件
            [img addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)]];
        }
        
        // 将设置好的imageView添加到scrollView上
        [sc addSubview:img];
    }
    
    // 设置scrollView的contentSize
    sc.contentSize = CGSizeMake(width * 4, 0);
    
    // 设置分页
    sc.pagingEnabled = YES;
    
    sc.tag = 987;
    sc.delegate = self;
    
    
    // 将scrollView添加到视图上
    [self.view addSubview:sc];
    
}

// 最后一张图片的点击事件
- (void)tapAction:(UITapGestureRecognizer *)tap {
    // 切换window的根视图控制器
    NSLog(@"点击了最后一张图片");
    
    // 调用代码块中的内容
    if (self.complete) {
        self.complete();
    }
}













@end

//
//  MineViewController.m
//  系统地图
//
//  Created by qixin on 2018/5/15.
//  Copyright © 2018年 qixin. All rights reserved.
//

#import "MineViewController.h"
#import "MyLayoutDemoViewController.h"
#import "FrameTestViewController.h"

@interface MineViewController ()

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 200, 200, 30)];
    [btn setTitle:@"MyLayout" forState:(UIControlStateNormal)];
    [btn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [btn addTarget:self action:@selector(toMylayout) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:btn];
    
    UIButton *btn2 = [[UIButton alloc]initWithFrame:CGRectMake(100, 250, 200, 30)];
    [btn2 setTitle:@"FrameTest" forState:(UIControlStateNormal)];
    [btn2 setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [btn2 addTarget:self action:@selector(toFrameTest) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:btn2];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    // 隐藏大标题
    self.navigationController.navigationBar.prefersLargeTitles = NO;
    // tabbar 不隐藏
    self.tabBarController.tabBar.hidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)toMylayout{
    [self.navigationController pushViewController:[MyLayoutDemoViewController new] animated:YES];
    self.tabBarController.tabBar.hidden = YES;
}

- (void)toFrameTest{
    [self.navigationController pushViewController:[FrameTestViewController new] animated:YES];
    self.tabBarController.tabBar.hidden = YES;
}

@end

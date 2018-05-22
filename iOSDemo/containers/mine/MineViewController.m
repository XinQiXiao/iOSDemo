//
//  MineViewController.m
//  系统地图
//
//  Created by qixin on 2018/5/15.
//  Copyright © 2018年 qixin. All rights reserved.
//

#import "MineViewController.h"
#import "FrameTestViewController.h"
#import "LinearLayoutViewController.h"
#import "FlowLayoutViewController.h"

@interface MineViewController ()

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 200, 200, 30)];
    [btn setTitle:@"FrameTest" forState:(UIControlStateNormal)];
    [btn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [btn addTarget:self action:@selector(toFrameTest) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:btn];
    
    UIButton *btn2 = [[UIButton alloc]initWithFrame:CGRectMake(100, 250, 200, 30)];
    [btn2 setTitle:@"LinearLayout" forState:(UIControlStateNormal)];
    [btn2 setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [btn2 addTarget:self action:@selector(toLinear) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:btn2];
    
    UIButton *btn3 = [[UIButton alloc]initWithFrame:CGRectMake(100, 300, 200, 30)];
    [btn3 setTitle:@"FlowLayout" forState:(UIControlStateNormal)];
    [btn3 setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [btn3 addTarget:self action:@selector(toFlow) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:btn3];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    // tabbar 不隐藏
    self.tabBarController.tabBar.hidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)toFlow{
    [self.navigationController pushViewController:[FlowLayoutViewController new] animated:YES];
    self.tabBarController.tabBar.hidden = YES;
}

- (void)toFrameTest{
    [self.navigationController pushViewController:[FrameTestViewController new] animated:YES];
    self.tabBarController.tabBar.hidden = YES;
}

- (void)toLinear{
    [self.navigationController pushViewController:[LinearLayoutViewController new] animated:YES];
    self.tabBarController.tabBar.hidden = YES;
}

@end

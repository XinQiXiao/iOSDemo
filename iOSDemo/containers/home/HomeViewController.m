//
//  HomeViewController.m
//  系统地图
//
//  Created by qixin on 2018/5/15.
//  Copyright © 2018年 qixin. All rights reserved.
//

#import "HomeViewController.h"
#import "MapDemoViewController.h"
#import "WkWebDemoViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 200, 200, 30)];
    //    btn.backgroundColor = [UIColor blueColor];
    [btn setTitle:@"MKMapDemo" forState:(UIControlStateNormal)];
    [btn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [btn addTarget:self action:@selector(toMKMap) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:btn];
    
    UIButton *webbtn = [[UIButton alloc]initWithFrame:CGRectMake(100, 250, 200, 30)];
    //    btn.backgroundColor = [UIColor blueColor];
    [webbtn setTitle:@"WKWebDemo" forState:(UIControlStateNormal)];
    [webbtn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [webbtn addTarget:self action:@selector(toWKWeb) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:webbtn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.tabBarController.tabBar.hidden = NO;
}

-(void)toMKMap{
    
    [self.navigationController pushViewController:[MapDemoViewController new] animated:YES];
    self.tabBarController.tabBar.hidden = YES;
}

-(void)toWKWeb{
    
    [self.navigationController pushViewController:[WkWebDemoViewController new] animated:YES];
    self.tabBarController.tabBar.hidden = YES;
}

@end

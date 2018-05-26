//
//  FrameTestViewController.m
//  iOSDemo
//
//  Created by qixin on 2018/5/22.
//  Copyright © 2018年 qixin. All rights reserved.
//

#import "FrameTestViewController.h"
#import "SystemConstants.h"

@interface FrameTestViewController ()

@end

@implementation FrameTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"FrameTest";
    // 显示大标题
    self.navigationController.navigationBar.prefersLargeTitles = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *baseView = [UIView new];
    baseView.frame = CGRectMake(0, (STATUS_HEIGHT+self.navigationController.navigationBar.frame.size.height), SCREEN_WIDTH, SCREEN_HEIGHT);
    baseView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:baseView];
    
    UIView *v1 = [UIView new];
    v1.center = CGPointMake(SCREEN_WIDTH/2, SCREEN_HEIGHT/2);
    v1.bounds = CGRectMake(0, 0, 100, 200);
    v1.backgroundColor = [UIColor greenColor];
    [baseView addSubview:v1];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.prefersLargeTitles = NO;
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
//    self.navigationController.navigationBar.prefersLargeTitles = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

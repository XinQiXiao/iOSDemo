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
    baseView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:baseView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

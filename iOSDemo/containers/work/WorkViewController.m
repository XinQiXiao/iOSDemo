//
//  WorkViewController.m
//  系统地图
//
//  Created by qixin on 2018/5/15.
//  Copyright © 2018年 qixin. All rights reserved.
//

#import "WorkViewController.h"
#import "FileViewController.h"
#import "FileMgrViewController.h"
#import "FileShareViewController.h"

@interface WorkViewController ()

@end

@implementation WorkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"工作";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *shareBtn = [UIButton new];
    shareBtn.frame = CGRectMake(50, 100, 100, 30);
    [shareBtn setTitle:@"系统分享" forState:(UIControlStateNormal)];
    [shareBtn setTitleColor:[UIColor redColor] forState:(UIControlStateNormal)];
    [shareBtn addTarget:self action:@selector(shareBtnClick:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:shareBtn];
    
    UIButton *fileBtn = [UIButton new];
    fileBtn.frame = CGRectMake(50, 150, 100, 30);
    [fileBtn setTitle:@"文件管理" forState:(UIControlStateNormal)];
    [fileBtn setTitleColor:[UIColor redColor] forState:(UIControlStateNormal)];
    [fileBtn addTarget:self action:@selector(toFilePage) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:fileBtn];
    
    UIButton *fileMgrBtn = [UIButton new];
    fileMgrBtn.frame = CGRectMake(50, 200, 100, 30);
    [fileMgrBtn setTitle:@"文件操作" forState:(UIControlStateNormal)];
    [fileMgrBtn setTitleColor:[UIColor redColor] forState:(UIControlStateNormal)];
    [fileMgrBtn addTarget:self action:@selector(toFileMgrPage) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:fileMgrBtn];
    
    UIButton *fileMgrBtn2 = [UIButton new];
    fileMgrBtn2.frame = CGRectMake(50, 250, 100, 30);
    [fileMgrBtn2 setTitle:@"文件操作2" forState:(UIControlStateNormal)];
    [fileMgrBtn2 setTitleColor:[UIColor redColor] forState:(UIControlStateNormal)];
    [fileMgrBtn2 addTarget:self action:@selector(toFileSharePage) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:fileMgrBtn2];
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

-(void)shareBtnClick:(id)sender{
    NSString *textToShare = @"分享的标题";
    NSURL *urlToShare = [NSURL URLWithString:@"http://www.baidu.com"];
    NSArray *activityItems = @[textToShare, urlToShare];
    UIActivityViewController *activityVC = [[UIActivityViewController alloc]initWithActivityItems:activityItems applicationActivities:nil];
    activityVC.excludedActivityTypes = @[];
    
    [self presentViewController:activityVC animated:YES completion:nil];
    
    activityVC.completionWithItemsHandler = ^(UIActivityType  _Nullable activityType, BOOL completed, NSArray * _Nullable returnedItems, NSError * _Nullable activityError) {
        if(completed){
            NSLog(@"分享成功");
        } else {
            NSLog(@"分享失败");
        }
    };
}

-(void)toFilePage{
    [self.navigationController pushViewController:[FileViewController new] animated:YES];
    self.tabBarController.tabBar.hidden = YES;
}

-(void)toFileMgrPage{
    [self.navigationController pushViewController:[FileMgrViewController new] animated:YES];
    self.tabBarController.tabBar.hidden = YES;
}

-(void)toFileSharePage{
    [self.navigationController pushViewController:[FileShareViewController new] animated:YES];
    self.tabBarController.tabBar.hidden = YES;
}

@end

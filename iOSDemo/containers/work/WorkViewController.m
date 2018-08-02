//
//  WorkViewController.m
//  系统地图
//
//  Created by qixin on 2018/5/15.
//  Copyright © 2018年 qixin. All rights reserved.
//

#import "WorkViewController.h"

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

@end

//
//  FlowLayoutViewController.m
//  iOSDemo
//
//  Created by qixin on 2018/5/22.
//  Copyright © 2018年 qixin. All rights reserved.
//

#import "FlowLayoutViewController.h"
#import <MyLayout/MyLayout.h>
#import "SystemConstants.h"

@interface FlowLayoutViewController ()

@end

@implementation FlowLayoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"FlowLayout";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *baseView = [UIView new];
    baseView.frame = CGRectMake(0, (STATUS_HEIGHT+self.navigationController.navigationBar.frame.size.height), SCREEN_WIDTH, SCREEN_HEIGHT);
    baseView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:baseView];
    
    MyFlowLayout *S = [MyFlowLayout flowLayoutWithOrientation:MyOrientation_Vert arrangedCount:4];
    S.wrapContentHeight = YES;
    S.myWidth = SCREEN_WIDTH;
    S.padding = UIEdgeInsetsMake(10, 10, 10, 10);
    S.gravity = MyGravity_Horz_Fill;
    S.subviewSpace = 10;
    
    for (int i = 0; i < 10; i++)
    {
        UIView *A = [UIView new];
        A.heightSize.equalTo(A.widthSize);
        [S addSubview:A];
        
        A.backgroundColor = [UIColor greenColor];
        
    }
    
    
    [baseView addSubview:S];
    S.backgroundColor = [UIColor redColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

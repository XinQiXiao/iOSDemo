//
//  LinearLayoutViewController.m
//  iOSDemo
//
//  Created by qixin on 2018/5/22.
//  Copyright © 2018年 qixin. All rights reserved.
//

#import "LinearLayoutViewController.h"
#import "SystemConstants.h"
#import <MyLayout/MyLayout.h>

@interface LinearLayoutViewController ()

@end

@implementation LinearLayoutViewController
{
    UIView *baseView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"LinearLayouts";
    self.view.backgroundColor = [UIColor whiteColor];

    baseView = [UIView new];
    baseView.frame = CGRectMake(0, (STATUS_HEIGHT+self.navigationController.navigationBar.frame.size.height), SCREEN_WIDTH, SCREEN_HEIGHT);
    baseView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:baseView];

    [self setBaseLinear];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setBaseLinear{
    
    MyLinearLayout *ll = [MyLinearLayout new];
    ll.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    ll.backgroundColor = [UIColor grayColor];
    [baseView addSubview:ll];
    
    ll.orientation = MyOrientation_Vert;
    //    ll.gravity = MyGravity_Vert_Center;
    ll.gravity = MyGravity_Horz_Center;
    ll.wrapContentHeight = NO;
    
    UIView *v1 = [UIView new];
    v1.backgroundColor = [UIColor redColor];
    [ll addSubview:v1];
    
    v1.myTop = 40;
    //    v1.myLeft = 50;
    v1.widthSize.equalTo(ll.widthSize).multiply(0.5);
    v1.myHeight = 200;
    
    //    [v1 makeLayout:^(MyMaker *make) {
    //        make.top.equalTo(@40);
    //        make.left.equalTo(@30);
    //    }];
    
    UIView *v2 = [UIView new];
    v2.backgroundColor = [UIColor greenColor];
    [ll addSubview:v2];
    
    v2.myTop = 30;
//        v2.myLeft = v1.myLeft;
    v2.widthSize.equalTo(ll.widthSize).multiply(0.5);
//    v2.myWidth = v1.myWidth;
    v2.myHeight = v1.myHeight;
    
    //您也可以不设置width,height而是直接设置frame的宽度和高度
    UIView *v3 = [UIView new];
    v3.backgroundColor = [UIColor blueColor];
    [ll addSubview:v3];
    
    v3.myTop = 10;
    //    v3.myLeft = 150;
    v3.myWidth = 100;
    v3.myHeight = 0.5*v1.myHeight;
}


@end

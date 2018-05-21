//
//  MyLayoutDemoViewController.m
//  iOSDemo
//
//  Created by qixin on 2018/5/21.
//  Copyright © 2018年 qixin. All rights reserved.
//

#import "MyLayoutDemoViewController.h"
#import <MBProgressHUD/MBProgressHUD.h>
#import "MyLayout.h"
//#import <MyLayout/MyLayout.h>

@interface MyLayoutDemoViewController ()

@end

@implementation MyLayoutDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MyFlowLayout *S = [MyFlowLayout flowLayoutWithOrientation:MyOrientation_Vert arrangedCount:4];
    S.wrapContentHeight = YES;
    S.myWidth = 300;
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
    
    
    [self.view addSubview:S];
    S.backgroundColor = [UIColor redColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

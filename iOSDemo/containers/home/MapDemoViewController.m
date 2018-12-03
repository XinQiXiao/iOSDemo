//
//  MapDemoViewController.m
//  系统地图
//
//  Created by qixin on 2018/5/15.
//  Copyright © 2018年 qixin. All rights reserved.
//

#import "MapDemoViewController.h"

@interface MapDemoViewController ()

@end

@implementation MapDemoViewController
{
    MKMapView *_mkMapView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"MKMapView";
    self.view.backgroundColor = [UIColor whiteColor];
    
    _mkMapView = [MKMapView new];
    _mkMapView.backgroundColor = [UIColor redColor];
    _mkMapView.frame = CGRectMake(0, 64.0f, self.view.frame.size.width, self.view.frame.size.height);
    /// 1.地图显示类型
    // 地图类型
    _mkMapView.mapType = MKMapTypeStandard;
    /// 2.地图控制项
    // 是否缩放
    _mkMapView.zoomEnabled = YES;
    // 是否滚动
    _mkMapView.scrollEnabled = YES;
    // 是否旋转
    _mkMapView.rotateEnabled = NO;
    // 是否显示 3D View
    _mkMapView.pitchEnabled = NO;
    /// 3.地图显示项
    // 是否显示指南针
    _mkMapView.showsCompass = NO;
    // 是否显示比例尺
    _mkMapView.showsScale = NO;
    // 是否显示交通
    _mkMapView.showsTraffic = NO;
    // 是否显示建筑
    _mkMapView.showsBuildings = NO;
    // 显示兴趣点
    _mkMapView.showsPointsOfInterest = false;
    /// 4.显示用户位置
    // 设置方式
    _mkMapView.showsUserLocation = YES;
    // 需要请求用户授权
    /// 5.追踪用户位置
    // 设置方式
    _mkMapView.userTrackingMode = MKUserTrackingModeFollowWithHeading;
    [self.view addSubview:_mkMapView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark ---
#pragma mark --- MKMapViewDelegate ---
#pragma mark ---

@end

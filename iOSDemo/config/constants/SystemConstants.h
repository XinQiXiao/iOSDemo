//
//  SystemConstants.h
//  iOSDemo
//
//  Created by qixin on 2018/5/22.
//  Copyright © 2018年 qixin. All rights reserved.
//

#ifndef SystemConstants_h
#define SystemConstants_h

// 状态栏
#define STATUS_HEIGHT ([UIApplication sharedApplication].statusBarFrame.size.height)

// 导航栏说明
/**
 * 在有导航栏界面 调self.navigationController.navigationBar.frame.size.height 方法
 */
/**
 *  iOS11导航栏多了一个LargeTitleView，专门显示大字标题用, self.navigationBar.prefersLargeTitles = true
 *
 *  iOS10 以下 TotalHeight=64 (StatusHeight=20, NavigationHeight=44 )
 *
 *  iOS11 iPhone X 无大标题 TotalHeight=88 (StatusHeight=44, NavigationHeight=44 )
 *                 有大标题 TotalHeight=140 (StatusHeight=44, NavigationHeight=96{LargeTitleHeight=52, NavHeight=44} )
 *        不是IPhone X 无大标题 同（iOS10以下）
 *                    有大标题 TotalHeight=116(StatusHeight=20, NavigationHeight=96{LargeTitleHeight=52, NavHeight=44})
 *
 */

// 屏幕宽、高
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

// 获取版本
#define IOS_VERSION [[UIDevice currentDevice] systemVersion]

#endif /* SystemConstants_h */

//
//  AppDelegate.m
//  系统地图
//
//  Created by qixin on 2018/5/15.
//  Copyright © 2018年 qixin. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"
#import "WorkViewController.h"
#import "MineViewController.h"
#import "MapDemoViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];

    self.window.rootViewController = [self createTabBar];
//    self.window.rootViewController = [MapDemoViewController new];
    return YES;
}

- (UITabBarController *)createTabBar{
    
    UINavigationController *homeNav = [[UINavigationController alloc]initWithRootViewController:[HomeViewController new]];
    homeNav.tabBarItem.title = @"首页";
    homeNav.tabBarItem.image = [UIImage imageNamed:@"tab_home_nor"];
    homeNav.tabBarItem.selectedImage = [UIImage imageNamed:@"tab_home_sel"];
    
    UINavigationController *workNav = [[UINavigationController alloc]initWithRootViewController:[WorkViewController new]];
    workNav.tabBarItem.title = @"工作";
    workNav.tabBarItem.image = [UIImage imageNamed:@"tab_work_nor"];
    workNav.tabBarItem.selectedImage = [UIImage imageNamed:@"tab_work_sel"];
    
    UINavigationController *mineNav = [[UINavigationController alloc]initWithRootViewController:[MineViewController new]];
    mineNav.tabBarItem.title = @"我的";
    mineNav.tabBarItem.image = [UIImage imageNamed:@"tab_mine_nor"];
    mineNav.tabBarItem.selectedImage = [UIImage imageNamed:@"tab_mine_sel"];
    
    UITabBarController *tabbar = [UITabBarController new];
    tabbar.viewControllers = @[homeNav, workNav, mineNav];
    
    return tabbar;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end

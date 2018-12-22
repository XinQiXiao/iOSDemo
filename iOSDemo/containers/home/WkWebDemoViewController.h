//
//  WkWebDemoViewController.h
//  iOSDemo
//
//  Created by qixin on 2018/12/22.
//  Copyright © 2018年 qixin. All rights reserved.

// 参考  https://www.jianshu.com/p/e5af3a2127ce 入门，只做了wkwebview初始化
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface WkWebDemoViewController : UIViewController<WKUIDelegate,WKNavigationDelegate>

@end

NS_ASSUME_NONNULL_END

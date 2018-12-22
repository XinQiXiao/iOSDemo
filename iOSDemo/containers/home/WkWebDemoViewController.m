//
//  WkWebDemoViewController.m
//  iOSDemo
//
//  Created by qixin on 2018/12/22.
//  Copyright © 2018年 qixin. All rights reserved.
//

#import "WkWebDemoViewController.h"

@interface WkWebDemoViewController ()
{
    WKWebView *wkweb;
}
@end

@implementation WkWebDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"WKWebView Demo";
    
    [self initWKWeb];
    [self loadUrl];
}

-(void)initWKWeb{
    //  wkwebview属性的集合
    WKWebViewConfiguration *configuration = [WKWebViewConfiguration new];
    //  webview一些首选项的配置
    WKPreferences *preferences = [WKPreferences new];
    //  在没有用户交互的情况下，是否允许js打开窗口，macOS默认是yes，iOS默认是no
    preferences.javaScriptCanOpenWindowsAutomatically = YES;
    //  webview的最小字体大小
    //  preferences.minimumFontSize = 40.0;
    
    configuration.preferences = preferences;
    wkweb = [[WKWebView alloc] initWithFrame:self.view.frame configuration:configuration];
    wkweb.UIDelegate = self;
    wkweb.navigationDelegate = self;
    [self.view addSubview:wkweb];
}

-(void)loadUrl{
    NSString *urlString = @"https://www.baidu.com";
    urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
//    [SdkTools requestSetHeader:request];
    [wkweb loadRequest:request];
}

#pragma mark ---
#pragma mark --- WKNavigationDelegate ---
-(void)webViewWebContentProcessDidTerminate:(WKWebView *)webView{
    // 琪哥要的 WKNavigationDelegate 代理添加了
}
#pragma mark ---

@end

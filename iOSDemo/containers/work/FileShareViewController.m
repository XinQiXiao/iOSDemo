//
//  FileShareViewController.m
//  iOSDemo
//
//  Created by qixin on 2018/8/6.
//  Copyright © 2018年 qixin. All rights reserved.
//

#import "FileShareViewController.h"

@interface FileShareViewController ()

@end

@implementation FileShareViewController
{
    UIDocumentInteractionController *documentController;
    NSString *fileName;
    NSString *shareFilePath;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"文件分享";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *fileBtn = [UIButton new];
    fileBtn.frame = CGRectMake(50, 100, 100, 30);
    [fileBtn setTitle:@"文件创建" forState:(UIControlStateNormal)];
    [fileBtn setTitleColor:[UIColor redColor] forState:(UIControlStateNormal)];
    [fileBtn addTarget:self action:@selector(createLocalFile) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:fileBtn];
    
    UIButton *shareBtn = [UIButton new];
    shareBtn.frame = CGRectMake(50, 150, 100, 30);
    [shareBtn setTitle:@"分享" forState:(UIControlStateNormal)];
    [shareBtn setTitleColor:[UIColor redColor] forState:(UIControlStateNormal)];
    [shareBtn addTarget:self action:@selector(openDocument) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:shareBtn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)openDocument{
//    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"pdf"];
    NSLog(@"文件 shareFilePath=>%@", shareFilePath);
    documentController = [UIDocumentInteractionController new];
    documentController.URL = [NSURL fileURLWithPath:shareFilePath];
    documentController.delegate = self;
    documentController.UTI = @"com.adobe.pdf";
    [documentController presentOpenInMenuFromRect:CGRectZero inView:self.view animated:YES];
}

-(void)createLocalFile{
        NSFileManager *fileManager = [NSFileManager defaultManager];
        NSArray *libCachesPaths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask,YES);
        NSString *docPath = [libCachesPaths lastObject];
        NSLog(@"文件 homePath=>%@", docPath);
        fileName = @"testFile.pdf";
        shareFilePath = [docPath stringByAppendingPathComponent:fileName];
        NSLog(@"文件 shareFilePath=>%@", shareFilePath);
    
        NSString *fileContent = @"这些是文件内容,这些是文件内容,这些是文件内容,这些是文件内容,这些是文件内容";
        if(![fileManager fileExistsAtPath:shareFilePath]){
            BOOL success = [fileManager createFileAtPath:shareFilePath contents:[fileContent dataUsingEncoding:NSUTF8StringEncoding] attributes:nil];
            if(success){
                NSLog(@"写入文件成功");
            }
        } {
            NSLog(@"文件已存在");
        }
}

@end

//
//  FileMgrViewController.m
//  iOSDemo
//
//  Created by qixin on 2018/8/3.
//  Copyright © 2018年 qixin. All rights reserved.
//

#import "FileMgrViewController.h"

@interface FileMgrViewController ()

@end

@implementation FileMgrViewController
{
    NSString *fileName;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"文件管理";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *shareBtn = [UIButton new];
    shareBtn.frame = CGRectMake(50, 150, 100, 30);
    [shareBtn setTitle:@"分享" forState:(UIControlStateNormal)];
    [shareBtn setTitleColor:[UIColor redColor] forState:(UIControlStateNormal)];
    [shareBtn addTarget:self action:@selector(shareBtnClick:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:shareBtn];
    
    UIButton *fileBtn = [UIButton new];
    fileBtn.frame = CGRectMake(50, 100, 100, 30);
    [fileBtn setTitle:@"文件创建" forState:(UIControlStateNormal)];
    [fileBtn setTitleColor:[UIColor redColor] forState:(UIControlStateNormal)];
    [fileBtn addTarget:self action:@selector(createLocalFile) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:fileBtn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)func1{
    // TODO 本地沙盒 创建文件目录
    // TODO 写入文件保存到 创建的目录下
    // TODO 每次打开可以删除之前的文件
    // TODO 用系统方法分享出去
}
-(void)createLocalFile{
//    NSFileManager *fileManager = [NSFileManager defaultManager];
//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask,YES);
//    NSString *docPath = [paths lastObject];
//    NSLog(@"文件 homePath=>%@", docPath);
//    fileName = @"testFile.txt";
//    NSString *shareFilePath = [docPath stringByAppendingPathComponent:fileName];
//    NSLog(@"文件 shareFilePath=>%@", shareFilePath);
//
//    NSString *fileContent = @"这些是文件内容,这些是文件内容,这些是文件内容,这些是文件内容,这些是文件内容";
//    if(![fileManager fileExistsAtPath:shareFilePath]){
//        BOOL success = [fileManager createFileAtPath:shareFilePath contents:[fileContent dataUsingEncoding:NSUTF8StringEncoding] attributes:nil];
//        if(success){
//            NSLog(@"写入文件成功");
//        }
//    } {
//        NSLog(@"文件已存在");
//    }
    [self saveText:@"哈哈哈" atPath:@"hello"];
    
}

-(NSURL *)getDocumentsDirectoryPath
{
    return [[[NSFileManager defaultManager]URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask]lastObject];
}

-(void)saveText:(NSString *)textTobeSaved atPath:(NSString*)fileName
{
    NSString *filePath = [NSString stringWithFormat:@"%@.text",fileName];
    
    NSString *path = [[self getDocumentsDirectoryPath].path
                      stringByAppendingPathComponent:filePath];
    NSFileHandle *fileHandler = [NSFileHandle fileHandleForWritingAtPath:path];
    if(fileHandler == nil) {
        [[NSFileManager defaultManager] createFileAtPath:path contents:nil attributes:nil];
        fileHandler = [NSFileHandle fileHandleForWritingAtPath:path];
        NSLog(@"111");
    } else {
        textTobeSaved = [NSString stringWithFormat:@"\n-----------------------\n %@",textTobeSaved];
        [fileHandler seekToEndOfFile];
        NSLog(@"222");
    }
    
    [fileHandler writeData:[textTobeSaved dataUsingEncoding:NSUTF8StringEncoding]];
    [fileHandler closeFile];
    
    if([[NSFileManager defaultManager] fileExistsAtPath:path]){
        NSLog(@"file exist");
    } else {
        NSLog(@"file isn't exist");
    }
}

-(void)shareBtnClick:(id)sender{
    
    // 获取分享文件路径
//    NSURL *urlToShare = [self getDocumentsDirectoryPath];
//    NSLog(@"urlToShare =%@", urlToShare);
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"pdf"];
    NSURL *urlToShare = [NSURL fileURLWithPath:filePath];
    
    NSLog(@"urlToShare =%@", urlToShare);
    
    NSString *textToShare = @"分享";

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

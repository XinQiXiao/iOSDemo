//
//  FileViewController.m
//  iOSDemo
//
//  Created by qixin on 2018/8/3.
//  Copyright © 2018年 qixin. All rights reserved.
//

#import "FileViewController.h"

@interface FileViewController ()

@end

@implementation FileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"文件管理";
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/// 获取沙盒目录
-(void)getFilePath{
    // 获取程序的根目录(home目录)
//    NSString *home = NSHomeDirectory();
    
    // 获取Document目录
//        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//        NSString *docPath = [paths lastObject];
    // 获取Library目录
    
    // 获取Library中的Cache
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask,YES);
        NSString *docPath = [paths lastObject];
    
    // 获取temp路径
//    NSString *docPath = NSTemporaryDirectory();
}

/// NSString类路径处理方法和IO操作
-(void)stringPathIO{
    // 文件路径的处理
    NSString *path = @"/Uesrs/apple/testfile.txt";
    [path pathComponents];
    // 结果: ("/","User","apple","testfile.txt")
    // 提取路径的最后一个组成部分
    [path lastPathComponent];
    // 结果: testfile.txt
    // 删除路径的最后一个组成部分
    [path stringByDeletingLastPathComponent];
    // 结果: /Users/apple
    // 将path添加到前面路径的末尾
    [path stringByAppendingPathComponent:@"app.txt"];
    // 结果: /Users/apple/testfile.txt/app.txt
    // 取路径最后部分的扩展名
    [path pathExtension];
    // 结果: txt
    // 删除路径最后部分的扩展名
    [path stringByDeletingPathExtension];
    // 结果: /Users/apple/testfile
    // 路径最后部分追加扩展名
    [path stringByAppendingPathExtension:@"jpg"];
    // 结果: /User/apple/testfile.txt.jpg
    
    // NSString的写入与读取（I/O）
    //创建保存路径
    NSString *docPath = NSTemporaryDirectory();
//    NSString *textPath = [docPath stringByAppendingPathComponent:@"objc.txt"];
    NSString *textPath = [docPath stringByAppendingPathComponent:@"objc.txt"];
    NSString *string = @"Objective-C";
    
    //字符串写入时执行的方法
    [string writeToFile:textPath atomically:YES encoding:(NSUTF8StringEncoding) error:nil];
    
    //读取字符串方法
    NSString *resultStr = [NSString stringWithContentsOfFile:textPath encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"resultStr is %@", resultStr);
}

// NSData的写入与读取（I/O）
-(void)dataIO{
    // 获取Library中的Cache
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask,YES);
    NSString *docPath = [paths lastObject];
    // NSData写入文件
    // 创建一个存放NSData数据的路径
    NSString *fileDataPath = [docPath stringByAppendingPathComponent:@"icon"];
    
    // 得到一个UIImage对象
    UIImage *image = [UIImage imageNamed:@"icon.jpg"];
    
    // 将UIImage对象转换成NSData对象
    NSData *data = UIImageJPEGRepresentation(image, 0);
    [data writeToFile:fileDataPath atomically:YES];
    NSLog(@"fileDataPath is %@", fileDataPath);
    
    // 从文件读取存储的NSData数据
    NSData *resultData = [NSData dataWithContentsOfFile:fileDataPath];
    // 将得到的NSData数据转换成原有的图片对象
    UIImage *resultImage = [UIImage imageWithData:resultData];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imageView.image = resultImage;
    [self.view addSubview:imageView];
}

-(void)fileMgr{
    // 创建文件管理
    NSFileManager * fileManager = [NSFileManager defaultManager];
    NSString *path = [NSHomeDirectory( )  stringByAppendingPathComponent:@"holyBible.txt"];
    // 创建一个文件并写入数据
    NSString *text = @"我是一个文件";
    NSData *data = [text dataUsingEncoding: NSUTF8StringEncoding];
    //方法：- (BOOL)createFileAtPath:(NSString *)path contents:(NSData *)data attributes:(NSDictionary *)attr;
    BOOL success = [fileManager createFileAtPath:path contents:data attributes:nil];
    // 从一个文件中读取数据
    
    NSData *data2 = [fileManager contentsAtPath:path];
}

@end

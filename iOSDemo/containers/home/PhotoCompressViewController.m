//
//  PhotoCompressViewController.m
//  iOSDemo
//
//  Created by qixin on 2018/11/1.
//  Copyright © 2018年 qixin. All rights reserved.
//

#import "PhotoCompressViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <Foundation/Foundation.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface PhotoCompressViewController ()

@property (nonatomic, strong) NSString *path;

@end

@implementation PhotoCompressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}

// --- 打开视频库 ---
- (void)openVideoLibrary{
    // 打开控制器
    UIImagePickerController *picker = [UIImagePickerController new];
    // 设置媒体类型
    // 打开相册库,用户与电脑同步的,不能删除
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = self;
    picker.allowsEditing = NO;
    NSString *requireMediaType1 = (NSString *)kUTTypeMovie;
    NSArray *arrMediaTypes = @[requireMediaType1];
    [picker setMediaTypes:arrMediaTypes];
    // 显示控制器
    [self presentViewController:picker animated:YES completion:nil];
}
// --- 打开图片库 ---
- (void)openPhotoLibrary{
    // 打开控制器
    UIImagePickerController *picker = [UIImagePickerController new];
    // 设置媒体类型
    // 打开相册, 获取资源, 视频和图片用户拍摄的照片可以删除,
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = self;
    [self presentViewController:picker animated:YES completion:nil];
}
// --- 打开摄像头拍照 ---
- (void)openCamera{
    // 打开控制器
    UIImagePickerController *picker = [UIImagePickerController new];
    // 设置媒体类型
    // 设置摄像头类型摄像头
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    picker.delegate = self;
    [self presentViewController:picker animated:YES completion:nil];
}

#pragma mark
#pragma mark UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary*)info {
    
    NSString *mediaType = [info objectForKey: UIImagePickerControllerMediaType];
    NSLog(@"mediaType= %@", mediaType);
    
    if([mediaType isEqualToString:@"public.movie"]) {
        // 如果是视频返回的是URL
        NSURL* url = info[UIImagePickerControllerMediaURL];
        NSLog(@"视频地址= %@",url);
        // 使用媒体工具压缩
//        [self compressVideo:url];
    }else{
        UIImage *image = [info objectForKey: UIImagePickerControllerOriginalImage];
        NSLog(@"选择的照片= %@",image);
    }
    // 关闭控制器
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark —————————压缩视频—————————————

- (void)compressVideo:(NSURL*)url {
    
    NSLog(@"压缩");
    // 使用媒体工具(AVFoundation框架下的)
    // Asset资源可以是图片音频视频
    AVAsset *asset=[AVAsset assetWithURL:url];
    // 设置压缩的格式
    // mediumquality:中等质量
    AVAssetExportSession *session=[AVAssetExportSession exportSessionWithAsset:asset presetName: AVAssetExportPresetMediumQuality];
    // 设置导出路径
    NSString *path=[NSTemporaryDirectory()stringByAppendingPathComponent:[self getVideoNameBaseCurrentTime]];
    
    //创建文件管理类导出失败,删除已经导出的
    NSFileManager *manager=[NSFileManager new];
    
    //删除已经存在的
    [manager removeItemAtPath:path error:NULL];
    //设置到处路径
    session.outputURL = [NSURL fileURLWithPath:path];
    //设置输出文件的类型
    session.outputFileType = AVFileTypeQuickTimeMovie;
    
    //开辟子线程处理耗时操作
    
    [session exportAsynchronouslyWithCompletionHandler:^{
        NSLog(@"导出完成!路径:%@",path);
        //        _path = path;
    }];
    
}

// —————————以当前时间合成视频名称—————————————
- (NSString*)getVideoNameBaseCurrentTime {
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateFormat:@"yyyyMMddHHmmss"];
    return [[dateFormatter stringFromDate:[NSDate date]]stringByAppendingString:@".mov"];
}

// —————————删除文件—————————————
- (BOOL)deleteDir:(NSString*)dirPath {
    // 如果存在临时文件的配置文件
    if([[NSFileManager defaultManager]fileExistsAtPath:dirPath]) {
        NSError *error = nil;
        return [[NSFileManager defaultManager] removeItemAtPath:dirPath error:&error];
    }
    return NO;
}


@end

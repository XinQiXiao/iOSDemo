//
//  AddressSanitizerViewController.m
//  iOSDemo
//
//  Created by qixin on 2018/12/3.
//  Copyright © 2018年 qixin. All rights reserved.
//

#import "AddressSanitizerViewController.h"

@interface AddressSanitizerViewController ()

@end

@implementation AddressSanitizerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Address Sanitizer";
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    // size = 8，比较容易命中。
    unsigned int size = 8;
    void *buffer = malloc(size);
    snprintf(buffer, size, "Hello!");
    NSLog(@"%p, %s", buffer, buffer);
    free(buffer);
    
    // memory history
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 在未来的某个时机，改变该指针的值
        snprintf(buffer, size, "Hello!");
    });
    
}
@end

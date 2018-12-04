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

/**
 * 情 形 一：创建了一个对象，但是并没有使用。
 * 提示信息：Value Stored to 'number' is never read
 * 翻译一下：存储在'number'里的值从未被读取过，
 */
- (void)leakOne {
    NSString *str1 = [NSString string];
    NSNumber *number;
    number = @(str1.length);
    /*
     说我们没有读取过它，那就读取一下，比如打开下面这句代码，对它发送class消息，就不再会有这个提示了。
     当然最好的方法还是将有关number的代码都删掉，因为，你只对number赋值，又不使用，那干嘛创建出来呢。
     这是一个比较常见和典型的错误，也很容易检查出来
     */
    // [number class];
}

/**
 * 情 形 二：创建了一个（指针可变的）对象，且初始化了，但是初始化的值一直没读取过。
 * 提示信息：Value Stored to 'str' during its initialization is never read
 */
- (void)leakTwo {
    NSString *str = [NSString string]; // 创建并初始化str，此时已经有一个内存单元保存str初始化的值
    // NSString *str; // 这样就内存不泄露，因为str是可变的，只需要先声明就行。
    // printf("str前 = %p\n",str);
    str = @"ceshi";             // str被改变了，指向了"ceshi"所在的地址，指针改变了，但之前保存初始化值的内存空间还未释放，保存str初始化值的内存单元泄露了。
    // printf("str后 = %p\n",str); // 指针改变了
    [str class];
    
    // 再举两个例子，同理
    
    NSArray *arr = [NSArray array];
    // printf("arr前 = %p\n",arr);
    // NSArray *arr;            // 这样就内存不泄露
    arr = @[@"1",@"2"];
    // printf("arr后 = %p\n",arr); // 指针改变了
    [arr class];
    
    CGRect rect = self.view.frame;
    // CGRect rect = CGRectZero; // 这样就内存不泄露
    rect = CGRectMake(0, 0, 0, 0);
    NSLog(@"rect = %@",NSStringFromCGRect(rect));
}

/**
 * 情 形 三：调用了让某个对象引用计数加1的函数，但没有调用相应让其引用计数减1的函数。
 * 提示信息：Potential leak of an object stored into 'subImageRef'
 * 翻译一下：subImageRef对象的内存单元有潜在的泄露风险
 */
- (void)leakThree {
    CGRect rect = CGRectMake(0, 0, 50, 50);
    UIImage *image;
    CGImageRef subImageRef = CGImageCreateWithImageInRect(image.CGImage, rect); // subImageRef 引用计数 + 1;
    
    UIImage* smallImage = [UIImage imageWithCGImage:subImageRef];
    
    // 应该调用对应的函数，让subImageRef的引用计数减1,就不会泄露了
    // CGImageRelease(subImageRef);
    
    [smallImage class];
    UIGraphicsEndImageContext();
}
@end

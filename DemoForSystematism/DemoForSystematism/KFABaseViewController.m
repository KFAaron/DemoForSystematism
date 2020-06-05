//
//  KFABaseViewController.m
//  DemoForSystematism
//
//  Created by KFAaron on 2020/6/4.
//  Copyright © 2020 KFAaron. All rights reserved.
//

#import "KFABaseViewController.h"
#import <WebKit/WebKit.h>

@interface KFABaseViewController ()

@property (nonatomic, strong) WKWebView *webView;

@property (strong, nonatomic) UIImageView *redImage;
@property (strong, nonatomic) UIImageView *greenImage;
@property (strong, nonatomic) UIImageView *yellowImage;

@end

@implementation KFABaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createCornerForRedImage];
    [self createCornerGorGreenImage];
    [self createCornerForYellorImage];
    
    if (_urlString && _urlString.length > 0) {
        [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_urlString]]];
    }
}

#pragma mark - 圆角
// 用贝塞尔曲线和Core Graphics画圆角
- (void)createCornerForRedImage {
    UIGraphicsBeginImageContextWithOptions(self.redImage.bounds.size, NO, 1.0);
    [[UIBezierPath bezierPathWithRoundedRect:self.redImage.bounds cornerRadius:10] addClip];
    [self.redImage drawRect:self.redImage.bounds];
    self.redImage.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
}

// 用贝塞尔曲线和layer画圆角
- (void)createCornerGorGreenImage {
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.greenImage.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(10, 10)];
    CAShapeLayer *imgLayer = [[CAShapeLayer alloc] init];
    imgLayer.frame = self.greenImage.bounds;
    imgLayer.path = maskPath.CGPath;
    self.greenImage.layer.mask = imgLayer;
}

// 用常用的方式设置圆角
- (void)createCornerForYellorImage {
    self.yellowImage.layer.cornerRadius = 10;
//    self.yellowImage.layer.masksToBounds = YES;
    self.yellowImage.clipsToBounds = YES;
}

#pragma mark - Properties

- (WKWebView *)webView {
    if (!_webView) {
        _webView = [[WKWebView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        [self.view addSubview:_webView];
    }
    return _webView;
}

- (UIImageView *)redImage {
    if (!_redImage) {
        _redImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 100, 100, 100)];
        _redImage.image = [UIImage imageNamed:@"111.jpg"];
        _redImage.contentMode = UIViewContentModeScaleAspectFill;
        [self.view addSubview:_redImage];
    }
    return _redImage;
}

- (UIImageView *)greenImage {
    if (!_greenImage) {
        _greenImage = [[UIImageView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width-10-100, 100, 100, 100)];
        _greenImage.image = [UIImage imageNamed:@"222.jpeg"];
        _greenImage.contentMode = UIViewContentModeScaleAspectFill;
        [self.view addSubview:_greenImage];
    }
    return _greenImage;
}

- (UIImageView *)yellowImage {
    if (!_yellowImage) {
        _yellowImage = [[UIImageView alloc] initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width-100)/2, 100, 100, 100)];
        _yellowImage.image = [UIImage imageNamed:@"3333.jpeg"];
        _yellowImage.contentMode = UIViewContentModeScaleAspectFill;
        [self.view addSubview:_yellowImage];
    }
    return _yellowImage;
}

@end

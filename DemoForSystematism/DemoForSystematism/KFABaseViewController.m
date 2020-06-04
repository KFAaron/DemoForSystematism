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

@end

@implementation KFABaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    if (_urlString && _urlString.length > 0) {
        [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_urlString]]];
    }
}

- (WKWebView *)webView {
    if (!_webView) {
        _webView = [[WKWebView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        [self.view addSubview:_webView];
    }
    return _webView;
}

@end

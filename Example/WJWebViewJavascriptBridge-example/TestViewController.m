//
//  TestViewController.m
//  WJWebViewJavascriptBridge-example
//
//  Created by 吴云海 on 16/7/10.
//  Copyright © 2016年 wuyunhai. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()
@property(nonatomic, weak) UIWebView *webView;
@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (!_webView) {
        UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
        [self.view addSubview:webView];
        _webView = webView;
    }
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [_webView loadRequest:[[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://192.168.40.8:8081/product_detail/html/test.html"]]];
}

@end

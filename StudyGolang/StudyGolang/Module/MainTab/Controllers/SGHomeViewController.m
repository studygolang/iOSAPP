//
//  SGHomeViewController.m
//  StudyGolang
//
//  Created by longlago on 2017/11/21.
//  Copyright © 2017年 longlago. All rights reserved.
//

#import "SGHomeViewController.h"
#import <WebKit/WebKit.h>

@interface SGHomeViewController () <WKNavigationDelegate, WKUIDelegate>

@property (nonatomic, strong) UIActivityIndicatorView *activityView;

@property (nonatomic, strong) WKWebView *webView;
@property (nonatomic, strong) UIView *statusView;
@property (nonatomic, strong) CAGradientLayer *gradientLayer;

@end

@implementation SGHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:KHomeUrlStr]];
    [self.webView loadRequest:request];
}

- (void)setupUI {
    UIView *statusView = [[UIView alloc] init];
    statusView.backgroundColor = [UIColor colorWithHexString:@"#63c470"];
    [self.view addSubview:statusView];
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = statusView.bounds;
    [statusView.layer addSublayer:gradientLayer];
    gradientLayer.startPoint = CGPointMake(0, 0.5);
    gradientLayer.endPoint = CGPointMake(1, 0.5);
    
    gradientLayer.colors = @[ (__bridge id)[UIColor colorWithHexString:@"#63c470"].CGColor,
                              (__bridge id)[UIColor colorWithHexString:@"#48b265"].CGColor ];
    
    self.statusView = statusView;
    self.gradientLayer = gradientLayer;
    
    self.webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
    self.webView.navigationDelegate = self;
    self.webView.UIDelegate = self;
    self.webView.scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    [self.view addSubview:self.webView];
    
    self.activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [self.view addSubview:self.activityView];
    [self.activityView startAnimating];
    
    [statusView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.equalTo(@0);
        make.top.equalTo(@0);
        make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideTop).with.offset(@0);
    }];
    
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
        make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        make.leading.trailing.equalTo(@0);
    }];
    
    [self.activityView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.webView);
    }];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    self.gradientLayer.frame = self.statusView.bounds;
}

#pragma mark - WKNavigationDelegate
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    [self.activityView stopAnimating];
}

@end

//
//  SGHomeViewController.m
//  StudyGolang
//
//  Created by longlago on 2017/11/21.
//  Copyright © 2017年 longlago. All rights reserved.
//

#import "SGHomeViewController.h"
#import<WebKit/WebKit.h>

@interface SGHomeViewController ()

@property (nonatomic,strong)WKWebView *webView;

@end

@implementation SGHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)setupUI{
    
    self.webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
    self.webView.scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    [self.view addSubview:self.webView];    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:KHomeUrlStr]];
    [self.webView loadRequest:request];
}


@end

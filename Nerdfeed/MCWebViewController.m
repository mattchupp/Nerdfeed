//
//  MCWebViewController.m
//  Nerdfeed
//
//  Created by Matthew Chupp on 4/3/15.
//  Copyright (c) 2015 MattChupp. All rights reserved.
//

#import "MCWebViewController.h"

@implementation MCWebViewController

- (void)loadView {
    
    UIWebView *webView = [[UIWebView alloc] init];
    webView.scalesPageToFit = YES;
    self.view = webView;
    
}

- (void)setURL:(NSURL *)URL {
    
    _URL = URL;
    if (_URL) {
        NSURLRequest *req = [NSURLRequest requestWithURL:_URL];
        [(UIWebView *)self.view loadRequest:req];
    }
}

@end

//
//  ViewController.m
//  UIWebView-BlocksExample
//
//  Created by Shai Mishali on 8/5/13.
//  Copyright (c) 2013 Shai Mishali. All rights reserved.
//

#import "ViewController.h"
#import "UIWebView+Blocks.h"

@interface ViewController (){
    UIWebView *webView;
}

@end

@implementation ViewController

-(void)viewDidLoad{
    self.view.backgroundColor   = [UIColor whiteColor];
    
    webView         = [UIWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://google.com"]]
                                      loaded:^(UIWebView *aWebView) {
                                          NSLog(@"Loaded %@", aWebView.request.URL);
                                      }
                                      failed:^(UIWebView *aWebView, NSError *error) {
                                          NSLog(@"Failed loading with error: %@", error.localizedDescription);
                                      }
                                 loadStarted:^(UIWebView *aWebView) {
                                     NSLog(@"Started loading");
                                 }
                                  shouldLoad:^BOOL(UIWebView *aWebView, NSURLRequest *request, UIWebViewNavigationType navigationType) {
                                      return YES;
                                  }];
    
    webView.frame   = CGRectMake(0, 0, 320, [UIScreen mainScreen].bounds.size.height);
    
    [self.view addSubview: webView];
}

@end
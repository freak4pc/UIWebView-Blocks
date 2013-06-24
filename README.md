UIWebView-Blocks
================

UIWebView+Blocks is A simple category that implements blocks into UIWebView.
This allows you to use the power of blocks instead of implementing a delegate.

USAGE FOR NSURLRequests
------

Instead of allocating a new UIWebView and assigning a delegate, just call one of the static methods:

```objc
UIWebView *webView = [UIWebView loadRequest:[NSURLRequest requestWithURL: [NSURL URLWithString:@"http://google.com"]]
                                     loaded:^(UIWebView *webView) {
                                         NSLog(@"Loaded successfully");
                                     }
                                     failed:^(UIWebView *webView, NSError *error) {
                                         NSLog(@"Failed loading %@", error);
                                     }];
```

**OR**

```objc
UIWebView *webView = [UIWebView loadRequest:[NSURLRequest requestWithURL: [NSURL URLWithString:@"http://google.com"]]
                                     loaded:^(UIWebView *webView) {
                                         NSLog(@"Loaded successfully");
                                     }
                                     failed:^(UIWebView *webView, NSError *error) {
                                         NSLog(@"Failed loading %@", error);
                                     }
                                loadStarted:^(UIWebView *webView) {
                                    NSLog(@"Started loading %@", webView.request.URL.absoluteString);
                                }
                                 shouldLoad:^BOOL(UIWebView *webView, UIWebViewNavigationType navigationType) {
                                     return YES;
                                 }];
```

USAGE FOR HTML Strings
-------

```objc
UIWebView *webView = [UIWebView loadHTMLString:htmlString
                                        loaded:^(UIWebView *) {
                                            NSLog(@"Loaded successfully");
                                        }
                                        failed:^(UIWebView *, NSError *) {
                                             NSLog(@"Failed loading %@", error);
                                        }];
```

**OR**

```objc
UIWebView *webView = [UIWebView loadHTMLString:htmlString
                                        loaded:^(UIWebView *) {
                                            NSLog(@"Loaded successfully");
                                        }
                                        failed:^(UIWebView *, NSError *) {
                                             NSLog(@"Failed loading %@", error);
                                        }
                                   loadStarted:^(UIWebView *webView) {
                                       NSLog(@"Started loading %@", webView.request.URL.absoluteString);
                                   }
                                    shouldLoad:^BOOL(UIWebView *webView, NSURLRequest *request, UIWebViewNavigationType navigationType) {
                                        return YES;
                                    }];
```


The class will return the UIWebView object which you can later add as a subview to your current view.

```objc
webView.frame = [[UIScreen mainScreen] bounds];
[self.view addSubview: webView];
```


***Note:*** UIWebView+Blocks currently doesn't support the simultaneous usage of multiple UIWebViews in the same view.

TRUE ENDING REPORTING
---------------------

In UIWebView+Blocks.h, set `TRUE_END_REPORT` to YES if you wish to get notified only when the page is fully loaded instead of being notified every time a resource is loaded (default UIWebViewDelegate behavior).
This feature is still under beta and might not work perfectly at all times.

LICENSE
-------------------

Copyright (C) 2013 Developed by Shai Mishali

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
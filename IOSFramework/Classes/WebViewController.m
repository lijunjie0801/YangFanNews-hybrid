//
//  WebViewController.m
//  IOSFramework
//
//  Created by lijunjie on 2017/1/18.
//
//

#import "WebViewController.h"
#import "RDVTabBarController.h"
#import "BANetManager.h"
#import <JavaScriptCore/JavaScriptCore.h>
#define kUrlNewsDetails @"http://c.3g.163.com/nc/article/%@/full.html"
@interface WebViewController ()

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   // [self getData];
    NSString *path=[[NSBundle mainBundle]pathForResource:@"app" ofType:nil];
    NSString *appPath=[NSString stringWithFormat:@"file://%@/index.html#/NewDetail",path];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:appPath]]];
    

//    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.loadurl]]];
    self.title=self.source;
}
-(void)getData{
        NSString *url=[NSString stringWithFormat:kUrlNewsDetails, self.docid];
        
        [BANetManager ba_requestWithType:BAHttpRequestTypeGet
                               urlString:url
                              parameters:nil
                            successBlock:^(id response) {
                                NSLog(@"get请求数据成功： *** %@", response);
                                NSDictionary *dataDict = [response objectForKey:self.docid];
                            NSString *bodyhtml=[dataDict objectForKey:@"body"];
                            NSString *path=[[NSBundle mainBundle]pathForResource:@"app" ofType:nil];
                            NSString *appPath=[NSString stringWithFormat:@"file://%@/index.html#/NewDetail",path];
                           

                            [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:appPath]]];
                          
                                NSLog(@"body请求数据成功： *** %@", dataDict);
                            } failureBlock:^(NSError *error) {
                                
                            } progress:^(int64_t bytesProgress, int64_t totalBytesProgress) {
                                
                            }];
   
    JSContext *context=[self.webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext" ];
    
    NSString *alertJS=@"pay_back()";
    [context evaluateScript:alertJS];
    [context evaluateScript:alertJS];

}
-(void)dealloc{
  [[NSNotificationCenter defaultCenter] removeObserver:self];
}
-(void)viewWillAppear:(BOOL)animated{
     [self.rdv_tabBarController setTabBarHidden:YES animated:NO];
}
-(void)viewWillDisappear:(BOOL)animated{
    [self.rdv_tabBarController setTabBarHidden:NO animated:NO];
    [self.webView removeFromSuperview];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

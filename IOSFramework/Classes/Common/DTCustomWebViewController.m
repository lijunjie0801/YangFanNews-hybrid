//
//  DTCustomWebViewController.m
//  DecorateTogether
//
//  Created by Aiken on 15/11/11.
//  Copyright © 2015年 Aiken. All rights reserved.
//

#import "DTCustomWebViewController.h"
#import "RDVTabBarController.h"
#import "HomeViewController.h"

@implementation DTCustomWebViewController
-(NSMutableArray *)saveUrl
{
    if (_saveUrl==nil) {
        _saveUrl=[NSMutableArray array];
    }
    return _saveUrl;
}
- (instancetype)initWithStartPage:(NSString *)urlStr
{
    self = [super init];
    if (self) {
        _backtype=@"normal";
        self.startPage = urlStr;
        NSURL *url=[NSURL URLWithString:urlStr];
        NSURLRequest* request = [NSURLRequest requestWithURL:url] ;
        [self.webView loadRequest:request];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.backBtn];
    self.type=@"0";
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(webMessage:) name:@"webMessage" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(titleChange:) name:@"titleChange" object:nil];
}
#pragma 修改标题
-(void)titleChange:(NSNotification *)noti{
    NSString *title =[[noti userInfo] objectForKey:@"title"];
    self.title = title;
    if ([title isEqualToString:@"我的"]||[title isEqualToString:@"发现"]) {
        _backBtn.hidden = YES;
        [self.rdv_tabBarController setTabBarHidden:NO animated:NO];
    }
    else if ([title isEqualToString:@"我的"]||[title isEqualToString:@"支付"]||[title isEqualToString:@"核保结果"]||[title isEqualToString:@"核保失败"]) {
        [_backBtn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    }else
    {
        _backBtn.hidden = NO;
        [self.rdv_tabBarController setTabBarHidden:YES animated:NO];
    }
}
-(void)webMessage:(NSNotification *)message
{
    NSString *url=[message object];
    [self.saveUrl addObject:url];
}
-(void)viewWillDisappear:(BOOL)animated
{
    _backBtn.hidden = YES;
    self.navigationController.navigationBar.hidden = YES;
    //    [self.rdv_tabBarController setTabBarHidden:YES animated:NO];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
    [self.rdv_tabBarController setTabBarHidden:YES animated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark UIWebDelegate implementation

- (void)webViewDidFinishLoad:(UIWebView*)theWebView
{
    // Black base color for background matches the native apps
    theWebView.backgroundColor = [UIColor whiteColor];
    NSString *currentURL = [self.webView stringByEvaluatingJavaScriptFromString:@"document.location.href"];
    NSLog(@"----------打印出的地址为%@",currentURL);
    
    if ([currentURL rangeOfString:@"/insure/new/pay-success"].location!=NSNotFound) {
        
    }
    else if ([currentURL rangeOfString:@"/insure/new/pay-fail"].location!=NSNotFound){
        
    }
    else if ([currentURL rangeOfString:@"/insure/new/the-underwriting"].location!=NSNotFound){
    }
    else if ([currentURL rangeOfString:@"/insure/new/calculate-fail"].location!=NSNotFound){
    }
    else if ([currentURL rangeOfString:@"/insure/new/pay"].location!=NSNotFound){
    }
    return [super webViewDidFinishLoad:theWebView];
}
-(void)btnClick
{
    [self.webView reload];
    [self.rdv_tabBarController setTabBarHidden:NO animated:NO];
    [self.navigationController popToRootViewControllerAnimated:YES];
}
- (UIButton *)backBtn
{
    if (!_backBtn) {
        _backBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 40)];
        [_backBtn setImage:[UIImage imageNamed:@"backIcon"] forState:UIControlStateNormal];
        //        [_backBtn setTitle:@"返回" forState:UIControlStateNormal];
        _backBtn.titleLabel.font = [UIFont boldSystemFontOfSize:14];
        _backBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -28, 0, 0);
        _backBtn.titleEdgeInsets = UIEdgeInsetsMake(0, -28, 0, 0);
        [_backBtn addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backBtn;
}
- (void)goBack
{
    if (_saveUrl.count==1||[self.title isEqualToString:@"客户投保"]||[self.title isEqualToString:@"订单列表"]||[self.title isEqualToString:@"非车险产品"]||[self.title isEqualToString:@"客户资料"]) {
        [self.navigationController popViewControllerAnimated:YES];
    }else if ([self.title isEqualToString:@"车辆信息"]){
        if ([self.orderTag isEqualToString:@"3"]) {
            //[self.webView goBack];
            [_saveUrl removeObjectAtIndex:_saveUrl.count-1];
            NSString * URL = [NSString stringWithFormat:@"file://%@/index.html#/insure/new/order-list",Bundle2];
            
            NSURL *url=[NSURL URLWithString:URL];
            
            NSURLRequest* request = [NSURLRequest requestWithURL:url] ;
            
            [self.webView loadRequest:request];
            
        }else{
            [_saveUrl removeAllObjects];
            NSString * URL = [NSString stringWithFormat:@"file://%@/index.html#/insure/new/carownerinput",Bundle2];
            
            NSURL *url=[NSURL URLWithString:URL];
            
            NSURLRequest* request = [NSURLRequest requestWithURL:url] ;
            
            [self.webView loadRequest:request];
        }
    }else{
        [self.webView goBack];
        [_saveUrl removeObjectAtIndex:_saveUrl.count-1];
    }
}


@end

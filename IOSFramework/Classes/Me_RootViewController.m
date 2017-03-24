//
//  Me_RootViewController.m
//  IOSFramework
//
//  Created by xu on 16/3/14.
//
//

#import "Me_RootViewController.h"
#import "DTCustomWebViewController.h"
#import "CYRootTabViewController.h"
@interface Me_RootViewController ()
@property(nonatomic,strong)NSString *webtitle;
@end

@implementation Me_RootViewController

-(NSMutableArray *)saveUrl
{
    if (_saveUrl==nil) {
        _saveUrl=[NSMutableArray array];
    }
    return _saveUrl;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.backBtn];
    self.navigationController.navigationBar.hidden = NO;
    NSString * URL = [NSString stringWithFormat:@"file://%@/index.html#/person/detail",Bundle2];
    NSURL *url = [NSURL URLWithString:URL];
    NSURLRequest* request = [NSURLRequest requestWithURL:url] ;
    self.webView.backgroundColor = [UIColor whiteColor];
    [self.webView loadRequest:request];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    _backBtn.hidden = YES;
    self.navigationController.navigationBar.hidden = NO;
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(webMessage:) name:@"webMessage" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(titleChange:) name:@"titleChange" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(Clickme:) name:@"Clickme" object:nil];
    if([self.title isEqualToString:@"个人名片"])
    {
        [self.rdv_tabBarController setTabBarHidden:YES animated:NO];
         _backBtn.hidden = NO;
    }
}

-(void)viewWillDisappear:(BOOL)animated
{
    self.navigationController.navigationBar.hidden = YES;
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}
-(void)Clickme:(NSNotification *)noti{
    self.title = @"我的";
    _backBtn.hidden = YES;
}
#pragma 修改标题
-(void)titleChange:(NSNotification *)noti{
    NSString *title =[[noti userInfo] objectForKey:@"title"];
    self.title = title;
    if ([title isEqualToString:@"我的"]||[title isEqualToString:@"发现"]) {
        _backBtn.hidden = YES;
        [self.rdv_tabBarController setTabBarHidden:NO animated:NO];
    }
    else
    {
        _backBtn.hidden = NO;
        [self.rdv_tabBarController setTabBarHidden:YES animated:NO];
    }
}

-(void)webMessage:(NSNotification *)message
{
    NSString *url=[message object];
    [self.saveUrl addObject:url];
    
    NSString * URL = [NSString stringWithFormat:@"file://%@/index.html#/person/detail",Bundle2];
    if ([url isEqualToString:URL]) {
        _backBtn.hidden = YES;
        self.title = @"我的";
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark UIWebDelegate implementation


- (void)goBack
{
    //    if (_saveUrl.count==1)
    //    {
    //        [self.navigationController popViewControllerAnimated:YES];
    //    }
    //    else
    //    {
    if ([self.title isEqualToString:@"车辆信息"]) {
        NSString * URL = [NSString stringWithFormat:@"file://%@/index.html#/insure/new/order-list",Bundle2];
        
        NSURL *url=[NSURL URLWithString:URL];
        
        NSURLRequest* request = [NSURLRequest requestWithURL:url] ;
        
        [self.webView loadRequest:request];
        
    }else if ([self.title isEqualToString:@"订单列表"]){
        NSString * URL = [NSString stringWithFormat:@"file://%@/index.html#/person/detail",Bundle2];
        
        NSURL *url=[NSURL URLWithString:URL];
        
        NSURLRequest* request = [NSURLRequest requestWithURL:url] ;
        
        [self.webView loadRequest:request];
    }else if([self.title isEqualToString:@"支付"]||[self.title isEqualToString:@"核保结果"]||[self.title isEqualToString:@"核保失败"])
    {
        NSString * URL = [NSString stringWithFormat:@"file://%@/index.html#/person/detail",Bundle2];
        NSURL *url = [NSURL URLWithString:URL];
        NSURLRequest* request = [NSURLRequest requestWithURL:url] ;
        self.webView.backgroundColor = [UIColor whiteColor];
        [self.webView loadRequest:request];
    }
    else
    {
        [self.webView goBack];
        [_saveUrl removeObjectAtIndex:_saveUrl.count-1];
    }
    //    }
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

@end
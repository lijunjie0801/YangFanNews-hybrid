//
//  AAAAAViewController.m
//  IOSFramework
//
//  Created by xu on 16/4/5.
//
//

#import "AAAAAViewController.h"
#import "DTCustomWebViewController.h"
#import "CYRootTabViewController.h"
#import "HomeViewController.h"

@interface AAAAAViewController ()

@end

@implementation AAAAAViewController

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
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(webMessage:) name:@"webMessage" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(titleChange:) name:@"titleChange" object:nil];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    NSString * URL = [NSString stringWithFormat:@"file://%@/index.html#/person/detail",Bundle];
    //    NSString *URL = [NSString stringWithFormat:@"http://180.168.131.15/emshop/app/index.html#/insure/new/pay-fail"];
    NSURL *url = [NSURL URLWithString:URL];
    NSURLRequest* request = [NSURLRequest requestWithURL:url] ;
    self.webView.backgroundColor = [UIColor whiteColor];
    [self.webView loadRequest:request];
}

#pragma 修改标题
-(void)titleChange:(NSNotification *)noti{
    NSString *title =[[noti userInfo] objectForKey:@"title"];
    self.title = title;
    if ([title isEqualToString:@"个人信息详情"]||[title isEqualToString:@"发现"]) {
        _backBtn.hidden = YES;
        [self.rdv_tabBarController setTabBarHidden:NO animated:NO];
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
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark UIWebDelegate implementation


//[logoImageView autoSetDimensionsToSize:CGSizeMake(100, 100)];
//[logoImageView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:40];
//[logoImageView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:(kScreen_Width-100)/2];


//[self.view addSubview:loginBtn];
//[loginBtn addTarget:self action:@selector(loginClick) forControlEvents:UIControlEventTouchUpInside];
//[loginBtn autoSetDimensionsToSize:CGSizeMake(0, 40)];
//[loginBtn autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:10];
//[loginBtn autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:10];
//[loginBtn autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:passwordText withOffset:30];
//- (void)webViewDidFinishLoad:(UIWebView*)theWebView
//{
//    // Black base color for background matches the native apps
//    theWebView.backgroundColor = [UIColor blackColor];
//    NSString *currentURL = [self.webView stringByEvaluatingJavaScriptFromString:@"document.location.href"];
//    NSLog(@"----------打印出的地址为%@",currentURL);
//
//    if ([currentURL rangeOfString:@"/insure/new/pay-success"].location!=NSNotFound) {
//        UIButton *btn = [[UIButton alloc]init];
//        [btn setTitle:@"返回首页" forState:UIControlStateNormal];
//        [btn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
//        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//        [btn setBackgroundColor:[UIColor colorWithHexString:@"ed6d2a"]];
//        btn.frame = CGRectMake(20, kScreen_Height-kNav_Tab_LightHeight-50-20, (kScreen_Width-40), 40);
//        [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
//        [self.webView addSubview:btn];
//    }
//    else if ([currentURL rangeOfString:@"/insure/new/pay-fail"].location!=NSNotFound){
//        UIButton *btn = [[UIButton alloc]init];
//        [btn setTitle:@"重新支付" forState:UIControlStateNormal];
//        [btn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
//        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//        [btn setBackgroundColor:[UIColor colorWithHexString:@"ed6d2a"]];
//        btn.frame = CGRectMake(20, kScreen_Height-kNav_Tab_LightHeight-50-20, (kScreen_Width-40), 40);
//        [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
//        [self.webView addSubview:btn];
//
////        UIButton *nexbtn = [[UIButton alloc]init];
////        [nexbtn setTitle:@"更换支付方式" forState:UIControlStateNormal];
////        [nexbtn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
////        [nexbtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
////        [nexbtn setBackgroundColor:[UIColor colorWithHexString:@"ed6d2a"]];
////        nexbtn.frame = CGRectMake(40+(kScreen_Width-60)/2, kScreen_Height-kNav_Tab_LightHeight-50-20, (kScreen_Width-60)/2, 40);
////        [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
////        [self.webView addSubview:nexbtn];
//    }
//    return [super webViewDidFinishLoad:theWebView];
//}
//-(void)btnClick
//{
////    HomeViewController *home = [[HomeViewController alloc]init];
////    [self.navigationController popToRootViewController:home];
//
//}

- (void)goBack
{
    if (_saveUrl.count==1) {
        [self.navigationController popViewControllerAnimated:YES];
        
        
    }else{
        [self.webView goBack];
        [_saveUrl removeObjectAtIndex:_saveUrl.count-1];
    }
}


//- (UIButton *)backBtn
//{
//    if (!_backBtn) {
//        _backBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 40)];
//        [_backBtn setImage:[UIImage imageNamed:@"backIcon"] forState:UIControlStateNormal];
//        [_backBtn setTitle:@"返回" forState:UIControlStateNormal];
//        _backBtn.titleLabel.font = [UIFont boldSystemFontOfSize:14];
//        _backBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -28, 0, 0);
//        _backBtn.titleEdgeInsets = UIEdgeInsetsMake(0, -28, 0, 0);
//        [_backBtn addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
//    }
//
//    return _backBtn;
//}

@end
//
//  WebHomeViewController.m
//  IOSFramework
//
//  Created by lijunjie on 2017/1/18.
//
//

#import "VideoViewController.h"
#include "WebViewController.h"
#import "BANetManager.h"
#define DEVICE_WIDTH   ([UIScreen mainScreen].bounds.size.width)
#define DEVICE_HEIGHT  ([UIScreen mainScreen].bounds.size.height)
@interface VideoViewController ()

@end

@implementation VideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *path=[[NSBundle mainBundle]pathForResource:@"app" ofType:nil];
    NSString *appPath=[NSString stringWithFormat:@"file://%@/index.html#/second",path];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:appPath]]];
    self.title=@"首页";
    [self.webView setFrame:CGRectMake(0, 0, DEVICE_WIDTH, DEVICE_HEIGHT-60)];
   // self.webView.allowsInlineMediaPlayback = YES;
    self.webView.allowsInlineMediaPlayback = YES;
    self.webView.mediaPlaybackRequiresUserAction = NO;
//    [[NSNotificationCenter defaultCenter]postNotificationName:@"videoType" object:self.videoType];
//    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(webMessage:) name:@"webMessage" object:nil];
//    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(LoadUrl:) name:@"LoadUrl" object:nil];


}
-(void)viewWillAppear:(BOOL)animated{
    [[NSUserDefaults standardUserDefaults] setObject:self.videoType forKey:@"videotype"];

}
//-(void)LoadUrl:(NSNotification *)message
//{
//   // NSString *url=[message object];
//    NSString *url =[[message userInfo] objectForKey:@"url"];
//    NSString *source=[[message userInfo] objectForKey:@"source"];
//    NSLog(@"%@",url);
//    WebViewController *wvc=[[WebViewController alloc]init];
//    wvc.loadurl=url;
//    wvc.source=source;
//    [self.navigationController pushViewController:wvc animated:NO];
//}

//-(void)webMessage:(NSNotification *)message
//{
//    NSString *url=[message object];
//    NSLog(@"%@",url);
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

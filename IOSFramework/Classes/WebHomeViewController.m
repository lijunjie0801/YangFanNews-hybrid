//
//  WebHomeViewController.m
//  IOSFramework
//
//  Created by lijunjie on 2017/1/18.
//
//

#import "WebHomeViewController.h"
#include "WebViewController.h"
#import "BANetManager.h"
#define DEVICE_WIDTH   ([UIScreen mainScreen].bounds.size.width)
#define DEVICE_HEIGHT  ([UIScreen mainScreen].bounds.size.height)

@interface WebHomeViewController ()
@property(nonatomic,strong)NSMutableArray *saveurl;
@end

@implementation WebHomeViewController

-(NSMutableArray *)saveurl{
    if (!_saveurl) {
        _saveurl=[NSMutableArray array];
    }
    return _saveurl;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *path=[[NSBundle mainBundle]pathForResource:@"app" ofType:nil];
    NSString *appPath=[NSString stringWithFormat:@"file://%@/index.html#/test",path];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:appPath]]];
  [self.webView setFrame:CGRectMake(0, 0, DEVICE_WIDTH, DEVICE_HEIGHT-50)];
    self.webView.allowsInlineMediaPlayback = YES;
    self.webView.mediaPlaybackRequiresUserAction = NO;



}
-(void)viewWillAppear:(BOOL)animated{
    [[NSUserDefaults standardUserDefaults] setObject:self.newsType forKey:@"newstype"];
    
}

//-(void)LoadUrl:(NSNotification *)message
//{
//    NSString *url =[[message userInfo] objectForKey:@"url"];
//    NSString *source=[[message userInfo] objectForKey:@"source"];
//    [_saveurl addObject:url];
//    if (_saveurl.count>1) {
//        if (![_saveurl[_saveurl.count-1] isEqualToString:_saveurl[_saveurl.count-2]]) {
//            WebViewController *wvc=[[WebViewController alloc]init];
//            wvc.loadurl=url;
//            wvc.source=source;
//            [self.navigationController pushViewController:wvc animated:NO];
//            return;
//        }
//    }else{
//        WebViewController *wvc=[[WebViewController alloc]init];
//        wvc.loadurl=url;
//        wvc.source=source;
//        [self.navigationController pushViewController:wvc animated:NO];
//        return;
//    }
//    NSLog(@"%@",url);
//   }
-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
-(void)webMessage:(NSNotification *)message
{
    NSString *url=[message object];
    NSLog(@"%@",url);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end

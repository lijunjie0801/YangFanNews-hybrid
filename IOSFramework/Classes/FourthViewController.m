//
//  FourthViewController.m
//  IOSFramework
//
//  Created by lijunjie on 2017/2/4.
//
//

#import "FourthViewController.h"
#define DEVICE_WIDTH   ([UIScreen mainScreen].bounds.size.width)
#define DEVICE_HEIGHT  ([UIScreen mainScreen].bounds.size.height)
@interface FourthViewController ()

@end

@implementation FourthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"我的";
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    NSString *path=[[NSBundle mainBundle]pathForResource:@"app" ofType:nil];
    NSString *appPath=[NSString stringWithFormat:@"file://%@/index.html#/Fourth",path];
    [self.webView setFrame:CGRectMake(0, -20, DEVICE_WIDTH, DEVICE_HEIGHT+20)];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:appPath]]];
}

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

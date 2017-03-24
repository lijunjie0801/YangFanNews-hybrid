//
//  ThirdViewController.m
//  IOSFramework
//
//  Created by lijunjie on 2017/2/4.
//
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"图片";
    NSString *path=[[NSBundle mainBundle]pathForResource:@"app" ofType:nil];
    NSString *appPath=[NSString stringWithFormat:@"file://%@/index.html#/Third",path];
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

//
//  LoginOut.m
//  IOSFramework
//
//  Created by xu on 16/5/9.
//
//

#import "LoginOut.h"
#import "LoginViewController.h"
#import "MYLoginViewControllers.h"
#define kLoginStatus @"login_status"
@implementation LoginOut

- (void)sigInOut:(CDVInvokedUrlCommand*)command
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"确认退出吗" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alert show];
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex==1) {
        LoginViewController *login = [[LoginViewController alloc]init];
        MYLoginViewControllers *loginViewController= [[MYLoginViewControllers alloc] init];

        NSArray *arry = self.viewController.navigationController.viewControllers;
        [[NSUserDefaults standardUserDefaults]setObject:[NSNumber numberWithInt:0] forKey:kLoginStatus];
        //退出登录
      
              NSLog(@"所有的控制器为@%@",arry);
        [self.viewController.navigationController presentViewController:loginViewController animated:NO completion:^{
            
        }];
    }else{
        
    }
}
@end

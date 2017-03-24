//
//  AppDelegate.m
//  aaaaa
//
//  Created by xu on 16/2/26.
//  Copyright © 2016年 xu. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginViewController.h"
#import "CYRootTabViewController.h"
#import "MYLoginViewControllers.h"
#import <ShareSDK/ShareSDK.h>
#import "ShareViewController.h"
#import "Me_RootViewController.h"
//腾讯开放平台（对应QQ和QQ空间）SDK头文件
#import <TencentOpenAPI/TencentOAuth.h>
#import <TencentOpenAPI/QQApiInterface.h>

//微信SDK头文件
#import "WXApi.h"

//新浪微博SDK头文件
#import "WeiboSDK.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    /*设置所有的界面布局都是从导航栏下开始*/
    UINavigationBar *naviGationBar = [UINavigationBar appearance];
    naviGationBar.translucent = NO;
    [naviGationBar setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithHexString:@"216ca6"]] forBarMetrics:UIBarMetricsDefault];
    [naviGationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    NSLog(@"00000");
    CYRootTabViewController *startView =  [[CYRootTabViewController alloc] init];
    self.window.rootViewController = startView;
    [self.window makeKeyAndVisible];
    if(![[NSUserDefaults standardUserDefaults] boolForKey:@"firstStart"]){
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"firstStart"];
        NSLog(@"第一次启动");
        NSString *path= [[NSBundle mainBundle] pathForResource:@"Data" ofType:@"plist"];
        //NSData *data=[NSData dataWithContentsOfFile:path];
        NSArray *array=[NSArray arrayWithContentsOfFile:path];
        NSMutableArray *marr=[NSMutableArray array];
        for (int i=0; i<array.count; i++) {
            [marr addObject:array[i]];;
        }
        NSLog(@"这是总数据%@",[marr class]);
        [[NSUserDefaults standardUserDefaults] setObject:marr forKey:@"datasource"];
        
        
        NSString *path1= [[NSBundle mainBundle] pathForResource:@"secondData" ofType:@"plist"];
        NSArray *array1=[NSArray arrayWithContentsOfFile:path1];
        NSMutableArray *marr1=[NSMutableArray array];
        for (int i=0; i<array1.count; i++) {
            [marr1 addObject:array1[i]];;
        }
        [[NSUserDefaults standardUserDefaults] setObject:marr1 forKey:@"seconddatasource"];
        
    }else{
        NSLog(@"不是第一次启动");
    }

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
- (void)returnWindow
{
    NSString* isLogin =  [NSString stringWithFormat:@"%@", [[NSUserDefaults standardUserDefaults]objectForKey:kLoginStatus]];
}@end

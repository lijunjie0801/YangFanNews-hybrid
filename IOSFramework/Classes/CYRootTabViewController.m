//
//  CYRootTabViewController.m
//  IOSFramework
//
//  Created by xu on 16/3/14.
//
//

#import "CYRootTabViewController.h"
#import "RDVTabBarItem.h"
#import "HomeViewController.h"
#import "FoundViewController.h"
#import "ShareViewController.h"
#import "Me_RootViewController.h"
#import "DTCustomWebViewController.h"
#import "WebHomeViewController.h"
#import "VideoViewController.h"
#import "SecondViewController.h"
#import "ViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"
@interface CYRootTabViewController ()

@end

@implementation CYRootTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  //  NSLog(@"打印出的flage为：%@",_flag);
    [self setupViewControllers];
    
    [self customizeTabBarForController];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void)setupViewControllers {
    
   // HomeViewController *homePage = [[HomeViewController alloc] init];
   // homePage.flag =  self.flag;
    ViewController *homePage = [[ViewController alloc] init];
    UINavigationController *nav_home = [[UINavigationController alloc] initWithRootViewController:homePage];
    
    SecondViewController *progress = [[SecondViewController alloc] init];
    UINavigationController *nav_progress = [[UINavigationController alloc] initWithRootViewController:progress];
    
    
    ThirdViewController *search = [[ThirdViewController alloc] init];
    UINavigationController *nav_search = [[UINavigationController alloc] initWithRootViewController:search];
    
    FourthViewController *me = [[FourthViewController alloc] init];
    UINavigationController *nav_me = [[UINavigationController alloc] initWithRootViewController:me];
    
    [self setViewControllers:@[nav_home, nav_progress, nav_search, nav_me]];
    
}

- (void)customizeTabBarForController {
    NSArray *tabBarItemImages = @[@"homePage", @"search", @"progress", @"me"];
    NSArray *tabBarItemTitles = @[@"首页", @"视频", @"图片", @"我的"];
    
    NSInteger index = 0;
    for (RDVTabBarItem *item in [[self tabBar] items]) {
        UIImage *selectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_selected",
                                                      [tabBarItemImages objectAtIndex:index]]];
        UIImage *unselectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_normal",
                                                        [tabBarItemImages objectAtIndex:index]]];
        [item setFinishedSelectedImage:selectedimage withFinishedUnselectedImage:unselectedimage];
        [item setTitle:[tabBarItemTitles objectAtIndex:index]];
        index++;
    }
}


@end

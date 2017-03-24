//
//  ToUrl.m
//  IOSFramework
//
//  Created by lijunjie on 2017/1/18.
//
//

#import "ToUrl.h"
#import "WebViewController.h"
#import "BANetManager.h"
#define kUrlNewsDetails @"http://c.3g.163.com/nc/article/%@/full.html"
@implementation ToUrl
- (void)toUrl:(CDVInvokedUrlCommand*)command{
    NSDictionary *loadurl = [command.arguments lastObject];
    NSString *url=[loadurl objectForKey:@"url"];
    NSString *source=[loadurl objectForKey:@"source"];
    NSString *docid=[loadurl objectForKey:@"docid"];
    NSLog(@"%@",loadurl[@"source"]);
    
    NSDictionary *dic = @{
                          @"url":url,
                          @"source":source
                        
                          };
    [[NSUserDefaults standardUserDefaults] setObject:docid forKey:@"godetail"];
    WebViewController *wvc=[[WebViewController alloc]init];
    wvc.loadurl=url;
    wvc.source=source;
    wvc.docid=docid;
    [self.viewController.navigationController pushViewController:wvc animated:NO];
}
@end

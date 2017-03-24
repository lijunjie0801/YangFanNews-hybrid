//
//  Gethomedata.m
//  IOSFramework
//
//  Created by lijunjie on 2017/1/18.
//
//

#import "Gethomedata.h"
#import "BANetManager.h"
#import "VideoViewController.h"
#define kURL_FirstNEWSLIST @"http://c.3g.163.com/nc/article/headline/%@/%d-20.html"
#define kURL_NEWSLIST @"http://c.m.163.com/nc/article/list/%@/%d-20.html"
static int pagenum;
@implementation Gethomedata
- (void)gethomedata:(CDVInvokedUrlCommand*)command{
    NSString *str = [command.arguments lastObject];
    NSString *type=[str componentsSeparatedByString:@"&"][0];
    NSString *page=[str componentsSeparatedByString:@"&"][1];
    pagenum=([page intValue]-1)*20;
    if ([type isEqualToString:@"1"]) {
        [self getHomeData:command];
    }else{
        [self getVideoData:command];
    }

}
-(void)getHomeData:(CDVInvokedUrlCommand*)command{
    NSString *ss=[[NSUserDefaults standardUserDefaults] objectForKey:@"newstype"];
    NSString *urlString;
    if ([ss isEqualToString:@"T1348647853363"]) {
           urlString = [NSString stringWithFormat:kURL_FirstNEWSLIST,ss,pagenum];
    }else{
        urlString = [NSString stringWithFormat:kURL_NEWSLIST,ss,pagenum];
    }

    [BANetManager ba_requestWithType:BAHttpRequestTypeGet
                           urlString:urlString
                          parameters:nil
                        successBlock:^(id response) {
                            NSLog(@"get请求数据成功： *** %@", response);
                            NSArray *array=[response objectForKey:ss];
                            self.result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsArray:array];
                            
                                [self.commandDelegate sendPluginResult:self.result callbackId:command.callbackId
                                 ];
                            
                            
                        } failureBlock:^(NSError *error) {
                            
                        } progress:^(int64_t bytesProgress, int64_t totalBytesProgress) {
                            
                        }];
}
-(void)getVideoData:(CDVInvokedUrlCommand*)command{
    NSString *ss=[[NSUserDefaults standardUserDefaults] objectForKey:@"videotype"];
    NSString *url=[NSString stringWithFormat:@"http://c.3g.163.com/nc/video/list/%@/y/%d-20.html",ss,pagenum];
        [BANetManager ba_requestWithType:BAHttpRequestTypeGet
                               urlString:url
                              parameters:nil
                            successBlock:^(id response) {
                                NSLog(@"get请求数据成功： *** %@", response);
                                NSArray *array=[response objectForKey:ss];
                                   NSLog(@"getarray： *** %@", array);
                                self.result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsArray:array];
    
                                [self.commandDelegate sendPluginResult:self.result callbackId:command.callbackId];
    
                            }failureBlock:^(NSError *error) {
    
                            } progress:^(int64_t bytesProgress, int64_t totalBytesProgress) {
                                
                            }];
   
}
@end

//
//  GotoDetail.m
//  IOSFramework
//
//  Created by lijunjie on 2017/2/6.
//
//

#import "GotoDetail.h"
#import "BANetManager.h"
#define kUrlNewsDetails @"http://c.3g.163.com/nc/article/%@/full.html"
@implementation GotoDetail
-(void)gotoDetail:(CDVInvokedUrlCommand *)command{
//    NSString *docid = [command.arguments lastObject];
  
   NSString *docid= [[NSUserDefaults standardUserDefaults] objectForKey:@"godetail"];
   NSString *requrl=[NSString stringWithFormat:kUrlNewsDetails, docid];
    [BANetManager ba_requestWithType:BAHttpRequestTypeGet
                           urlString:requrl
                          parameters:nil
                        successBlock:^(id response) {
                            NSLog(@"get请求数据成功： *** %@", response);
                            NSDictionary *dataDict = [response objectForKey:docid];
                            NSString *bodyhtml=[dataDict objectForKey:@"body"];
                            NSArray *imageArray=[dataDict objectForKey:@"img"];
                            for (int i = 0; i < imageArray.count; i++) {
                                NSArray *pixArr = [imageArray[i][@"pixel"]  componentsSeparatedByString:@"*"];
                                if (!pixArr) {
                                    pixArr = @[[NSString stringWithFormat:@"%f", SCREEN_WIDTH - 20], [NSString stringWithFormat:@"%f", (SCREEN_WIDTH - 20) * 2.0 / 3]];
                                }
                                if ([pixArr[0] floatValue] > SCREEN_WIDTH) {
                                    pixArr = @[[NSString stringWithFormat:@"%f", SCREEN_WIDTH - 20],[NSString stringWithFormat:@"%f",[pixArr[1] floatValue]  * SCREEN_WIDTH / [pixArr[0] floatValue]]];
                                    
                                }
                                NSString *imgTag = [NSString stringWithFormat:@"<div style=\"border:1px font-size:14; text-align:center; solid #ccc;\"> <img style=\" width:%@px; height:%@;\" src=\"%@\"><span>%@</span></div>",pixArr[0], pixArr[1], imageArray[i][@"src"], imageArray[i][@"alt"]];
                                 bodyhtml = [bodyhtml stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"<!--IMG#%d-->", i] withString:imgTag];

                            }
                            
                            self.result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:bodyhtml];
                            
                            [self.commandDelegate sendPluginResult:self.result callbackId:command.callbackId
                             ];

                        } failureBlock:^(NSError *error) {
                            
                        } progress:^(int64_t bytesProgress, int64_t totalBytesProgress) {
                            
                        }];

}
@end

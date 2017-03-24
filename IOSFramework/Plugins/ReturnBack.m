//
//  ReturnBack.m
//  IOSFramework
//
//  Created by xu on 16/5/4.
//
//

#import "ReturnBack.h"

@implementation ReturnBack
-(void)returnBack:(CDVInvokedUrlCommand *)command
{
    CDVPluginResult* pluginResult = nil;
    _urlStr = [command.arguments objectAtIndex:0];
    NSLog(@"----------获取到的数据为%@",_urlStr);
    if (_urlStr != nil ) {
        NSLog(@"ios send OK");
    } else {
        NSLog(@"ios send fail");
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"打开方法出错"];
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    NSDictionary *dic = @{@"returnBack":_urlStr};
    [[NSNotificationCenter defaultCenter] postNotificationName:@"returnBack" object:nil userInfo:dic];
}
//-(void)LocalPhoto
//{
//    if (_urlStr ==nil) {
//        [self.viewController.navigationController popViewControllerAnimated:YES];
//        
//    }else
//    {
//        NSString * URL = [NSString stringWithFormat:@"file://%@/index.html#%@",Bundle,_urlStr];
//        DTCustomWebViewController * VC = [[DTCustomWebViewController alloc]initWithStartPage:URL];
//        [self.viewController.navigationController pushViewController:VC animated:YES];
//    }
//}


@end

//
//  Signin.m
//  IOSFramework
//
//  Created by xu on 16/3/24.
//
//

#import "Signin.h"

@implementation Signin
- (void)doSignin:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        NSDictionary *lat=[[NSUserDefaults standardUserDefaults]objectForKey:@"loginInformation"];
//        NSDictionary *dict = @{
//                               @"userInfo":lat
//                               };
//        NSLog(@"----chuan过去的字典为%@",dict);
        self.result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:lat];
        [self.commandDelegate sendPluginResult:self.result callbackId:command.callbackId
         ];
    }];
}
@end

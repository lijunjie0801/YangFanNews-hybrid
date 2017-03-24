//
//  LoginOut.h
//  IOSFramework
//
//  Created by xu on 16/5/9.
//
//

#import "CDVPlugin.h"

@interface LoginOut : CDVPlugin<UIAlertViewDelegate>


@property (nonatomic,strong)CDVPluginResult * result;
- (void)sigInOut:(CDVInvokedUrlCommand*)command;
@end

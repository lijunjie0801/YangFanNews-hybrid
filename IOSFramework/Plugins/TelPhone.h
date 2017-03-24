//
//  TelPhone.h
//  IOSFramework
//
//  Created by xu on 16/6/10.
//
//

#import "CDVPlugin.h"

@interface TelPhone : CDVPlugin
@property (nonatomic,strong)CDVPluginResult * result;


- (void)telphone:(CDVInvokedUrlCommand*)command;
@end

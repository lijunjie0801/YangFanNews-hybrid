//
//  Signin.h
//  IOSFramework
//
//  Created by xu on 16/3/24.
//
//

#import "CDVPlugin.h"

@interface Signin : CDVPlugin
@property (nonatomic,strong)CDVPluginResult * result;


- (void)doSignin:(CDVInvokedUrlCommand*)command;
@end

//
//  GotoDetail.h
//  IOSFramework
//
//  Created by lijunjie on 2017/2/6.
//
//

#import <Foundation/Foundation.h>
#import "CDVPlugin.h"
@interface GotoDetail : CDVPlugin
@property (nonatomic,strong)CDVPluginResult * result;
@property (nonatomic,strong)CDVInvokedUrlCommand *command;
- (void)gotoDetail:(CDVInvokedUrlCommand*)command;
@end

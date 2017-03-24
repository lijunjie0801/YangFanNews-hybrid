//
//  Gethomedata.h
//  IOSFramework
//
//  Created by lijunjie on 2017/1/18.
//
//

#import <Foundation/Foundation.h>
#import "CDVPlugin.h"
@interface Gethomedata :  CDVPlugin
@property (nonatomic,strong)CDVPluginResult * result;
@property (nonatomic,strong)CDVInvokedUrlCommand *command;
@property (nonatomic,strong)NSString *getType;
- (void)gethomedata:(CDVInvokedUrlCommand*)command;

@end

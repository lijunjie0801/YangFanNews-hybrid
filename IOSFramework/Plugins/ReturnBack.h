//
//  ReturnBack.h
//  IOSFramework
//
//  Created by xu on 16/5/4.
//
//

#import "CDVPlugin.h"
#import "DTCustomWebViewController.h"

@interface ReturnBack : CDVPlugin

@property (nonatomic,strong)CDVPluginResult * result;
@property (nonatomic,strong) NSString *urlStr;
- (void)returnBack:(CDVInvokedUrlCommand*)command;
@end

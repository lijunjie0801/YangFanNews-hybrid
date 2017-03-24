//
//  ToolKit.m
//  IOSFramework
//
//  Created by 王刚 on 16/3/21.
//
//

#import "ToolKit.h"

@implementation ToolKit
void showAlert(NSString *message){
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:message delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [alertView show];
}

@end

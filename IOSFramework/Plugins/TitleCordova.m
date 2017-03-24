//
//  TitleCordova.m
//  IOSFramework
//
//  Created by 王刚 on 16/3/23.
//
//

#import "TitleCordova.h"

@implementation TitleCordova
-(void)doTitle:(CDVInvokedUrlCommand *)command{
    NSString *title = [command.arguments lastObject];
    NSDictionary *dic = @{@"title":title};
    [[NSNotificationCenter defaultCenter] postNotificationName:@"titleChange" object:nil userInfo:dic];
}
@end

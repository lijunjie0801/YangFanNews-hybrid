//
//  GetCityData.m
//  IOSFramework
//
//  Created by xu on 16/4/7.
//
//

#import "GetCityData.h"

@implementation GetCityData

- (void)getData:(CDVInvokedUrlCommand*)command
{
    NSDictionary *cityDic = [command.arguments lastObject];
   [[NSNotificationCenter defaultCenter] postNotificationName:@"cityDic" object:nil userInfo:cityDic];
    [self.viewController.navigationController popToRootViewControllerAnimated:YES];
}
@end

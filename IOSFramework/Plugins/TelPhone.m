//
//  TelPhone.m
//  IOSFramework
//
//  Created by xu on 16/6/10.
//
//

#import "TelPhone.h"

@implementation TelPhone

- (void)telphone:(CDVInvokedUrlCommand*)command
{
     NSString *phoneNum = [command.arguments lastObject];
    [self telephone:phoneNum];
}
-(void)telephone:(NSString *)phone
{
    NSString *telphone = [NSString stringWithFormat:@"tel://%@",phone];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:telphone]];
}
@end

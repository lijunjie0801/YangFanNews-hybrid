//
//  PayShowPlugin.m
//  IOSFramework
//
//  Created by lijunjie on 16/6/7.
//
//

#import "PayShowPlugin.h"
#import <CommonCrypto/CommonDigest.h>
@implementation PayShowPlugin

-(void)wxpay:(CDVInvokedUrlCommand *)command
{
    NSLog(@"开始支付");
    NSString *orderNo = [command.arguments lastObject];
    NSLog(@"zhifu打印的数据为%@",orderNo);
    NSString *ipNo =[self getIPAddress];
    NSDictionary *infoDic = [[NSUserDefaults standardUserDefaults]objectForKey:@"loginInformation"];
    NSDictionary *responseObject = infoDic[@"responseObject"];
    
    NSDictionary *userInfo = responseObject[@"userInfo"];
    NSString *customerId = [userInfo objectForKey:@"customerId"];
    NSDictionary *dic = @{
                          @"channelType":@"1",
                          @"customerId":customerId,
                          @"requestObject":@{
                                  @"orderNo":orderNo,
                                  @"customerIp":ipNo,
                                  @"attach":@"支付功能"
                                  },
                          @"requestService":@"weixinAppPayUnifiedOrder"
                          };
    
    [[CY_NetAPIManager sharedManager]request_getDic:dic andBlock:^(id data, NSError *error) {
        if (!error) {
            if (data!=nil) {
                NSLog(@"借口返回数据为%@",data[@"responseObject"]);
                PayReq *request = [[PayReq alloc] init];
                request.partnerId = data[@"responseObject"][@"partnerid"];
                ;
                request.prepayId= data[@"responseObject"][@"prepayId"];
                request.package = data[@"responseObject"][@"packages"];
                request.nonceStr= data[@"responseObject"][@"noncestr"];
                request.timeStamp =[data[@"responseObject"][@"timestamp"] intValue];
                request.sign=data[@"responseObject"][@"sign"];
                
                BOOL bs = [WXApi isWXAppSupportApi];
                if (bs) {
                    BOOL isok = [WXApi sendReq:request];
                    if (isok) {
                        NSLog(@"调用微信支付成功");
                    }else{
                        NSLog(@"调用微信支付失败");
                    }
                }
                else{
                    NSLog(@"微信版本过低，不支持支付");
                }
                
                
            }
            
        }
    }];
    
    
    
}
- (NSString *)getIPAddress {
    NSString *address = @"error";
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    int success = 0;
    // retrieve the current interfaces - returns 0 on success
    success = getifaddrs(&interfaces);
    if (success == 0) {
        // Loop through linked list of interfaces
        temp_addr = interfaces;
        while(temp_addr != NULL) {
            if(temp_addr->ifa_addr->sa_family == AF_INET) {
                // Check if interface is en0 which is the wifi connection on the iPhone
                if([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"]) {
                    // Get NSString from C String
                    address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
                }
            }
            temp_addr = temp_addr->ifa_next;
        }
    }
    // Free memory
    freeifaddrs(interfaces);
    return address;}
@end

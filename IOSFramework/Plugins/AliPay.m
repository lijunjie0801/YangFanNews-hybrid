//
//  AliPay.m
//  IOSFramework
//
//  Created by lijunjie on 16/7/7.
//
//

#import "AliPay.h"
#import "Order.h"
#import <AlipaySDK/AlipaySDK.h>
#import "DataSigner.h"
@implementation AliPay
-(void)aliPay:(CDVInvokedUrlCommand *)command
{
    NSLog(@"开始支付了");
    NSString *orderNo = [command.arguments lastObject];
    NSLog(@"订单号为%@",orderNo);
    [self pay:orderNo];
}
-(void)pay:(NSString *)orderNo
{
    NSString *partner =@"2088211194949534";
    NSString *seller = @"e95505@tianan-insurance.com";
    NSString *privateKey =@"MIICeAIBADANBgkqhkiG9w0BAQEFAASCAmIwggJeAgEAAoGBAMKhtgKTMmoD80XXXNthmEQvx9htubuSWhSix9QqPlnx5LMzQFcEXRjcjZ3fGBgzkPA7TL48y0YuYNp0DECUQQkWQXLvSrrQ2Kpk6veyzBJyqE736XZB68sW+E4z3pYMlD45uWrupV06NMOQm6q+QK8/a0/bqxPWQzWnEn3BDp9LAgMBAAECgYEAju+3/ZgglB8mkAoj1bGM47a7a8TZfFl08mbBnp0PgXrWXIytGbrIrDN9hY2L4mosbWD/cU6wcnApDQXg4aR/RWYhrEJG/nzCX+gvPaOPBgxFL4kn9krk6b4eBcHMSCC/ply/cMKR43+0F229QvXAY6ODzHBZsS1a37CWXWc+eAECQQDytFmPUaFCCOXKvMRMwQbJl7GyIdQfy880xqp+h3tUH8l5TKVJ9DQV/UqoLur7RkGS17Zun1ALY6HSbO1t0t1LAkEAzUsyDhN/uaKQbmZLjYxyTw/kWlhwUoKX7L92y9mJF+uSpw39yjVTN2NmjvpgtP4v034qDrVw7bu7o++KGqQGAQJBAKgjXTA2ovq2Y0uSfoOV7ffWyVnYqbXlYgTz5MWHYl8jLlaETLXxIexh70iYSF4Pi/oIyu/UGoXpXgADSnEc9gUCQQDMfE0UhkmgH5Qb01sIWE/3/o1njFX9acVodWIgNMOAhw6hxab4xlrofeNHIZA4WERNNosv8XzV4DxMU6pNVPoBAkBPLonHqMsSvOSxfeN9hjBWaeqFlnAuTTRYQlJuLY9EyG4FWdlpRAbWkGm8VflomKkiQOv0ELZ6+BwXbXPMlU+Y";
    /*============================================================================*/
    /*============================================================================*/
    /*============================================================================*/
    
    //partner和seller获取失败,提示
    if ([partner length] == 0 ||
        [seller length] == 0 ||
        [privateKey length] == 0)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                        message:@"缺少partner或者seller或者私钥。"
                                                       delegate:self
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil];
        [alert show];
        return;
    }
    
    /*
     *生成订单信息及签名
     */
    //将商品信息赋予AlixPayOrder的成员变量
    Order *order = [[Order alloc] init];
    order.partner = partner;
    order.seller = seller;
    order.tradeNO = orderNo; //订单ID（由商家自行制定）
    order.productName = @"车险"; //商品标题
    order.productDescription = @"玻璃险"; //商品描述
    order.amount = [NSString stringWithFormat:@"%@",@"1.08"]; //商品价格
    order.notifyURL =  @"http://www.95505.com"; //回调URL
    order.service = @"mobile.securitypay.pay";
    order.paymentType = @"1";
    order.inputCharset = @"utf-8";
    order.itBPay = @"30m";
    order.showUrl = @"m.alipay.com";
    
    //应用注册scheme,在AlixPayDemo-Info.plist定义URL types
    NSString *appScheme = @"alisdkdemo";
    
    //将商品信息拼接成字符串
    NSString *orderSpec = [order description];
    NSLog(@"orderSpec = %@",orderSpec);
    
    //获取私钥并将商户信息签名,外部商户可以根据情况存放私钥和签名,只需要遵循RSA签名规范,并将签名字符串base64编码和UrlEncode
    id<DataSigner> signer = CreateRSADataSigner(privateKey);
    NSString *signedString = [signer signString:orderSpec];
    
    //将签名成功字符串格式化为订单字符串,请严格按照该格式
    NSString *orderString = nil;
    if (signedString != nil) {
        orderString = [NSString stringWithFormat:@"%@&sign=\"%@\"&sign_type=\"%@\"",
                       orderSpec, signedString, @"RSA"];
        
        [[AlipaySDK defaultService] payOrder:orderString fromScheme:appScheme callback:^(NSDictionary *resultDic) {
            NSLog(@"reslut = %@",resultDic);
        }];
    }
    

}

-(NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}
@end

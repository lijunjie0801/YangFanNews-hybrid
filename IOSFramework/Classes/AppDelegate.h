//
//  AppDelegate.h
//  IOSFramework
//
//  Created by xu on 16/2/26.
//
//

#import <UIKit/UIKit.h>
#import "AFNetworkReachabilityManager.h"
@interface AppDelegate : UIResponder<UIApplicationDelegate>
@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, assign) AFNetworkReachabilityStatus netWorkStatus;
@property (nonatomic,assign) BOOL ReachabilityStatus;
@property (nonatomic,strong)NSString *phoneNo;//当前登录的账号(手机号)
-(void)returnWindow;
@end

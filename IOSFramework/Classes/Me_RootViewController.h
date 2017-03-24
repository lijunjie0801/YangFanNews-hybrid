//
//  Me_RootViewController.h
//  IOSFramework
//
//  Created by xu on 16/3/14.
//
//

#import <UIKit/UIKit.h>
#import "CDVViewController.h"
#import "CYBaseViewController.h"

@interface Me_RootViewController : CDVViewController
@property (nonatomic,strong) UIButton * backBtn;
@property (nonatomic,strong) NSMutableArray *saveUrl;
@end

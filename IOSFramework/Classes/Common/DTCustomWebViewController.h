//
//  DTCustomWebViewController.h
//  DecorateTogether
//
//  Created by Aiken on 15/11/11.
//  Copyright © 2015年 Aiken. All rights reserved.
//

#import "DTBaseViewController.h"
#import "CDVViewController.h"

@interface DTCustomWebViewController : CDVViewController

@property (nonatomic,strong) UIButton * backBtn;
@property (nonatomic,strong) NSString * type;
@property (nonatomic,strong) NSString *backtype;
@property (nonatomic,strong) NSMutableArray *saveUrl;
@property (nonatomic,strong) NSString *orderTag;
- (instancetype)initWithStartPage:(NSString *)urlStr;

@end

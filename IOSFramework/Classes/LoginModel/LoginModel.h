//
//  LoginModel.h
//  IOSFramework
//
//  Created by 林科 on 14-9-3.
//  Copyright (c) 2014年 allianture. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginModel : NSObject
{
    NSDictionary *extDic;
    NSInteger pageindexInt;
}
@property (assign, nonatomic) BOOL canLoadMore;
@property (strong, nonatomic) NSDictionary *requestResultDic;
@property (strong, nonatomic) NSDictionary *responseObjectDic;

@property (strong, nonatomic) NSMutableArray *requestResultMutArr;


/* 登录 接口 implicit 是否 隐式登录   */
- (void)getLoginList:(NSDictionary *)dic
             success:(void (^)(id JSON))success
             failure:(void (^)(NSError *error))failure Implicit:(BOOL)implicit;
@end

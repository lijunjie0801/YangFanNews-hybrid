//
//  LoginModel.m
//  IOSFramework
//
//  Created by 林科 on 14-9-3.
//  Copyright (c) 2014年 allianture. All rights reserved.
//

#import "LoginModel.h"

@implementation LoginModel

- (id)init
{
	if (self = [super init])
    {
        _canLoadMore = NO;
        pageindexInt = 1;
        
        _requestResultMutArr = [[NSMutableArray alloc] init];
        
        _requestResultDic = [NSDictionary dictionary];
        _responseObjectDic = [NSDictionary dictionary];
    }
    return self;
}

#pragma mark -
#pragma mark - 数据请求层
/* 请求活动列表数据 ext1：传空 */
- (void)getLoginList:(NSDictionary *)dic
            success:(void (^)(id JSON))success
            failure:(void (^)(NSError *error))failure Implicit:(BOOL)implicit
{
    extDic = dic;
    
    if (_requestResultMutArr.count > 0)
    {
        [_requestResultMutArr removeAllObjects];
    }
    NSString *userCode = nil,*password = nil;
    NSDictionary *requestDic = nil;
    if (implicit)
    {
        requestDic = [[[ClassFactory getInstance] getNetComm] getObject:USER_LOGIN_KAY];
    }
    else
    {
        BOOL check = [self checkLoginInfo:dic];
        if (check == YES)
        {
            requestDic = [NSDictionary dictionaryWithDictionary:dic];
        }
        else
        {
            return;
        }
    }
    userCode = [NSString stringWithFormat:@"%@",[requestDic objectForKey:USERNAME_KEY]];
    STRING_NIL_TO_NONE(userCode);
    password = [NSString stringWithFormat:@"%@",[requestDic objectForKey:USERPASS_KEY]];
    STRING_NIL_TO_NONE(password);
    

    [[[ClassFactory getInstance] getNetComm] showloading:nil];
    [[[ClassFactory getInstance] getNetComm]loginAsynGetLogin:userCode password:password  success:^(id JSON) {
        _requestResultDic = [[NSDictionary alloc] initWithDictionary:JSON];
    
        NSLog(@"login_requestResultDic%@",_requestResultDic);
        
        NSString *resultCode = [NSString stringWithFormat:@"%@",[_requestResultDic objectForKey:@"resultCode"]];
        STRING_NIL_TO_NONE(resultCode);
        /* 请求成功 */
        if ([resultCode isEqualToString:@"1"])
        {
            _responseObjectDic = [NSDictionary dictionaryWithDictionary:[_requestResultDic objectForKey:@"responseObject"]];
            NSString *loginResult = [NSString stringWithFormat:@"%@",[_responseObjectDic objectForKey:@"loginResult"]];
            
            
            if (ISNOTNILDIC(_responseObjectDic))
            {
                if ([loginResult isEqualToString:@"1"])
                {
                    
                    NSString *userId = [NSString stringWithFormat:@"%@",[_responseObjectDic objectForKey:@"userId"]];
                    NSString *isValid = [NSString stringWithFormat:@"%@",[_responseObjectDic objectForKey:@"isValid"]];
                     NSString *usermobile = [NSString stringWithFormat:@"%@",[_responseObjectDic objectForKey:@"mobile"]];
                    //返回信息处理
                    NSMutableDictionary *responseFinialDic = [[NSMutableDictionary alloc]init];
                    /*  添加记住密码  */
                    [responseFinialDic setObject:password forKey:USERPASS_KEY];
                    [responseFinialDic setObject:userCode forKey:USERNAME_KEY];
                    [responseFinialDic setObject:userId forKey:USERID_KEY];
                    [responseFinialDic setObject:isValid forKey:USERISVALID_KEY];
                    [responseFinialDic setObject:usermobile forKey:USERMOBILE_KEY];
                    [[[ClassFactory getInstance] getNetComm] saveObject:responseFinialDic Path:USER_LOGIN_KAY];
                }
                else
                {
                    
                    
                    /* 请求失败 */
                    [[[ClassFactory getInstance] getNetComm] saveObject:nil Path:USER_LOGIN_KAY];
                    NSString *errorMessage = [NSString stringWithFormat:@"%@",[_requestResultDic objectForKey:@"errorMessage"]];
                    STRING_NIL_TO_NONE(errorMessage);
                    [[[ClassFactory getInstance] getInfoHUD] showHud:errorMessage];
                }
            }
            
            
        }
        else
        {
           
            /* 请求失败 */
            [[[ClassFactory getInstance] getNetComm] saveObject:nil Path:USER_LOGIN_KAY];
        }
        
        NSString *errorMessage = [NSString stringWithFormat:@"%@",[_requestResultDic objectForKey:@"errorMessage"]];
       
        STRING_NIL_TO_NONE(errorMessage);
        
//        [[[ClassFactory getInstance] getInfoHUD] showHud:errorMessage];
        
        if (success)
        {
            success(JSON);
        }
      [[[ClassFactory getInstance] getNetComm]loadingStop];
        
    } failure:^(NSError *error)
    {
       if (failure)
        {
            failure(error);
        }
        [[[ClassFactory getInstance] getNetComm]loadingStop];
        /* 请求失败 */
        [[[ClassFactory getInstance] getNetComm] saveObject:nil Path:USER_LOGIN_KAY];
    } isRefresh:YES];
}

/**
 *	@brief	验证登录信息
 *
 *	@param 	info 	用户信息
 *
 *	@return
 */
- (BOOL)checkLoginInfo:(NSDictionary *)info
{
    NSString *userName = [NSString stringWithFormat:@"%@",[info objectForKey:USERNAME_KEY]];
    STRING_NIL_TO_NONE(userName);
    
    NSString *password = [NSString stringWithFormat:@"%@",[info objectForKey:USERPASS_KEY]];
    STRING_NIL_TO_NONE(password);
    
    if (ISNOTNILSTR(userName) && ISNOTNILSTR(password))
    {
        return YES;
    }
    else
    {
        if (STRING_ISNIL(userName))
        {

            [[[ClassFactory getInstance] getInfoHUD] showHud:@"请输入用户名"];
            return NO;
        }
        else if (STRING_ISNIL(password))
        {

            [[[ClassFactory getInstance] getInfoHUD] showHud:@"请输入密码"];
            return NO;
        }
        else
        {
            return NO;
        }
    }
    return NO;
}

@end

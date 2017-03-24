//
//  RegisterInfoViewController.h
//  IOSFramework
//
//  Created by xu on 16/3/22.
//
//

#import <UIKit/UIKit.h>
//#import "IQKeyboardReturnKeyHandler.h"

@interface RegisterInfoViewController : UIViewController<MBProgressHUDDelegate,UITextFieldDelegate> 

@property (nonatomic,strong) UIButton * backBtn;

@property (nonatomic,strong) NSString * phoneNum;

@property (nonatomic,strong) NSString * customerId;
@property (nonatomic,strong) UITextField *nickNameField;
@property (nonatomic,strong) UITextField *realNameField;
@property (nonatomic,strong) UITextField *idNumField;
@property (nonatomic,strong) UITextField *agentNumField;
@property (nonatomic,strong) UITextField *emailField;
@property (nonatomic,strong) UITextField *adressField;
@property (nonatomic,strong) UITextField *exchangePwdField;//兑换密码
@property (nonatomic,strong) UITextField *conPwdField;//确认密码

@property (nonatomic,strong) NSString * password;
//@property (nonatomic, strong) IQKeyboardReturnKeyHandler    *returnKeyHandler;

@end

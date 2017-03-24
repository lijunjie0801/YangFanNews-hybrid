//
//  LoginViewControllers.m
//  IOSFramework
//
//  Created by xu on 16/4/13.
//
//

#import "MYLoginViewControllers.h"
#import "CYRootTabViewController.h"
#import "AppDelegate.h"
#import "RegisterViewControllers.h"
#import "RegisterInfoViewController.h"
#import "BackPasswordController.h"
//#import "CY_NetAPIManager.h"
//#import "CYDotNetAPIClient.h"
#import "ZipArchive.h"
#import "Check.h"
#define kLoginStatus @"login_status"



@interface MYLoginViewControllers ()<UIAlertViewDelegate>
@property (nonatomic,strong) UITextField *phoneNumText;
@property (nonatomic,strong) UITextField *passwordText;
@property (nonatomic,strong) UIAlertView *alertView;
@end

@implementation MYLoginViewControllers

- (void)viewDidLoad {
    [super viewDidLoad];
    defaults = [NSUserDefaults standardUserDefaults];
//    if (!loginModel)
//    {
//        loginModel = [[LoginModel alloc] init];
//    }
    if (!loginDic)
    {
        loginDic = [NSMutableDictionary dictionary];
    }
    NSLog(@"66666666");
    [self.view setBackgroundColor:[UIColor colorWithHexString:@"f7f1ee"]];
    [self setLoginUI];
    // Do any additional setup after loading the view.
}
#pragma mark -  登录界面
-(void)setLoginUI{
    UIImageView *logoImageView = [[UIImageView alloc]init];
    logoImageView.image = [UIImage imageNamed:@"ying"];
    [self.view addSubview:logoImageView];
    [logoImageView autoSetDimensionsToSize:CGSizeMake(100, 100)];
    [logoImageView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:40];
    [logoImageView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:(kScreen_Width-100)/2];
    
    UILabel *appNameLabel = [[UILabel alloc]init];
    appNameLabel.text = @"e 行 销";
    appNameLabel.font =[UIFont fontWithName:@"Helvetica-Bold" size:26];
    appNameLabel.textColor = [UIColor colorWithHexString:@"216ca6"];
    appNameLabel.adjustsFontSizeToFitWidth = YES;
    [self.view addSubview:appNameLabel];
    CGSize size = [appNameLabel.text sizeWithFont:[UIFont systemFontOfSize:26]];
    [appNameLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:logoImageView withOffset:15];
    [appNameLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:(kScreen_Width - size.width)/2];
    
    
    /*账号框*/
    UITextField *phoneNumText = [[UITextField alloc]init];
    [self.view addSubview:phoneNumText];
    phoneNumText.backgroundColor = [UIColor whiteColor];
    phoneNumText.keyboardType = UIKeyboardTypeNumberPad;
    self.phoneNumText = phoneNumText;

    phoneNumText.placeholder = @"请输入用户名";
    UIView *phoneLeftView = [[UIView alloc]init];
    phoneLeftView.size = CGSizeMake(70, 50);
    UIImageView *phoneImage = [[UIImageView alloc]init];
    phoneImage.size = CGSizeMake(18, 25);
    phoneImage.center = phoneLeftView.center;
    phoneImage.image = [UIImage imageNamed:@"user"];
    [phoneLeftView addSubview:phoneImage];
    phoneNumText.leftView = phoneLeftView;
    phoneNumText.leftViewMode = UITextFieldViewModeAlways;
    phoneNumText.delegate = self;
    [phoneNumText autoSetDimensionsToSize:CGSizeMake(0, 50)];
    [phoneNumText autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0];
    [phoneNumText autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:0];
    [phoneNumText autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:appNameLabel withOffset:25];
    /*分割线*/
    UIView *spearView = [[UIView alloc]init];
    [self.view addSubview:spearView];
    [spearView setBackgroundColor:[UIColor colorWithHexString:@"f7f1ee"]];
    [spearView autoSetDimensionsToSize:CGSizeMake(0, 1)];
    [spearView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0];
    [spearView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:0];
    [spearView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:phoneNumText withOffset:0];
    
    /*密码框*/
    UITextField *passwordText = [[UITextField alloc]init];
    passwordText.secureTextEntry = YES;
    [self.view addSubview:passwordText];
    passwordText.backgroundColor = [UIColor whiteColor];
    passwordText.placeholder = @"请输入密码";
    self.passwordText = passwordText;
    UIView *passLeftView = [[UIView alloc]init];
    passLeftView.size = CGSizeMake(70, 50);
    UIImageView *passImage = [[UIImageView alloc]init];
    passImage.size = CGSizeMake(18, 25);
    passImage.center = passLeftView.center;
    passImage.image = [UIImage imageNamed:@"password"];
    [passLeftView addSubview:passImage];
    passwordText.leftView = passLeftView;
    passwordText.leftViewMode = UITextFieldViewModeAlways;
    passwordText.delegate = self;
    [passwordText autoSetDimensionsToSize:CGSizeMake(0, 50)];
    [passwordText autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0];
    [passwordText autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:0];
    [passwordText autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:spearView withOffset:0];
    /*登录按钮*/
    UIButton *loginBtn = [[UIButton alloc]init];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [loginBtn setBackgroundColor:[UIColor colorWithHexString:@"ed6d2a"]];
    [self.view addSubview:loginBtn];
    [loginBtn addTarget:self action:@selector(loginClick) forControlEvents:UIControlEventTouchUpInside];
    [loginBtn autoSetDimensionsToSize:CGSizeMake(0, 40)];
    [loginBtn autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:10];
    [loginBtn autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:10];
    [loginBtn autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:passwordText withOffset:30];
    /*注册*/
    UIButton *registerBtn = [[UIButton alloc]init];
    [registerBtn setTitle:@"注册" forState:UIControlStateNormal];
    [registerBtn setTitleColor:[UIColor colorWithHexString:@"216ca6"] forState:UIControlStateNormal];
    registerBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:registerBtn];
    [registerBtn addTarget:self action:@selector(registerClick) forControlEvents:UIControlEventTouchUpInside];
    [registerBtn autoSetDimensionsToSize:CGSizeMake(30, 20)];
    [registerBtn autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
    [registerBtn autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:loginBtn withOffset:10];
    /*找回密码*/
    UIButton *backPasswordBtn = [[UIButton alloc]init];
    [backPasswordBtn setTitle:@"忘记密码?" forState:UIControlStateNormal];
    [backPasswordBtn setTitleColor:[UIColor colorWithHexString:@"216ca6"] forState:UIControlStateNormal];
    backPasswordBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:backPasswordBtn];
    [backPasswordBtn addTarget:self action:@selector(backPasswordClick) forControlEvents:UIControlEventTouchUpInside];
    [backPasswordBtn autoSetDimensionsToSize:CGSizeMake(80, 20)];
    [backPasswordBtn autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:10];
    [backPasswordBtn autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:loginBtn withOffset:10];
    
    /*第三方登录*/
//    UIView *leftLine = [[UIView alloc]init];
//    [leftLine setBackgroundColor:[UIColor colorWithHexString:@"666666"]];
//    [self.view addSubview:leftLine];
//    [leftLine autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0];
//    [leftLine autoSetDimensionsToSize:CGSizeMake(100, 0.5)];
//    [leftLine autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:backPasswordBtn withOffset:50];
//    
//    UIView *rightLine = [[UIView alloc]init];
//    [rightLine setBackgroundColor:[UIColor colorWithHexString:@"666666"]];
//    [self.view addSubview:rightLine];
//    [rightLine autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:0];
//    [rightLine autoSetDimensionsToSize:CGSizeMake(100, 0.5)];
//    [rightLine autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:backPasswordBtn withOffset:50];
//    
//    UILabel *thirdPartyLabel = [[UILabel alloc]init];
//    thirdPartyLabel.text = @"第三方帐号登录";
//    thirdPartyLabel.textColor = [UIColor colorWithHexString:@"666666"];
//    thirdPartyLabel.font = [UIFont systemFontOfSize:14];
//    thirdPartyLabel.adjustsFontSizeToFitWidth = YES;
//    [self.view addSubview:thirdPartyLabel];
//    //    CGSize sizeT = [thirdPartyLabel.text sizeWithFont:[UIFont systemFontOfSize:14]];
//    NSDictionary* attributes = @{NSFontAttributeName : [UIFont systemFontOfSize:14]};
//    CGSize sizeT = [thirdPartyLabel.text sizeWithAttributes:attributes];
//    [thirdPartyLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:backPasswordBtn withOffset:40];
//    [thirdPartyLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:(kScreen_Width - sizeT.width)/2];
//    
//    UIButton *weChatBtn = [[UIButton alloc]init];
//    [weChatBtn setImage:[UIImage imageNamed:@"wechat"] forState:UIControlStateNormal];
//    [self.view addSubview:weChatBtn];
//    [weChatBtn autoSetDimensionsToSize:CGSizeMake(40, 40)];
//    [weChatBtn autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:thirdPartyLabel withOffset:15];
//    [weChatBtn autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:90];
//    
//    UIButton *alipayBtn = [[UIButton alloc]init];
//    [alipayBtn setImage:[UIImage imageNamed:@"alipay"] forState:UIControlStateNormal];
//    [self.view addSubview:alipayBtn];
//    [alipayBtn autoSetDimensionsToSize:CGSizeMake(40, 40)];
//    [alipayBtn autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:thirdPartyLabel withOffset:15];
//    [alipayBtn autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:90];
//    
    /*隐藏键盘*/
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyboardHide:)];
    //设置成NO表示当前控件响应后会传播到其他控件上，默认为YES。
    tapGestureRecognizer.cancelsTouchesInView = NO;
    //将触摸事件添加到当前view
    [self.view addGestureRecognizer:tapGestureRecognizer];
    
    //设置状态栏背景颜色
    UIView *stateView = [[UIView alloc]initWithFrame:[UIApplication sharedApplication].statusBarFrame];
    [stateView setBackgroundColor:[UIColor colorWithHexString:@"216ca6"]];
    [self.view addSubview:stateView];
}
#pragma mark -  处理点击登录按钮
-(void)loginClick{
    //判断是否为空
    if ([self.phoneNumText.text isEqualToString:@""]) {
        showAlert(@"请输入用户名");
        return;
    }
    if (![Check checkMobileNumber:self.phoneNumText.text]) {
        showAlert(@"用户名输入有误");
        return;
    }
    else if ([self.passwordText.text isEqualToString:@""]){
        showAlert(@"请输入密码");
        return;
    }

    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    NSDictionary *dic = @{@"channelType":@"1",
                          @"requestService":@"login",
                          @"requestObject":@{
                                  @"name":self.phoneNumText.text,
                                  @"password":self.passwordText.text,
                                  @"mobile":self.phoneNumText.text
                                  }};
//    [[CY_NetAPIManager sharedManager]request_getLoginResult:dic andBlock:^(id data, NSError *error) {
//        
//        [MBProgressHUD hideHUDForView:self.view animated:YES];
//        
//        if (data == nil) {
//            return ;
//        }
//        NSDictionary *dic = data[@"responseObject"];
//        NSString *firCode = data[@"resultCode"];
//        NSString *firMessage = data[@"resultMessage"];
//        NSDictionary *infoDic = dic[@"userInfo"];
//        NSString *customerId = [NSString stringWithFormat:@"%@",infoDic[@"customerId"]];
//        NSString *returnMessage = dic[@"resultMessage"];
//        NSString *resultCode = dic[@"resultCode"];
//        NSString *idNO = infoDic[@"idNo"];
//        
//         NSString *cityName = infoDic[@"cityName"];
//        
//        [[NSUserDefaults standardUserDefaults]setObject:idNO forKey:@"id"];
//        [[NSUserDefaults standardUserDefaults]setObject:cityName forKey:@"cityName"];
//        [[NSUserDefaults standardUserDefaults]synchronize];
// //       NSString *userId = infoDic[@"oldId"];
//        _flag = infoDic[@"flag"];
// 
//            
//  //          NSDictionary *info = [NSDictionary
////                                  dictionaryWithObjectsAndKeys:
////                                  self.phoneNumText.text,USERNAME_KEY,
////                                  self.passwordText.text,USERPASS_KEY,
////                                  nil];
////           
//        
//            
//            
//            if ([firCode isEqualToString:@"1"]) {
//                showAlert(firMessage);
//            }else{
//                if ([resultCode isEqualToString:@"0"] && !(infoDic[@"idNo"] == nil)) {
//                        [[NSUserDefaults standardUserDefaults]setObject:[NSNumber numberWithInt:2] forKey:kLoginStatus];
//                        [[NSUserDefaults standardUserDefaults]setObject:_flag forKey:@"flag"];
//                        CYRootTabViewController *rootVC = [[CYRootTabViewController alloc] init];
////                        rootVC.flag =  _flag;
//                        AppDelegate * app = (AppDelegate*)[[UIApplication sharedApplication] delegate] ;
//                        [app.window setRootViewController:rootVC];
//                    
//                }else{
//                    if ([resultCode isEqualToString:@"010021"])
//                    {
//                        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"提示" message:@"该手机号不存在，是否注册?" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
//                        self.alertView=alert;
//                        [alert show];
//                    }
//                    else if ([resultCode isEqualToString:@"010022"]){
//                        showAlert(returnMessage);
//                        return;
//                        
//                    }else  if (([infoDic objectForKey:@"idNo"] == nil)||[[infoDic objectForKey:@"idNo"] isEqualToString:@""]) {
//                        RegisterInfoViewController * registerInfoVC = [[RegisterInfoViewController alloc] init];
//                        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:registerInfoVC];
//                        registerInfoVC.phoneNum = self.phoneNumText.text;
//                        registerInfoVC.customerId = customerId;
////                        registerInfoVC.password = self.passwordText.text;
//                        [self presentViewController:nav animated:YES completion:nil];
//                        return;
//                    }else{
//                        showAlert(returnMessage);
//                    }
//                    return;
//                }
//            }
//        
//    }];
}


#pragma mark -  快速注册
-(void)registerClick{
    RegisterViewControllers *registerController = [[RegisterViewControllers alloc]init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:registerController];
    
    [self presentViewController:nav animated:YES completion:nil];
}
#pragma mark -  找回密码
-(void)backPasswordClick{
    BackPasswordController *backPasswordController = [[BackPasswordController alloc]init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:backPasswordController];
    [self presentViewController:nav animated:YES completion:nil];
}
-(void)keyboardHide:(UITapGestureRecognizer*)tap{
    [self.view endEditing:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField == self.self.phoneNumText) {
        if (string.length == 0)
            return YES;
        NSInteger existedLength = textField.text.length;
        NSInteger selectedLength = range.length;
        NSInteger replaceLength = string.length;
        if (existedLength - selectedLength + replaceLength > 11) {
            return NO;
        }
    }
    return YES;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self animateTextField: textField up: YES];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [self animateTextField: textField up: NO];
}

- (void) animateTextField: (UITextField*) textField up: (BOOL) up
{
    const int movementDistance = 80; // tweak as needed
    const float movementDuration = 0.3f; // tweak as needed
    
    int movement = (up ? -movementDistance : movementDistance);
    
    [UIView beginAnimations: @"anim" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
    [UIView commitAnimations];
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex==1) {
        RegisterViewControllers *registerController = [[RegisterViewControllers alloc]init];
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:registerController];
        [self presentViewController:nav animated:YES completion:nil];
    }
}
-(void)viewWillDisappear:(BOOL)animated
{
    
    [self.alertView removeFromSuperview];
   
}



@end

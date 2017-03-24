//
//  RegisterViewControllers.m
//  IOSFramework
//
//  Created by xu on 16/4/20.
//
//

#import "RegisterViewControllers.h"
#import "RegisterInfoViewController.h"
#import "DTCustomWebViewController.h"
//#import "CY_NetAPIManager.h"
#import "CYRootTabViewController.h"
#import "AppDelegate.h"
#import "Check.h"
@interface RegisterViewControllers ()
@property (nonatomic,strong) UITextField *phoneField;
@property (nonatomic,strong) UITextField *passwordField;
@property (nonatomic,strong) NSString *verificationCode;
@property (nonatomic,strong) UITextField *verificationField;
@property (nonatomic,strong) UITextField *recommendField;
@property (nonatomic,strong) UITextField *idTextf;
@property (nonatomic,strong) UIButton *cityBtn;
@property (nonatomic,strong) NSString *cityCodeStr;
@end

@implementation RegisterViewControllers

-(void)viewDidLoad{
    [super viewDidLoad];
    self.title = @"在线注册";
    [self.view setBackgroundColor:[UIColor colorWithHexString:@"f7f1ee"]];
    //    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.backBtn];
    [self setRegisterUI];
}
#pragma 注册界面布局
-(void)setRegisterUI{
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(cityDic:) name:@"cityDic" object:nil];
    
    UIView *backView = [[UIView alloc]init];
    [backView autoSetDimensionsToSize:CGSizeMake(0, 230)];
    [backView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:backView];
    [backView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0];
    [backView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:0];
    [backView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:20];
    
    /*手机号*/
    UILabel *phoneLabel = [[UILabel alloc]init];
    phoneLabel.text = @"手机号";
    phoneLabel.textColor = [UIColor blackColor];
    phoneLabel.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:phoneLabel];
    [phoneLabel autoSetDimensionsToSize:CGSizeMake(60, 20)];
    [phoneLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:5];
    [phoneLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:25];
    
    UITextField *phoneField = [[UITextField alloc]init];
    phoneField.keyboardType = UIKeyboardTypeNumberPad;
    phoneField.placeholder = @"请填写手机号";
    self.phoneField = phoneField;
    phoneField.delegate= self;
    [self.view addSubview:phoneField];
    [phoneField autoSetDimensionsToSize:CGSizeMake(60, 20)];
    [phoneField autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:25];
    [phoneField autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:phoneLabel withOffset:20];
    [phoneField autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:5];
    
    /*分割线*/
    UIImageView *spearOne = [[UIImageView alloc]init];
    [spearOne setBackgroundColor:[UIColor colorWithHexString:@"f7f1ee"]];
    [self.view addSubview:spearOne];
    [spearOne autoSetDimensionsToSize:CGSizeMake(0, 1)];
    [spearOne autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0];
    [spearOne autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:0];
    [spearOne autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:phoneLabel withOffset:10];
    
    /*密码*/
    UILabel *passwordLabel = [[UILabel alloc]init];
    passwordLabel.text = @"密码";
    passwordLabel.textColor = [UIColor blackColor];
    passwordLabel.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:passwordLabel];
    [passwordLabel autoSetDimensionsToSize:CGSizeMake(60, 20)];
    [passwordLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:5];
    [passwordLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:spearOne withOffset:10];
    
    UITextField *passwordField = [[UITextField alloc]init];
    passwordField.placeholder = @"请填写密码";
    self.passwordField = passwordField;
    passwordField.secureTextEntry = YES;
    [self.view addSubview:passwordField];
    [passwordField autoSetDimensionsToSize:CGSizeMake(60, 20)];
    [passwordField autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:spearOne withOffset:10];
    [passwordField autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:passwordLabel withOffset:20];
    [passwordField autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:5];
    
    /*分割线*/
    UIImageView *spearTwo = [[UIImageView alloc]init];
    [spearTwo setBackgroundColor:[UIColor colorWithHexString:@"f7f1ee"]];
    [self.view addSubview:spearTwo];
    [spearTwo autoSetDimensionsToSize:CGSizeMake(0, 1)];
    [spearTwo autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0];
    [spearTwo autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:0];
    [spearTwo autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:passwordLabel withOffset:10];
    
    /*验证码*/
    UILabel *verificationLabel = [[UILabel alloc]init];
    verificationLabel.text = @"验证码";
    verificationLabel.textColor = [UIColor blackColor];
    verificationLabel.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:verificationLabel];
    [verificationLabel autoSetDimensionsToSize:CGSizeMake(60, 20)];
    [verificationLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:5];
    [verificationLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:spearTwo withOffset:10];
    
    UITextField *verificationField = [[UITextField alloc]init];
    verificationField.keyboardType = UIKeyboardTypeNumberPad;
    verificationField.placeholder = @"验证码";
    self.verificationField = verificationField;
    [self.view addSubview:verificationField];
    [verificationField autoSetDimensionsToSize:CGSizeMake(60, 20)];
    [verificationField autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:verificationLabel withOffset:20];
    [verificationField autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:spearTwo withOffset:10];
    
    UIButton *verficationBtn = [[UIButton alloc]init];
    [verficationBtn setTitle:@"发送验证码" forState:UIControlStateNormal];
    [verficationBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    verficationBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [verficationBtn setBackgroundColor:[UIColor colorWithHexString:@"ed6d2a"]];
    [verficationBtn addTarget:self action:@selector(getVerificationClick:) forControlEvents:UIControlEventTouchUpInside];
    verficationBtn.layer.cornerRadius = 5;
    [self.view addSubview:verficationBtn];
    [verficationBtn autoSetDimensionsToSize:CGSizeMake(120, 30)];
    [verficationBtn autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:100];
    [verficationBtn autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:10];
    [verficationBtn autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
    
    /*分割线*/
    UIImageView *spearThree = [[UIImageView alloc]init];
    [spearThree setBackgroundColor:[UIColor colorWithHexString:@"f7f1ee"]];
    [self.view addSubview:spearThree];
    [spearThree autoSetDimensionsToSize:CGSizeMake(0, 1)];
    [spearThree autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0];
    [spearThree autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:0];
    [spearThree autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:verificationLabel withOffset:10];
    
    /*所在城市*/
    UILabel *cityLabel = [[UILabel alloc]init];
    cityLabel.text = @"所在城市";
    cityLabel.textColor = [UIColor blackColor];
    cityLabel.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:cityLabel];
    [cityLabel autoSetDimensionsToSize:CGSizeMake(60, 20)];
    [cityLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:5];
    [cityLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:spearThree withOffset:10];
    
    
    UIButton *cityBtn = [[UIButton alloc]init];
    self.cityBtn = cityBtn;
    [cityBtn setTitle:@"请输入所在城市" forState:UIControlStateNormal];
    [cityBtn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    self.cityBtn.titleLabel.font=[UIFont systemFontOfSize:17];
    [cityBtn setTitleColor:[UIColor colorWithRed:198/255.0 green:198/255.0 blue:204/255.0 alpha:1.0] forState:UIControlStateNormal];
    [cityBtn addTarget:self action:@selector(selectInputView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:cityBtn];
    [cityBtn autoSetDimensionsToSize:CGSizeMake(60, 20)];
    [cityBtn autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:cityLabel withOffset:20];
    [cityBtn autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:5];
    [cityBtn autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:spearThree withOffset:10];
    
    
    UIButton *leftMenuBtn = [[UIButton alloc]init];
    [leftMenuBtn setBackgroundImage:[UIImage imageNamed:@"arrow-right.png"] forState:UIControlStateNormal];
    [self.view addSubview:leftMenuBtn];
    [leftMenuBtn autoSetDimensionsToSize:CGSizeMake(8, 15)];
    [leftMenuBtn autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:145];
    [leftMenuBtn autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:10];
    [leftMenuBtn autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
    
    
    
    /*分割线*/
    UIImageView *spearFour = [[UIImageView alloc]init];
    [spearFour setBackgroundColor:[UIColor colorWithHexString:@"f7f1ee"]];
    [self.view addSubview:spearFour];
    [spearFour autoSetDimensionsToSize:CGSizeMake(0, 1)];
    [spearFour autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0];
    [spearFour autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:0];
    [spearFour autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:cityLabel withOffset:10];
    
    
    
    
    
    /*身份证号*/
    UILabel *idNum = [[UILabel alloc]init];
    idNum.text = @"身份证号";
    idNum.textColor = [UIColor blackColor];
    idNum.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:idNum];
    [idNum autoSetDimensionsToSize:CGSizeMake(60, 20)];
    [idNum autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:5];
    [idNum autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:spearFour withOffset:10];
    
    UITextField *idTextf = [[UITextField alloc]init];
    idTextf.keyboardType = UIKeyboardTypeNumberPad;
    idTextf.placeholder = @"请填写身份证号";
    self.idTextf=idTextf;
    [self.view addSubview:idTextf];
    [idTextf autoSetDimensionsToSize:CGSizeMake(60, 20)];
    [idTextf autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:idNum withOffset:20];
    [idTextf autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:spearFour withOffset:10];
    [idTextf autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:5];
    


    /*分割线*/
    UIImageView *spearFive = [[UIImageView alloc]init];
    [spearFive setBackgroundColor:[UIColor colorWithHexString:@"f7f1ee"]];
    [self.view addSubview:spearFive];
    [spearFive autoSetDimension:ALDimensionHeight toSize:1];
//        [spearFive autoSetDimensionsToSize:CGSizeMake(0, 1)];
    [spearFive autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0];
    [spearFive autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:0];
    [spearFive autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:idNum withOffset:10];

    /*推荐人*/
    UILabel *recommendLabel = [[UILabel alloc]init];
    recommendLabel.text = @"推荐人";
    recommendLabel.font = [UIFont systemFontOfSize:16];
    recommendLabel.textColor = [UIColor blackColor];
    [self.view addSubview:recommendLabel];
    [recommendLabel autoSetDimensionsToSize:CGSizeMake(60, 20)];
    [recommendLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:5];
    [recommendLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:spearFive withOffset:10];
    
    UITextField *recommendField = [[UITextField alloc]init];
    recommendField.keyboardType = UIKeyboardTypeNumberPad;
    recommendField.placeholder = @"请填写推荐人手机号";
    self.recommendField = recommendField;
    [self.view addSubview:recommendField];
    [recommendField autoSetDimensionsToSize:CGSizeMake(60, 20)];
    [recommendField autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:recommendLabel withOffset:20];
    [recommendField autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:spearFive withOffset:10];
    [recommendField autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:5];
    
    /*注册按钮*/
    UIButton *nextBtn = [[UIButton alloc]init];
    [nextBtn setTitle:@"立即注册" forState:UIControlStateNormal];
    [nextBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [nextBtn setBackgroundColor:[UIColor colorWithHexString:@"ed6d2a"]];
    [nextBtn addTarget:self action:@selector(nextBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nextBtn];
    [nextBtn autoSetDimensionsToSize:CGSizeMake(0, 40)];
    [nextBtn autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:10];
    [nextBtn autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:10];
    [nextBtn autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:recommendField withOffset:30];
    
    
    /*隐藏键盘*/
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyboardHide:)];
    //设置成NO表示当前控件响应后会传播到其他控件上，默认为YES。
    tapGestureRecognizer.cancelsTouchesInView = NO;
    //将触摸事件添加到当前view
    [self.view addGestureRecognizer:tapGestureRecognizer];
}
#pragma 获取验证码
//-(void)getVerificationClick:(UIButton *)sender{
//    sender.userInteractionEnabled=NO;
//    if (![Check checkMobileNumber:self.phoneField.text]) {
//        showAlert(@"手机号输入有误");
//        sender.userInteractionEnabled=YES;
//        return;
//    }
//    
//    
//    NSDictionary *dic = @{@"channelType":@"1",
//                          @"requestService":@"sendValidateCode",
//                          @"requestObject":@{
//                                  @"operateType":@"1",
//                                  @"operateCode":self.phoneField.text,
//                                  @"mobile":self.phoneField.text
//                                  }};
//    [[CY_NetAPIManager sharedManager] request_getVerificationCode:dic andBlock:^(id data, NSError *error) {
//        NSDictionary *getDic = data[@"responseObject"];
//        NSString *firstCode = data[@"resultCode"];
//        NSString *firstMessage = data[@"resultMessage"];
//        NSString *verificationCode = getDic[@"verificationCode"];
//        NSString *resultMessage = getDic[@"resultMessage"];
//        if ([firstCode isEqualToString:@"1"]) {
//            if (firstMessage==NULL||firstMessage==nil) {
//                showAlert(@"系统异常");
//            }else{
//                showAlert(firstMessage);
//            }
//            sender.userInteractionEnabled=YES;
//        }
//        if (verificationCode==NULL||verificationCode==nil) {
//            showAlert(resultMessage);
//            sender.userInteractionEnabled=YES;
//        }else{
//            NSLog(@"验证码%@",verificationCode);
//            self.verificationCode = verificationCode;
//            //倒计时
//            __block int timeout=60; //倒计时时间
//            dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//            dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
//            dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
//            dispatch_source_set_event_handler(_timer, ^{
//                if(timeout<=0){ //倒计时结束，关闭
//                    dispatch_source_cancel(_timer);
//                    dispatch_async(dispatch_get_main_queue(), ^{
//                        //设置界面的按钮显示 根据自己需求设置
//                        [sender setTitle:@"发送验证码" forState:UIControlStateNormal];
//                        sender.userInteractionEnabled = YES;
//                    });
//                }else{
//                    //int seconds = timeout % 60;
//                    int seconds = timeout;
//                    NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
//                    dispatch_async(dispatch_get_main_queue(), ^{
//                        //设置界面的按钮显示 根据自己需求设置
//                        //NSLog(@"____%@",strTime);
//                        [UIView beginAnimations:nil context:nil];
//                        [UIView setAnimationDuration:1];
//                        [sender setTitle:[NSString stringWithFormat:@"%@秒后重新发送",strTime] forState:UIControlStateNormal];
//                        [UIView commitAnimations];
//                        sender.userInteractionEnabled = NO;
//                    });
//                    timeout--;
//                }
//            });
//            dispatch_resume(_timer);
//            
//        }
//    }];
//    //    6
//    
//}
//#pragma 注册
//-(void)nextBtnClick{
//    if ([self.phoneField.text isEqualToString:@""]) {
//        showAlert(@"请输入手机号");
//        return;
//    }else if ([self.passwordField.text isEqualToString:@""]){
//        showAlert(@"请输入密码");
//        return;
//    }
//    else if (self.cityBtn.titleLabel.text.length==0){
//        showAlert(@"请输入所在城市");
//        return;
//    }
//    else if (![self.verificationCode isEqualToString:self.verificationField.text]){
//        showAlert(@"验证码错误");
//        return;
//    }
//    else if ([self.idTextf.text isEqualToString:@""]){
//            showAlert(@"请输入身份证号");
//            return;
//    }
//    else if(![Check checkIDCard:self.idTextf.text ] ){
//            showAlert(@"身份证号输入有误");
//            return;
//    }
//    BOOL isPassWord =YES;//= [Check judgePassWordLegal:self.passwordField.text];
//        if (!isPassWord) {
//            UIAlertController *alertView = [UIAlertController alertControllerWithTitle:@"提示" message:@"密码需要包含字母、数字至少六位" preferredStyle:UIAlertControllerStyleAlert];
//            UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
//            [alertView addAction:sureAction];
//            [self presentViewController:alertView animated:YES completion:nil];
//            return;
//        }
//        else if (self.recommendField.text.length>0){
//         if (![Check checkMobileNumber:self.recommendField.text]) {
//           showAlert(@"推荐人手机号输入有误");
//           return;
//        }
//   }
//    NSDictionary *dic = @{
//                          @"channelType":@"1",
//                          @"requestService": @"registerNew",
//                          @"requestObject": @{
//                                  @"password":self.passwordField.text,
//                                  @"idNo":self.idTextf.text,
//                                  @"mobile":self.phoneField.text,
//                                  @"customerName":self.phoneField.text,
//                                  @"validateObject" :@{
//                                          @"operateType":@"1",
//                                          @"operateCode":self.phoneField.text,
//                                          @"mobile":self.phoneField.text,
//                                          @"verificationCode":self.verificationField.text},
//                                  @"cityCode":self.cityCodeStr.length>0?self.cityCodeStr:@"",
//                                  @"provinceCode":@"",
//                                  @"isIgnoreReferee":@"0",
//                                  @"refereeId":self.recommendField.text,
//                                  }};
//    [[CY_NetAPIManager sharedManager]request_getRegisterResult:dic andBlock:^(id data, NSError *error) {
//        
//        NSDictionary *dic = data[@"responseObject"];
//        NSString *resultMessage = dic[@"resultMessage"];
//        NSDictionary *infoDic = dic[@"userInfo"];
//        NSString *customerId = [NSString stringWithFormat:@"%@",infoDic[@"customerId"]];
//        NSLog(@"打印出的customerId为%@",customerId);
//        NSString *code = dic[@"resultCode"];//010001用户名已存在x
//        NSLog(@"打印出的返回字段位%@",data);
//        RegisterInfoViewController * registerInfoVC = [[RegisterInfoViewController alloc] init];
//        if ([data[@"resultCode"] isEqualToString:@"1"]) {
//            showAlert(data[@"resultMessage"]);
//            return ;
//        }
//        if ([code isEqualToString:@"010003"])
//        {
//            UIAlertController *alertView = [UIAlertController alertControllerWithTitle:@"提示" message:resultMessage preferredStyle:UIAlertControllerStyleAlert];
//            [alertView addAction: [UIAlertAction actionWithTitle:@"是" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//                //点击按钮的响应事件；
//                [self againRegister];
//                [self.navigationController pushViewController:registerInfoVC animated:YES];
//            }
//                                   ]];
//            [alertView addAction: [UIAlertAction actionWithTitle:@"否" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//                //点击按钮的响应事件；
//                return;
//            }]];
//            [self presentViewController:alertView animated:YES completion:nil];
//        }else if (resultMessage == nil) {
//            registerInfoVC.phoneNum = self.phoneField.text;
//            registerInfoVC.customerId = customerId;
//            registerInfoVC.password = self.passwordField.text;
//            [self.navigationController pushViewController:registerInfoVC animated:YES];
//        }else{
//            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:resultMessage preferredStyle:UIAlertControllerStyleAlert];
//            [alertController addAction: [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//                if ([code isEqualToString:@"010001"]) {
//                    return;
//                }
//            }]];
//            [self presentViewController:alertController animated:YES completion:nil];
//        }
//    }];
//}
//-(void)againRegister
//{
//    NSDictionary *dic = @{
//                          @"channelType":@"1",
//                          @"requestService": @"registerNew",
//                          @"requestObject": @{
//                                  @"password":self.passwordField.text,
//                                  @"idNo":self.idTextf.text,
//                                  @"mobile":self.phoneField.text,
//                                  @"customerName":self.phoneField.text,
//                                  @"validateObject" :@{
//                                          @"operateType":@"1",
//                                          @"operateCode":self.phoneField.text,
//                                          @"mobile":self.phoneField.text,
//                                          @"verificationCode":self.verificationField.text},
//                                  @"cityCode":self.cityCodeStr.length>0?self.cityCodeStr:@"",
//                                  @"provinceCode":@"",
//                                  @"isIgnoreReferee":@"1",
//                                  @"refereeId":self.recommendField.text,
//                                  }};
//    [[CY_NetAPIManager sharedManager]request_getRegisterResult:dic andBlock:^(id data, NSError *error) {
//    }];
//}

-(void)keyboardHide:(UITapGestureRecognizer*)tap{
    [self.view endEditing:YES];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField == self.self.phoneField) {
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


-(void)cityDic:(NSNotification *)noti{
    NSString *cityName = [[noti userInfo] objectForKey:@"cityName"];
    //    NSDictionary *dic = [noti userInfo];
    self.cityCodeStr = [[noti userInfo] objectForKey:@"cityCode"];
    [self.cityBtn setTitle:cityName forState:UIControlStateNormal];
    self.cityBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [self.cityBtn setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
    [self.navigationController popToRootViewControllerAnimated:YES];
}
-(void)selectInputView
{
    NSString * URL = [NSString stringWithFormat:@"file://%@/index.html#/person/citySearch",Bundle2];
    DTCustomWebViewController * VC = [[DTCustomWebViewController alloc]initWithStartPage:URL];
    [self.navigationController pushViewController:VC animated:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
    [self.rdv_tabBarController setTabBarHidden:NO animated:NO];
}

- (UIButton *)backBtn
{
    if (!_backBtn) {
        _backBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 40)];
        [_backBtn setImage:[UIImage imageNamed:@"backIcon"] forState:UIControlStateNormal];
        _backBtn.titleLabel.font = [UIFont boldSystemFontOfSize:14];
        _backBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -28, 0, 0);
        _backBtn.titleEdgeInsets = UIEdgeInsetsMake(0, -28, 0, 0);
        [_backBtn addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backBtn;
}
-(void)goBack{
    //    [self.navigationController popViewControllerAnimated:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end

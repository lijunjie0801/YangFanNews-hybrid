//
//  BackPasswordController.m
//  IOSFramework
//
//  Created by 王刚 on 16/2/27.
//
//

#import "BackPasswordController.h"
#import "ResetPassWordController.h"

@implementation BackPasswordController
-(void)viewDidLoad{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithHexString:@"f7f1ee"]];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.backBtn];
    self.navigationItem.title = @"找回密码";
    [self setBackPasswordUI];
}
#pragma 找回密码界面
-(void)setBackPasswordUI{
    UIView *phoneView = [[UIView alloc]init];
    [phoneView autoSetDimensionsToSize:CGSizeMake(0, 50)];
    [phoneView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:phoneView];
    [phoneView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:10];
    [phoneView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:10];
    [phoneView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:20];
    /*手机号*/
    UILabel *phoneNumLabel = [[UILabel alloc]init];
    phoneNumLabel.text = @"手机号码";
    phoneNumLabel.font = [UIFont systemFontOfSize:16];
    [phoneView addSubview:phoneNumLabel];
    [phoneNumLabel autoSetDimensionsToSize:CGSizeMake(65, 50)];
    [phoneNumLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:10];
    [phoneNumLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:0];
    //    /*隔线*/
    //    UIImageView *phoneSpear = [[UIImageView alloc]init];
    //    [phoneSpear setBackgroundColor:[UIColor colorWithHexString:@"f4f4f4f4"]];
    //    [phoneView addSubview:phoneSpear];
    //    [phoneSpear autoSetDimensionsToSize:CGSizeMake(2, 0)];
    //    [phoneSpear autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:2];
    //    [phoneSpear autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:2];
    //    [phoneSpear autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:phoneNumLabel withOffset:20];
    /*手机号输入框*/
    UITextField *phoneNumField = [[UITextField alloc]init];
    phoneNumField.keyboardType = UIKeyboardTypeNumberPad;
    [phoneNumField setBackgroundColor:[UIColor whiteColor]];
    //   phoneNumField.placeholder = @"手机号码";
    self.phoneField = phoneNumField;
    [phoneView addSubview:phoneNumField];
    [phoneNumField autoSetDimensionsToSize:CGSizeMake(0, 40)];
    [phoneNumField autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:5];
    [phoneNumField autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:0];
    [phoneNumField autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:100];
    
    UIView *passWordView = [[UIView alloc]init];
    [passWordView autoSetDimensionsToSize:CGSizeMake(50, 50)];
    [passWordView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:passWordView];
    [passWordView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:10];
    [passWordView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:10];
    [passWordView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:71];
    
    /*验证码*/
    UILabel *changPassword = [[UILabel alloc]init];
    changPassword.text = @"验证码";
    changPassword.font = [UIFont systemFontOfSize:16];
    [passWordView addSubview:changPassword];
    [changPassword autoSetDimensionsToSize:CGSizeMake(65, 50)];
    [changPassword autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:10];
    [changPassword autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:0];
    //添加隔线
    //    UIImageView *passWordSpear = [[UIImageView alloc]init];
    //    [passWordSpear setBackgroundColor:[UIColor colorWithHexString:@"f4f4f4f4"]];
    //    [passWordView addSubview:passWordSpear];
    //    [passWordSpear autoSetDimensionsToSize:CGSizeMake(2, 0)];
    //    [passWordSpear autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:2];
    //    [passWordSpear autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:2];
    //    [passWordSpear autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:phoneNumLabel withOffset:20];
    
    /*验证码输入框*/
    UITextField *passWordField = [[UITextField alloc]init];
    [passWordField setBackgroundColor:[UIColor whiteColor]];
    passWordField.keyboardType = UIKeyboardTypeNumberPad;
    passWordField.placeholder = @"验证码";
    self.passwordField = passWordField;
    [passWordView addSubview:passWordField];
    [passWordField autoSetDimensionsToSize:CGSizeMake(0, 40)];
    [passWordField autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:5];
    [passWordField autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:0];
    [passWordField autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:100];
    
    UIButton *sendWordBtn = [[UIButton alloc]init];
    [sendWordBtn setTitle:@"发送验证码" forState:UIControlStateNormal];
    [sendWordBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    sendWordBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [sendWordBtn setBackgroundColor:[UIColor colorWithHexString:@"ed6d2a"]];
    [sendWordBtn addTarget:self action:@selector(sendWordBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    sendWordBtn.layer.cornerRadius = 5;
    [self.view addSubview:sendWordBtn];
    [sendWordBtn autoSetDimensionsToSize:CGSizeMake(0, 30)];
    [sendWordBtn autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:80];
    [sendWordBtn autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
    [sendWordBtn autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:190];
    
    /*下一步按钮*/
    UIButton *nextBtn = [[UIButton alloc]init];
    [nextBtn setTitle:@"下一步" forState:UIControlStateNormal];
    [nextBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [nextBtn setBackgroundColor:[UIColor colorWithHexString:@"ed6d2a"]];
    [nextBtn addTarget:self action:@selector(nextBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nextBtn];
    [nextBtn autoSetDimensionsToSize:CGSizeMake(0, 40)];
    [nextBtn autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:10];
    [nextBtn autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:10];
    [nextBtn autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:sendWordBtn withOffset:20];
    
}
#pragma 获取验证码
-(void)sendWordBtnClick:(UIButton *)sender{
    
//    if (![Check checkMobileNumber:self.phoneField.text]) {
//        showAlert(@"手机号输入有误");
//        return;
//    }
    //倒计时
    __block int timeout=60; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                [sender setTitle:@"发送验证码" forState:UIControlStateNormal];
                sender.userInteractionEnabled = YES;
            });
        }else{
            //int seconds = timeout % 60;
            int seconds = timeout;
            NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                //NSLog(@"____%@",strTime);
                [UIView beginAnimations:nil context:nil];
                [UIView setAnimationDuration:1];
                [sender setTitle:[NSString stringWithFormat:@"%@秒后重新发送",strTime] forState:UIControlStateNormal];
                [UIView commitAnimations];
                sender.userInteractionEnabled = NO;
            });
            timeout--;
        }
    });
    dispatch_resume(_timer);
    
    
    
    NSDictionary *dic = @{@"channelType":@"1",
                          @"requestService":@"sendValidateCode",
                          @"requestObject":@{
                                  @"operateType":@"2",
                                  @"operateCode":self.phoneField.text,
                                  @"mobile":self.phoneField.text
                                  }};
//    [[CY_NetAPIManager sharedManager] request_getVerificationCode:dic andBlock:^(id data, NSError *error) {
//        NSDictionary *getDic = data[@"responseObject"];
//        NSString *verificationCode = getDic[@"verificationCode"];
//        NSLog(@"验证码%@",verificationCode);
//        self.verificationCode = verificationCode;
//    }];
}
#pragma 下一步
-(void)nextBtnClick{
    if (self.verificationCode ==self.passwordField.text) {
        ResetPassWordController *resetPassWordVC = [[ResetPassWordController alloc] init];
        resetPassWordVC.phoneNumber = self.phoneField.text;
        resetPassWordVC.verificationCode = self.verificationCode;
        [self.navigationController pushViewController:resetPassWordVC animated:YES];
    }else{
        UIAlertController *alertView = [UIAlertController alertControllerWithTitle:@"提示" message:@"验证码输入不正确" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        [alertView addAction:sureAction];
        [self presentViewController:alertView animated:YES completion:nil];
        return;
    }
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
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end

//
//  RegisterInfoViewController.m
//  IOSFramework
//
//  Created by xu on 16/3/22.
//
//

#import "RegisterInfoViewController.h"
#import "MYLoginViewControllers.h"
#import "Check.h"
@interface RegisterInfoViewController ()

@end

@implementation RegisterInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.returnKeyHandler = [[IQKeyboardReturnKeyHandler alloc] initWithViewController:self];
//    self.returnKeyHandler.lastTextFieldReturnKeyType = UIReturnKeyDone;
//    self.returnKeyHandler.toolbarManageBehaviour = IQAutoToolbarBySubviews;
    [self.view setBackgroundColor:[UIColor colorWithHexString:@"f7f1ee"]];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.backBtn];
    self.navigationItem.title = @"个人信息";
    [self setRegisterInfoUI];
}
-(void)setRegisterInfoUI{
    UIView *backView = [[UIView alloc]init];
    [backView autoSetDimensionsToSize:CGSizeMake(0, 400)];
    [backView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:backView];
    [backView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0];
    [backView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:0];
    [backView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:18];
    
    /*昵 称*/
    UILabel *nickName = [[UILabel alloc]init];
    nickName.text = @"昵   称:";
    nickName.textColor = [UIColor blackColor];
    nickName.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:nickName];
    [nickName autoSetDimensionsToSize:CGSizeMake(80, 20)];
    [nickName autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:5];
    [nickName autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:25];
    
    UITextField *nickNameField = [[UITextField alloc]init];
//    nickNameField.keyboardType = UIKeyboardTypeNumberPad;
    self.nickNameField = nickNameField;
    [self.view addSubview:nickNameField];
    [nickNameField autoSetDimensionsToSize:CGSizeMake(60, 20)];
    [nickNameField autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:25];
    [nickNameField autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:5];
    [nickNameField autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:80];
    
    /*分割线*/
    UIImageView *spearOne = [[UIImageView alloc]init];
    [spearOne setBackgroundColor:[UIColor colorWithHexString:@"f7f1ee"]];
    [self.view addSubview:spearOne];
    [spearOne autoSetDimensionsToSize:CGSizeMake(0, 1)];
    [spearOne autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0];
    [spearOne autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:0];
    [spearOne autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:nickName withOffset:10];
    
    /*真实姓名*/
    UILabel *realName = [[UILabel alloc]init];
    realName.text = @"真实姓名:";
    realName.textColor = [UIColor blackColor];
    realName.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:realName];
    [realName autoSetDimensionsToSize:CGSizeMake(80, 20)];
    [realName autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:5];
    [realName autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:spearOne withOffset:10];
    
    UITextField *realNameField = [[UITextField alloc]init];
    self.realNameField = realNameField;
//    realNameField.secureTextEntry = YES;
    [self.view addSubview:realNameField];
    [realNameField autoSetDimensionsToSize:CGSizeMake(60, 20)];
    [realNameField autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:spearOne withOffset:10];
    [realNameField autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:0];
    [realNameField autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:80];
    /*分割线*/
    UIImageView *spearTwo = [[UIImageView alloc]init];
    [spearTwo setBackgroundColor:[UIColor colorWithHexString:@"f7f1ee"]];
    [self.view addSubview:spearTwo];
    [spearTwo autoSetDimensionsToSize:CGSizeMake(0, 1)];
    [spearTwo autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0];
    [spearTwo autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:0];
    [spearTwo autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:realName withOffset:10];
    
    /*身份证号*/
//    UILabel *idNum = [[UILabel alloc]init];
//    idNum.text = @"身份证号:";
//    idNum.textColor = [UIColor blackColor];
//    idNum.font = [UIFont systemFontOfSize:15];
//    [self.view addSubview:idNum];
//    [idNum autoSetDimensionsToSize:CGSizeMake(80, 20)];
//    [idNum autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:5];
//    [idNum autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:spearTwo withOffset:10];
    
//    UITextField *idNumField = [[UITextField alloc]init];
////    idNumField.keyboardType = UIKeyboardTypeNumberPad;
//    self.idNumField = idNumField;
//    [self.view addSubview:idNumField];
//    self.idNumField.delegate = self;
//    [idNumField autoSetDimensionsToSize:CGSizeMake(60, 20)];
//    [idNumField autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:spearTwo withOffset:10];
//    [idNumField autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:0];
//    [idNumField autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:80];
    
    /*分割线*/
//    UIImageView *spearThree = [[UIImageView alloc]init];
//    [spearThree setBackgroundColor:[UIColor colorWithHexString:@"f7f1ee"]];
//    [self.view addSubview:spearThree];
//    [spearThree autoSetDimensionsToSize:CGSizeMake(0, 1)];
//    [spearThree autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0];
//    [spearThree autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:0];
//    [spearThree autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:idNum withOffset:10];
    
    /*所在城市*/
    UILabel *agentNum = [[UILabel alloc]init];
    agentNum.text = @"资格证号:";
    agentNum.textColor = [UIColor blackColor];
    agentNum.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:agentNum];
    [agentNum autoSetDimensionsToSize:CGSizeMake(80, 20)];
    [agentNum autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:5];
    [agentNum autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:spearTwo withOffset:10];
    
    UITextField *agentNumField = [[UITextField alloc]init];
    self.agentNumField = agentNumField;
     self.agentNumField.delegate = self;
    [self.view addSubview:agentNumField];
    [agentNumField autoSetDimensionsToSize:CGSizeMake(60, 20)];
    [agentNumField autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:spearTwo withOffset:10];
    [agentNumField autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:0];
    [agentNumField autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:80];
    
    /*分割线*/
    UIImageView *spearFour = [[UIImageView alloc]init];
    [spearFour setBackgroundColor:[UIColor colorWithHexString:@"f7f1ee"]];
    [self.view addSubview:spearFour];
    [spearFour autoSetDimensionsToSize:CGSizeMake(0, 1)];
    [spearFour autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0];
    [spearFour autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:0];
    [spearFour autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:agentNum withOffset:10];
    
    /*推荐人*/
    UILabel *emailLabel = [[UILabel alloc]init];
    emailLabel.text = @"电子邮箱:";
    emailLabel.font = [UIFont systemFontOfSize:15];
    emailLabel.textColor = [UIColor blackColor];
    [self.view addSubview:emailLabel];
    [emailLabel autoSetDimensionsToSize:CGSizeMake(80, 20)];
    [emailLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:5];
    [emailLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:spearFour withOffset:10];
    
    UITextField *emailField = [[UITextField alloc]init];
//    emailField.keyboardType = UIKeyboardTypeNumberPad;
    self.emailField = emailField;
    self.emailField.delegate = self;
    [self.view addSubview:emailField];
    [emailField autoSetDimensionsToSize:CGSizeMake(60, 20)];
//    [emailField autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:emailLabel withOffset:20];
    [emailField autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:spearFour withOffset:10];
    [emailField autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:0];
    [emailField autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:80];
    
    UIImageView *spearFive = [[UIImageView alloc]init];
    [spearFive setBackgroundColor:[UIColor colorWithHexString:@"f7f1ee"]];
    [self.view addSubview:spearFive];
    [spearFive autoSetDimensionsToSize:CGSizeMake(0, 1)];
    [spearFive autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0];
    [spearFive autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:0];
    [spearFive autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:emailLabel withOffset:10];
    
    
    UILabel *adressLabel = [[UILabel alloc]init];
    adressLabel.text = @"用户地址:";
    adressLabel.textColor = [UIColor blackColor];
    adressLabel.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:adressLabel];
    [adressLabel autoSetDimensionsToSize:CGSizeMake(80, 20)];
    [adressLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:5];
    [adressLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:spearFive withOffset:10];
    
    UITextField *adressField = [[UITextField alloc]init];
    self.adressField = adressField;
    self.adressField.delegate = self;
    [self.view addSubview:adressField];
    [adressField autoSetDimensionsToSize:CGSizeMake(60, 20)];
//    [adressField autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:adressLabel withOffset:20];
    [adressField autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:spearFive withOffset:10];
    [adressField autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:0];
    [adressField autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:80];
    
    /*分割线*/
    UIImageView *spearSix = [[UIImageView alloc]init];
    [spearSix setBackgroundColor:[UIColor colorWithHexString:@"f7f1ee"]];
    [self.view addSubview:spearSix];
    [spearSix autoSetDimensionsToSize:CGSizeMake(0, 1)];
    [spearSix autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0];
    [spearSix autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:0];
    [spearSix autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:adressLabel withOffset:10];
    
    
    
    UILabel *exchangeLabel = [[UILabel alloc]init];
    exchangeLabel.text = @"兑换密码:";
    exchangeLabel.textColor = [UIColor blackColor];
    exchangeLabel.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:exchangeLabel];
    [exchangeLabel autoSetDimensionsToSize:CGSizeMake(80, 20)];
    [exchangeLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:5];
    [exchangeLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:spearSix withOffset:10];
    
    UITextField *exchangePwdField = [[UITextField alloc]init];
    self.exchangePwdField = exchangePwdField;
    self.exchangePwdField.delegate = self;
    exchangePwdField.secureTextEntry = YES;
    [self.view addSubview:exchangePwdField];
    [exchangePwdField autoSetDimensionsToSize:CGSizeMake(60, 20)];
//    [exchangePwdField autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:exchangeLabel withOffset:20];
    [exchangePwdField autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:0];
    [exchangePwdField autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:80];
    [exchangePwdField autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:spearSix withOffset:10];
    
    
    UIImageView *spearSeven = [[UIImageView alloc]init];
    [spearSeven setBackgroundColor:[UIColor colorWithHexString:@"f7f1ee"]];
    [self.view addSubview:spearSeven];
    [spearSeven autoSetDimensionsToSize:CGSizeMake(0, 1)];
    [spearSeven autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0];
    [spearSeven autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:0];
    [spearSeven autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:exchangeLabel withOffset:10];
    
    
    UILabel *conPwdLabel = [[UILabel alloc]init];
    conPwdLabel.text = @"确认密码:";
    conPwdLabel.textColor = [UIColor blackColor];
    conPwdLabel.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:conPwdLabel];
    [conPwdLabel autoSetDimensionsToSize:CGSizeMake(80, 20)];
    [conPwdLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:5];
    [conPwdLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:spearSeven withOffset:10];
    
    UITextField *conPwdField = [[UITextField alloc]init];
    conPwdField.secureTextEntry = YES;
    self.conPwdField = conPwdField;
    self.conPwdField.delegate = self;
    [self.view addSubview:conPwdField];
    [conPwdField autoSetDimensionsToSize:CGSizeMake(60, 20)];
//    [conPwdField autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:conPwdLabel withOffset:20];
    [conPwdField autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:spearSeven withOffset:10];
    [conPwdField autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:0];
    [conPwdField autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:80];
    
    UIImageView *spearEight = [[UIImageView alloc]init];
    [spearEight setBackgroundColor:[UIColor colorWithHexString:@"f7f1ee"]];
    [self.view addSubview:spearEight];
    [spearEight autoSetDimensionsToSize:CGSizeMake(0, 1)];
    [spearEight autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0];
    [spearEight autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:0];
    [spearEight autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:conPwdLabel withOffset:10];
    
    
    /*注册按钮*/
    UIButton *nextBtn = [[UIButton alloc]init];
    [nextBtn setTitle:@"保存" forState:UIControlStateNormal];
    [nextBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [nextBtn setBackgroundColor:[UIColor colorWithHexString:@"ed6d2a"]];
    [nextBtn addTarget:self action:@selector(starButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nextBtn];
    [nextBtn autoSetDimensionsToSize:CGSizeMake(0, 40)];
    [nextBtn autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:10];
    [nextBtn autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:10];
    [nextBtn autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:conPwdField withOffset:30];
    
    /*隐藏键盘*/
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyboardHide:)];
    //设置成NO表示当前控件响应后会传播到其他控件上，默认为YES。
    tapGestureRecognizer.cancelsTouchesInView = NO;
    //将触摸事件添加到当前view
    [self.view addGestureRecognizer:tapGestureRecognizer];
}
- (void)starButtonClicked
{
    //先将未到时间执行前的任务取消。
    [[self class] cancelPreviousPerformRequestsWithTarget:self selector:@selector(nextBtnClick) object:nil];
    [self performSelector:@selector(nextBtnClick) withObject:nil afterDelay:0.2f];
}
-(void)nextBtnClick{
    if ([self.nickNameField.text isEqualToString:@""]) {
        showAlert(@"请输入昵称");
        return;
    }
    else  if ([self.realNameField.text isEqualToString:@""]){
        showAlert(@"请输入真实姓名");
        return;
    }
//    else if ([self.idNumField.text isEqualToString:@""]){
//        showAlert(@"请输入身份证号");
//        return;
//    }
//    else if(![Check checkIDCard:self.idNumField.text ] ){
//        showAlert(@"身份证号输入有误");
//        return;
//    }
    else  if ([self.exchangePwdField.text isEqualToString:@""]){
        showAlert(@"请输入兑换密码");
        return;
    }
    else if (![self.exchangePwdField.text isEqualToString:self.conPwdField.text]){
        showAlert(@"两次密码输入不同");
        return;
    }
    
    
    NSDictionary *dic = @{@"channelType":@"1",
                          @"requestService":@"perfectInformationNew",
//                          @"customerId":self.customerId.length>0?self.customerId:@"",
                          @"requestObject":@{
                                  @"name":self.phoneNum.length>0?self.phoneNum:@"",
                                  @"nickName":self.nickNameField.text.length>0?self.nickNameField.text:@"",
                                  @"realName":self.realNameField.text.length>0?self.realNameField.text:@"",
//                                  @"idNo":self.idNumField.text.length>0?self.idNumField.text:@"",
                                  @"agentNo":self.agentNumField.text.length>0?self.agentNumField.text:@"",
                                  @"email":self.emailField.text.length>0?self.emailField.text:@"",
                                  @"address":self.adressField.text.length>0?self.adressField.text:@"",
                                  @"exchangePwd":self.exchangePwdField.text.length>0?self.exchangePwdField.text:@"",
                                  @"password":self.password.length>0?self.password:@"",
                                  }};
//    [[CY_NetAPIManager sharedManager]request_perfectInfo:dic andBlock:^(id data, NSError *error) {
//        NSDictionary *dic = data[@"responseObject"];
//        NSString *firstCode = data[@"resultCode"];
//        NSString *firsttMessage = data[@"resultMessage"];
//        NSString *resultMessage = dic[@"resultMessage"];
//        NSString *resultCode = dic[@"resultCode"];
//        if ([firstCode isEqualToString:@"0"]) {
//            if ([resultCode  isEqualToString:@"0"]) {
//                [self dismissViewControllerAnimated:YES completion:nil];
//            }
//            else{
//                showAlert(resultMessage);
//                return;
//            }
//        }else{
//            showAlert(firsttMessage);
//        }
//    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
    const int movementDistance = 100; // tweak as needed
    const float movementDuration = 0.3f; // tweak as needed
    
    int movement = (up ? -movementDistance : movementDistance);
    
    [UIView beginAnimations: @"anim" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
    [UIView commitAnimations];
}

-(void)keyboardHide:(UITapGestureRecognizer*)tap{
    [self.view endEditing:YES];
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

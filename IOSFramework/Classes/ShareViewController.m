//
//  ShareViewController.m
//  IOSFramework
//
//  Created by xu on 16/3/14.
//
//

#import "ShareViewController.h"
#import "RDVTabBarController.h"
//#import "CY_NetAPIManager.h"
#import <ShareSDK/ShareSDK.h>
@interface ShareViewController ()

@end

@implementation ShareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"分享给好友";
    [self setShareUI];
    // Do any additional setup after loading the view.
}
-(void)setShareUI
{
    UIImageView *imageView = [[UIImageView alloc] init];
//    if (IS_IPHONE_4_OR_LESS) {
//        [imageView autoSetDimensionsToSize:CGSizeMake(60, 60)];
//        imageView.image = [UIImage imageNamed:@"code.png"];
//        [self.view addSubview:imageView];
//        [imageView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:(kScreen_Width-60)/2];
//        [imageView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:(kScreen_Width-60)/2];
//        [imageView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:20];
//    }else{
        [imageView autoSetDimensionsToSize:CGSizeMake(120, 120)];
        imageView.image = [UIImage imageNamed:@"code.png"];
        [self.view addSubview:imageView];
        [imageView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:(kScreen_Width-120)/2];
        [imageView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:(kScreen_Width-120)/2];
        [imageView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:20];
    
    
    UILabel *phoneLabel = [[UILabel alloc]init];
    phoneLabel.text = @"您的二维码";
    phoneLabel.textColor = [UIColor blackColor];
    phoneLabel.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:phoneLabel];
    [phoneLabel autoSetDimensionsToSize:CGSizeMake(80, 20)];
    [phoneLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:(kScreen_Width-80)/2];
    [phoneLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:(kScreen_Width-80)/2];
    [phoneLabel autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:imageView withOffset:30];
    
    UILabel *phoneLabel1 = [[UILabel alloc]init];
    phoneLabel1.text = @"您可以邀请小伙伴扫码进行注册";
    phoneLabel1.textColor = [UIColor blackColor];
    phoneLabel1.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:phoneLabel1];
    [phoneLabel1 autoSetDimensionsToSize:CGSizeMake(170, 20)];
    [phoneLabel1 autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:(kScreen_Width-170)/2];
    [phoneLabel1 autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:(kScreen_Width-170)/2];
    [phoneLabel1 autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:phoneLabel withOffset:20];
    
    UIImageView *spearTwo = [[UIImageView alloc]init];
    [spearTwo setBackgroundColor:[UIColor colorWithHexString:@"f4f4f4f4"]];
    [self.view addSubview:spearTwo];
    [spearTwo autoSetDimensionsToSize:CGSizeMake(1, 1)];
    [spearTwo autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:30];
    [spearTwo autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:30];
    [spearTwo autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:phoneLabel1 withOffset:10];
    
    UIView *backView = [[UIView alloc]init];
    [self.view addSubview:backView];
    [backView autoSetDimensionsToSize:CGSizeMake(200, 200)];
    [backView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0];
    [backView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:0];
    [backView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:spearTwo withOffset:10];
    
    
    NSArray* imageNames = [NSArray arrayWithObjects:@"wechat.png",@"c-friends.png",@"sina.png",@"qq.png",@"space.png",@"message.png", nil];
    for (int i=0; i<6; i++) {
        UIButton *Btn = [[UIButton alloc] init];
        [Btn setBackgroundImage:[UIImage imageNamed:[imageNames objectAtIndex: i]] forState:UIControlStateNormal];
        Btn.tag = i;
        //        CGRect frame;
        //        frame.size.width = 50;//设置按钮坐标及大小
        //        frame.size.height = 50;
        //        frame.origin.x = (i%3)*(50+45)+40;
        //        frame.origin.y = floor(i/3)*(50+20)+20;
        //        [Btn setFrame:frame];
        CGFloat f=(kScreen_Width-150)/4;
        if (i<3) {
            Btn.frame=CGRectMake(f*(i+1)+(50*i), 20, 50, 50);
            
        }else{
            Btn.frame=CGRectMake(f*(i-3+1)+(50*(i-3)), 100, 50, 50);
            
        }
        
        
        [Btn setBackgroundColor:[UIColor clearColor]];
        [Btn addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
        [backView addSubview:Btn];
    }
}

-(void)btnPressed:(id)sender
{
    UIButton *btn = sender;
    //    if (btn.tag==0) {
    //        NSLog(@"----微信");
    //    }else if (btn.tag==1){
    //        NSLog(@"-----qq---");
    //    }else if (btn.tag==2){
    //        NSLog(@"-----新浪---");
    //    }
    ShareType type = 0;
    switch (btn.tag)
    {
        case 0:
            type = ShareTypeWeixiSession;
            break;
        case 1:
            type = ShareTypeWeixiTimeline;
            break;
        case 2:
            type = ShareTypeSinaWeibo;
            break;
        case 3:
            type = ShareTypeQQ;
            break;
        case 4:
            type = ShareTypeQQSpace;
            break;
        case 5:
            type = ShareTypeSMS;
            break;
        default:
            break;
    }
    NSString* path = nil;
    NSString *contentStr = nil;
    if (btn.tag==5) {
        contentStr = [NSString stringWithFormat:@"值得信赖的保险创业平台-创盈平台!http://www.95505.com.cn:8083/app/qrCode.html"];
        path = [[NSBundle mainBundle]pathForResource:@"share" ofType:@"png"];
    }
    else if(btn.tag==2)
    {
        contentStr = [NSString stringWithFormat:@"值得信赖的保险创业平台-创盈平台!http://www.95505.com.cn:8083/app/qrCode.html"];
        path = @"";
    }
    else
    {
        contentStr = [NSString stringWithFormat:@"值得信赖的保险创业平台-创盈平台!"];
        path = [[NSBundle mainBundle]pathForResource:@"share" ofType:@"png"];
    }
    //1.定制分享的内容
    
    
    
    
    id<ISSContent> publishContent = [ShareSDK content:contentStr defaultContent:nil image:[ShareSDK imageWithPath:path] title:@"来自创盈平台APP" url:@"http://www.95505.com.cn:8083/app/qrCode.html" description:@"值得信赖的保险创业平台-创盈平台!" mediaType:SSPublishContentMediaTypeNews];
    
    //2.分享
    [ShareSDK showShareViewWithType:type container:nil content:publishContent statusBarTips:YES authOptions:nil shareOptions:nil result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
        //如果分享成功
        if (state == SSResponseStateSuccess)
        {
            NSLog(@"分享成功");
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"创盈平台" message:@"分享成功" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
        //如果分享失败
        if (state == SSResponseStateFail) {
            NSLog(@"分享失败,错误码:%ld,错误描述%@",(long)[error errorCode],[error errorDescription]);
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"创盈平台" message:[error errorDescription] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
        //        if (state == SSResponseStateCancel){
        //            NSLog(@"分享取消");
        //            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"创盈平台" message:@"进入了分享取消状态" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        //            [alert show];
        //        }
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [self.rdv_tabBarController setTabBarHidden:NO animated:NO];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

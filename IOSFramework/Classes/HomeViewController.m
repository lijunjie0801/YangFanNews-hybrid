//
//  MYHomeViewController.m
//  IOSFramework
//
//  Created by xu on 16/3/14.
//
//

#import "HomeViewController.h"
#import "DTCustomWebViewController.h"
#import "RDVTabBarController.h"
#import "HomeViewCell.h"
#import "HomeViewMd.h"
#import "RDVTabBarController.h"
#import "SDCycleScrollView.h"
//#import "DateBaseHelper.h"
@interface HomeViewController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate,SDCycleScrollViewDelegate>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UIPageControl *pageControl;
@property (nonatomic,strong) NSTimer *timer;
@property (nonatomic,strong) UIScrollView *headScrollView;
@property (nonatomic,strong)UILabel *integralLabel;
@property (nonatomic,strong)UILabel *renewedLabel;//待续保
@property (nonatomic,strong) NSString *availablePoint;//可用积分
@property (nonatomic,strong) NSString *totalPoint;//总积分
@property (nonatomic,strong) NSString *waitRewalStr;//总积分
@property(nonatomic,strong)NSMutableArray *productArr;
@property(nonatomic,strong)NSMutableArray *productLabelArr;
@property(nonatomic,strong)NSMutableArray *SongJiaoImgarray;
@property(nonatomic,strong)UIImageView *middleImage;
@end

@implementation HomeViewController

-(NSMutableArray*)productArr
{
    if (_productArr==nil) {
        _productArr=[NSMutableArray array];
    }
    return _productArr;
}
-(NSMutableArray*)SongJiaoImgarray
{
    if (_SongJiaoImgarray==nil) {
        _SongJiaoImgarray=[NSMutableArray array];
    }
    return _SongJiaoImgarray;
}
-(void)viewDidLoad{
    [super viewDidLoad];
    //    self.title = @"首页";
    
    UIButton *rightMenuBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightMenuBtn.frame = CGRectMake(0, 0, 90, 20);
    //rightMenuBtn.titleLabel.font =  [UIFont systemFontOfSize: 12];
    rightMenuBtn.backgroundColor = [UIColor clearColor];
    NSString* cityName =  [NSString stringWithFormat:@"%@", [[NSUserDefaults standardUserDefaults]objectForKey:@"cityName"]];
    UILabel *label = [[UILabel alloc]init];
    
    label.text = cityName.length>0?cityName:@"";
    label.textColor=[UIColor whiteColor];
    label.font=[UIFont systemFontOfSize:12];
    [rightMenuBtn addSubview:label];
    [label autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:50];
    [label autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:0];
    
    CGSize sizeText=[cityName sizeWithFont:[UIFont systemFontOfSize:12]];
    [label autoSetDimensionsToSize:CGSizeMake(sizeText.width+5, 20)];
    
    UIBarButtonItem *rightBtnItem = [[UIBarButtonItem alloc] initWithCustomView:rightMenuBtn];
    rightBtnItem.style = UIBarButtonItemStylePlain;
    self.navigationItem.rightBarButtonItem = rightBtnItem;
    
    
    UIButton *leftMenuBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftMenuBtn.frame = CGRectMake(0, 0, 90, 20);
    leftMenuBtn.backgroundColor = [UIColor clearColor];
    UILabel *leftlabel = [[UILabel alloc]init];
    
    leftlabel.text = @"e 行 销";
    leftlabel.textColor=[UIColor whiteColor];
    leftlabel.font=[UIFont systemFontOfSize:17];
    [leftMenuBtn addSubview:leftlabel];
    [leftlabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0];
    [leftlabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:0];
    
    UIBarButtonItem *leftBtnItem = [[UIBarButtonItem alloc] initWithCustomView:leftMenuBtn];
    leftBtnItem.style = UIBarButtonItemStylePlain;
    self.navigationItem.leftBarButtonItem = leftBtnItem;
    //     self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"创盈平台" style:UIBarButtonItemStyleDone target:self action:nil];
    
    //     self.navigationItem.leftBarButtonItem.tintColor=[UIColor whiteColor];
    
    //    UIImageView *imageView = [[UIImageView alloc]init];
    //    //imageView.frame = CGRectMake(90, 0, 12, 7);
    //    imageView.image = [UIImage imageNamed:@"arrow_down1"];
    //    [rightMenuBtn addSubview:imageView];
    //    [imageView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:8];
    //    [imageView autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:label withOffset:0];
    //    [imageView autoSetDimensionsToSize:CGSizeMake(12, 7)];
//    _pageRefresh = [[CY_NetAPIManager alloc]init];
    //    if (_pageRefresh.list.count>0) {
    //        [self.tableView reloadData];
    //    }else{
    //
    //    }
    
   // [self getHomeImage];
    // [self getMiddleImage];
    
    //获取首页积分和待续保时间
    // [self setUpTableView];
}

//#pragma mark 获取首页数据
//-(void)getHomeData{
//    NSDictionary *infoDic = [[NSUserDefaults standardUserDefaults]objectForKey:@"loginInformation"];
//    NSDictionary *responseObject = infoDic[@"responseObject"];
//    NSDictionary *userInfo = responseObject[@"userInfo"];
//    NSString *customerId = [userInfo objectForKey:@"customerId"];
//    NSDictionary *dic = @{
//                          @"channelType":@"1",
//                          @"customerId":customerId,
//                          @"requestObject":@{
//                                  @"customerQueryReqDTO":@{
//                                          @"customerId":customerId
//                                          },
//                                  @"marketingReqDTO":@{
//                                          //    @"areaId":@"33"
//                                          }
//                                  },
//                          @"requestService":@"getIndexInfo"
//                          };
//    [[CY_NetAPIManager sharedManager]request_getHomeData:dic andBlock:^(id data, NSError *error) {
//        NSLog(@"取到的首页数据为%@",data);
//        //        NSDictionary * allDic= data[@"responseObject"];
//        //        NSDictionary *waitDic = allDic[@"waitRewal"];
//        //        self.waitRewalStr = waitDic[@"count"];
//        //        _renewedLabel.text = [NSString stringWithFormat:@"待续保:%@",self.waitRewalStr.length>0?self.waitRewalStr:@"100"];
//        //        [_tableView reloadData];
//    }];
//}
//#pragma mark 首页积分显示
//-(void)getHome
//{
//    NSDictionary *infoDic = [[NSUserDefaults standardUserDefaults]objectForKey:@"loginInformation"];
//    NSDictionary *responseObject = infoDic[@"responseObject"];
//    NSDictionary *userInfo = responseObject[@"userInfo"];
//    NSString *customerId = [userInfo objectForKey:@"customerId"];
//    NSDictionary *dic = @{
//                          @"channelType":@"1",
//                          @"customerId":customerId,
//                          @"requestObject":@{
//                                  },
//                          @"requestService":@"indexPoint"
//                          };
//    [[CY_NetAPIManager sharedManager]request_getDic:dic andBlock:^(id data, NSError *error) {
//        if (!error) {
//            if (data) {
//                CY_NetAPIManager *pageRefresh = [[CY_NetAPIManager alloc]init];
//                pageRefresh.list = data;
//                //                NSString *str = data[@"resultMessage"];
//                NSDictionary *dic = data[@"responseObject"];
//                self.availablePoint = dic[@"availablePoint"];
//                self.totalPoint = dic[@"totalPoint"];
//                //                showAlert(str);
//                NSLog(@"------取到的积分数据为%@",data);
//                _integralLabel.text = [NSString stringWithFormat:@"积分%@/%@",self.totalPoint.length>0?self.totalPoint:@"100",self.availablePoint.length>0?self.availablePoint:@"100" ];
//                [_tableView reloadData];
//            }else{
//                
//            }
//        }else
//        {
//        }
//    }];
//}
//#pragma mark 待续保显示
//-(void)getWaitRewal
//{
//    NSDictionary *infoDic = [[NSUserDefaults standardUserDefaults]objectForKey:@"loginInformation"];
//    NSDictionary *responseObject = infoDic[@"responseObject"];
//    NSDictionary *userInfo = responseObject[@"userInfo"];
//    NSString *customerId = [userInfo objectForKey:@"customerId"];
//    NSDictionary *dic = @{
//                          @"channelType":@"1",
//                          @"customerId":customerId,
//                          @"requestObject":@{
//                                  },
//                          @"requestService":@"indexWaitRewal"
//                          };
//    [[CY_NetAPIManager sharedManager]request_getDic:dic andBlock:^(id data, NSError *error) {
//        if (!error) {
//            if (data) {
//                CY_NetAPIManager *pageRefresh = [[CY_NetAPIManager alloc]init];
//                pageRefresh.list = data;
//                NSDictionary *dic = data[@"responseObject"];
//                NSString * countStr = dic[@"count"];
//                NSLog(@"取到的数据位%@",countStr);
//                _renewedLabel.text = [NSString stringWithFormat:@"%@",countStr.length>0?countStr:@"100"];
//                [_tableView reloadData];
//            }else{
//            }
//        }else
//        {
//        }
//    }];
//}
//
//-(void)setUpTableView{
//    if (!_tableView) {
//        UITableView *tableView=[[UITableView alloc]init];
//        [self.view addSubview:tableView];
//        [tableView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0];
//        [tableView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:0];
//        [tableView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:0];
//        [tableView autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:0];
//        tableView.delegate=self;
//        tableView.dataSource=self;
//        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//        tableView.showsVerticalScrollIndicator = NO;
//        tableView.showsHorizontalScrollIndicator = NO;
//        self.tableView=tableView;
//        [self getProductImage];
//        [self setHeadView];
//    }
//}
//#pragma 头部图片
//-(void)setHeadView{
//    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, 280)];
//    headView.backgroundColor=[UIColor colorWithHexString:@"f7f1ee"];
//    [self.tableView addSubview:headView];
//    self.tableView.tableHeaderView = headView;
//    //[headView autoSetDimensionsToSize:CGSizeMake(kScreen_Width, 280)];
//    NSLog(@"首焦图：%@",self.SongJiaoImgarray);
//    SDCycleScrollView *scr=[SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, kScreen_Width, 140) imageNamesGroup:_SongJiaoImgarray];
//    scr.currentPageDotColor=[UIColor redColor];
//    scr.pageDotColor=[UIColor whiteColor];
//    
//    //间隔时间
//    scr.autoScrollTimeInterval=5;
//    // [scr setShowPageControl:NO];
//    [headView addSubview:scr];
//    scr.delegate=self;
//    //    UIScrollView *headScrollView = [[UIScrollView alloc]init];
//    //    headScrollView.delegate = self;
//    //    self.headScrollView = headScrollView;
//    //    [headView addSubview:headScrollView];
//    //    [headScrollView autoSetDimensionsToSize:CGSizeMake(kScreen_Width, 140)];
//    //    [headScrollView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0];
//    //    [headScrollView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:0];
//    //    [headScrollView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:0];
//    //    headScrollView.showsHorizontalScrollIndicator = NO;
//    //    headScrollView.showsVerticalScrollIndicator = NO;
//    //    headScrollView.pagingEnabled = YES;
//    //    UILongPressGestureRecognizer *tap = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPress:)];
//    //    [headScrollView addGestureRecognizer:tap];
//    //
//    //    for (int i = 0; i<self.SongJiaoImgarray.count; i++) {
//    //        //图片标号
//    //       // NSString *numString = [NSString stringWithFormat:@"banner_%d",i];
//    //        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(i*kScreen_Width, 0, kScreen_Width, 140)];
//    //        imageView.image = self.SongJiaoImgarray[i];
//    //        [headScrollView addSubview:imageView];
//    //
//    //    }
//    //    headScrollView.contentSize = CGSizeMake(kScreen_Width*3, 0);
//    //阴影层
//    UIImageView *shadowView = [[UIImageView alloc]init];
//    [headView addSubview:shadowView];
//    [shadowView setBackgroundColor:[UIColor colorWithHexString:@"0xffffff"]];
//    shadowView.alpha = 0.8;
//    [shadowView autoSetDimensionsToSize:CGSizeMake(0, 30)];
//    [shadowView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0];
//    [shadowView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:0];
//    [shadowView autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:scr withOffset:0];
//    //积分图标
//    UIImageView *integraImage = [[UIImageView alloc]init];
//    integraImage.image = [UIImage imageNamed:@"redeem"];
//    [shadowView addSubview:integraImage];
//    [integraImage autoSetDimensionsToSize:CGSizeMake(15, 15)];
//    [integraImage autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:10];
//    [integraImage autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:7];
//    //积分
//    _integralLabel = [[UILabel alloc]init];
//    //    integralLabel.text = [NSString stringWithFormat:@"积分%@/%@",self.availablePoint,self.totalPoint ];
//    _integralLabel.font = [UIFont systemFontOfSize:12];
//    _integralLabel.adjustsFontSizeToFitWidth = YES;
//    [shadowView addSubview:_integralLabel];
//    [_integralLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:7];
//    [_integralLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:integraImage withOffset:5];
//    //待续保
//    
//    _renewedLabel = [[UILabel alloc]init];
//    //    _renewedLabel.text = @"待续保：12";
//    _renewedLabel.font = [UIFont systemFontOfSize:12];
//    _renewedLabel.textColor=[UIColor redColor];
//    _renewedLabel.adjustsFontSizeToFitWidth = YES;
//    [shadowView addSubview:_renewedLabel];
//    [_renewedLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:10];
//    [_renewedLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:7];
//    UILabel *waitLabel=[[UILabel alloc]init];
//    waitLabel.text=@"待续保:";
//    waitLabel.font = [UIFont systemFontOfSize:12];
//    [shadowView addSubview:waitLabel];
//    [waitLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:7];
//    [waitLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:_renewedLabel withOffset:-2];
//    
//    //滚动指示器
//    //    UIPageControl *pageControl = [[UIPageControl alloc]init];
//    //    self.pageControl = pageControl;
//    //    pageControl.numberOfPages = self.SongJiaoImgarray.count;
//    //    pageControl.backgroundColor = [UIColor clearColor];
//    //    pageControl.currentPageIndicatorTintColor = [UIColor redColor];
//    //    pageControl.pageIndicatorTintColor = [UIColor grayColor];
//    //    [shadowView addSubview:pageControl];
//    //    [pageControl autoSetDimensionsToSize:CGSizeMake(50, 20)];
//    //    [pageControl autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:(kScreen_Width - 50)/2];
//    //    [pageControl autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:5];
//    //    self.timer = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(pageChange) userInfo:nil repeats:YES];
//    //
//    
//    UIView *otherView = [[UIView alloc]init];
//    [otherView setBackgroundColor:[UIColor whiteColor]];
//    [headView addSubview:otherView];
//    [otherView autoSetDimensionsToSize:CGSizeMake(kScreen_Width, 85)];
//    [otherView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:scr withOffset:5];
//    //车险
//    CGFloat diameter = 55;//图片直径
//    CGFloat littleSpac = 10;
//    CGFloat bigSpac = (kScreen_Width - diameter*4 - littleSpac*2)/3;
//    
//    
//    NSArray *photoArray = @[@"chexian",@"feichexian",@"order",@"customer"];
//    NSArray *labelArray = nil;
//    if ([_flag isEqualToString:@"1"])
//    {
//        labelArray = @[@"车险",@"理赔查勘",@"订单",@"客户"];
//    }
//    else
//    {
//        labelArray = @[@"车险",@"非车险",@"订单",@"客户"];
//    }
//    
//    for (int i = 0; i <4;  i ++) {
//        UIButton *imageBtn = [[UIButton alloc]init];
//        imageBtn.tag = i;
//        [imageBtn setImage:[UIImage imageNamed:photoArray[i]] forState:UIControlStateNormal];
//        [otherView addSubview:imageBtn];
//        [imageBtn autoSetDimensionsToSize:CGSizeMake(diameter, diameter)];
//        [imageBtn autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:2];
//        [imageBtn autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:(littleSpac + (bigSpac + diameter)*i)];
//        [imageBtn addTarget:self action:@selector(imageClick:) forControlEvents:UIControlEventTouchUpInside];
//        UILabel *label = [[UILabel alloc]init];
//        label.text = labelArray[i];
//        label.textColor = [UIColor blackColor];
//        label.font = [UIFont systemFontOfSize:14];
//        label.textAlignment = NSTextAlignmentCenter;
//        [otherView addSubview:label];
//        [label autoSetDimensionsToSize:CGSizeMake(diameter+10, 20)];
//        [label autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:imageBtn withOffset:5];
//        [label autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:(littleSpac + (bigSpac + diameter)*i-5)];
//    }
//    UIImageView *imageView = [[UIImageView alloc]init];
//    self.middleImage=imageView;
//    [headView addSubview:imageView];
//    //    imageView.image = [UIImage imageNamed:@"index-banner"];
//    [imageView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0];
//    [imageView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:0];
//    [imageView autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:0];
//    [imageView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:otherView withOffset:5];
//}
//-(void)imageClick:(UIButton *)btn{
//
//        if (btn.tag == 0) {
//            NSString * URL = [NSString stringWithFormat:@"file://%@/index.html#/insure/new/carownerinput",Bundle2];
//            DTCustomWebViewController * VC = [[DTCustomWebViewController alloc]initWithStartPage:URL];
//            // [self.rdv_tabBarController setTabBarHidden:YES animated:NO];
//            [self.navigationController pushViewController:VC animated:YES];
//        }else if (btn.tag == 1){
//            NSString * URL = [NSString stringWithFormat:@"file://%@/index.html#/nonAuto/product",Bundle2];
//            DTCustomWebViewController * VC = [[DTCustomWebViewController alloc]initWithStartPage:URL];
//            //   [self.rdv_tabBarController setTabBarHidden:YES animated:NO];
//            [self.navigationController pushViewController:VC animated:YES];
//            
//        }
//        else if (btn.tag==2){
//            NSString * URL = [NSString stringWithFormat:@"file://%@/index.html#/insure/new/order-list",Bundle2];
//            DTCustomWebViewController * VC = [[DTCustomWebViewController alloc]initWithStartPage:URL];
//           // VC.orderTag = @"3";
//            //    [self.rdv_tabBarController setTabBarHidden:YES animated:NO];
//            [self.navigationController pushViewController:VC animated:YES];
//        }
//        else if (btn.tag==3){
//            NSString * URL = [NSString stringWithFormat:@"file://%@/index.html#/client/clientInfo",Bundle2];
//            DTCustomWebViewController * VC = [[DTCustomWebViewController alloc]initWithStartPage:URL];
//            //     [self.rdv_tabBarController setTabBarHidden:YES animated:NO];
//            [self.navigationController pushViewController:VC animated:YES];
//        }
//    
//}
//-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    return 1;
//}
//-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    return 1;
//}
//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return 425;
//}
//-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    NSString *ID = @"ID";
//    HomeViewCell *cell = (HomeViewCell *)[tableView dequeueReusableCellWithIdentifier:ID];
//    
//    if (cell == nil) {
//        cell = [[HomeViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
//    }
//    [cell configImgDataArray:self.productArr:self.productLabelArr];
//    cell.backgroundColor=[UIColor colorWithHexString:@"f7f1ee"];
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    return  cell;
//}
////长按滚动图片
//-(void)longPress:(UILongPressGestureRecognizer *)sender{
//    if (sender.state == UIGestureRecognizerStateBegan) {
//        [self.timer invalidate];
//    }
//    if (sender.state == UIGestureRecognizerStateEnded) {
//        self.timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(pageChange) userInfo:nil repeats:YES];
//    }
//}
//
//-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
//    CGFloat pageWidth = CGRectGetWidth(self.headScrollView.frame);
//    NSInteger page = floor((self.headScrollView.contentOffset.x -pageWidth/2)/pageWidth) +1;
//    self.pageControl.currentPage = page;
//}
////自动计数器
//-(void)pageChange{
//    if (self.pageControl.currentPage == 2) {
//        self.pageControl.currentPage = 0;
//    }else{
//        self.pageControl.currentPage ++;
//    }
//    [self.headScrollView setContentOffset:CGPointMake(kScreen_Width*self.pageControl.currentPage, 0) animated:YES];
//}
//-(instancetype)init{
//    self = [super init];
//    return self;
//}
//-(void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:YES];
//    
//    /*---------------------理赔查勘------------------------*/
////    NSDictionary *userDic = [[[ClassFactory getInstance]getNetComm]getObject:USER_LOGIN_KAY];
////    NSString *username=[userDic objectForKey:@"mobile"];
////    NSArray *arr = [[DateBaseHelper sharedDataBase]selectMessageByCaseNo:nil withSQL:[NSString stringWithFormat:@"WHERE isRead  = '0' and phoneNo = '%@'",username]];
////    ApplicationDelegate.messageNum = arr.count;
////    NSLog(@"未读信息数:%ld",(unsigned long)arr.count);
////    [[NSNotificationCenter defaultCenter] postNotificationName:@"message" object:nil userInfo:nil];
////    NSLog(@"%f",self.tableView.bounds.size.height);
//   self.navigationController.navigationBar.hidden = NO;
//   [self.rdv_tabBarController setTabBarHidden:NO animated:NO];
//    
//    [self getHomeData];
//    [self getHome];
//    [self getWaitRewal];
//    
//}
//
//#pragma mark 请求轮播图地址
//-(void)getHomeImage{
//    NSDictionary *infoDic = [[NSUserDefaults standardUserDefaults]objectForKey:@"loginInformation"];
//    NSDictionary *responseObject = infoDic[@"responseObject"];
//    NSDictionary *userInfo = responseObject[@"userInfo"];
//    NSString *customerId = [userInfo objectForKey:@"customerId"];
//    NSDictionary *dic = @{
//                          @"channelType":@"1",
//                          @"customerId":customerId,
//                          @"requestObject":@{
//                                  @"showPosition":@"index_top",
//                                  //   @"areaId":@"166"
//                                  },
//                          @"requestService":@"getMarketing"
//                          };
//    [[CY_NetAPIManager sharedManager]request_getHomeData:dic andBlock:^(id data, NSError *error) {
//        //        NSLog(@"取到的轮播图数据为%@",data);
//        NSArray *array = [data[@"responseObject"] objectForKey:@"eBannerDTOList"];
//        //   self.songJiaoArr=array;
//        NSMutableArray *mArr=[[NSMutableArray alloc]init];
//        for (int i=0; i<array.count; i++) {
//            //            [ mArr addObject:array[0][@"visitUrl"]];
//            //
//            NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:array[i][@"visitUrl"]]];
//            NSLog(@"图片地址位：%@",array[i][@"visitUrl"]);
//            UIImage *result = [UIImage imageWithData:data];
//            if (i<5) {
//                [ mArr addObject:result];
//            }
//            
//        }
//        NSLog(@"存的图片数组：%@",mArr);
//        self.SongJiaoImgarray=mArr;
//        [self setUpTableView];
//        [self getHome];
//        [self getWaitRewal];
//        [self getMiddleImage];
//    }];
//}
//#pragma mark 请求中间图片
//-(void)getMiddleImage{
//    NSDictionary *infoDic = [[NSUserDefaults standardUserDefaults]objectForKey:@"loginInformation"];
//    NSDictionary *responseObject = infoDic[@"responseObject"];
//    NSDictionary *userInfo = responseObject[@"userInfo"];
//    NSString *customerId = [userInfo objectForKey:@"customerId"];
//    NSDictionary *dic = @{
//                          @"channelType":@"1",
//                          @"customerId":customerId,
//                          @"requestObject":@{
//                                  @"showPosition":@"index_middle",
//                                  //     @"areaId":@"166"
//                                  },
//                          @"requestService":@"getMarketing"
//                          };
//    [[CY_NetAPIManager sharedManager]request_getHomeData:dic andBlock:^(id data, NSError *error) {
//        NSLog(@"取到的中间图片为%@",data);
//        NSArray *array = [data[@"responseObject"] objectForKey:@"eBannerDTOList"];
//        NSData * imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:array[0][@"visitUrl"]]];
//        UIImage *result = [UIImage imageWithData:imageData];
//        _middleImage.image=result;
//    }];
//}
//#pragma mark 请求table显示图片
//-(void)getProductImage{
//    NSDictionary *infoDic = [[NSUserDefaults standardUserDefaults]objectForKey:@"loginInformation"];
//    NSDictionary *responseObject = infoDic[@"responseObject"];
//    NSDictionary *userInfo = responseObject[@"userInfo"];
//    NSString *customerId = [userInfo objectForKey:@"customerId"];
//    NSDictionary *dic = @{
//                          @"channelType":@"1",
//                          @"customerId":customerId,
//                          @"requestObject":@{
//                                  @"showPosition":@"index_product",
//                                  //      @"areaId":@""
//                                  },
//                          @"requestService":@"getMarketing"
//                          };
//    [[CY_NetAPIManager sharedManager]request_getHomeData:dic andBlock:^(id data, NSError *error) {
//        if (!error) {
//            if (data) {
//                NSArray *array = [data[@"responseObject"] objectForKey:@"eBannerDTOList"];
//                //                NSData * imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:array[0][@"visitUrl"]]];
//                //                UIImage *result = [UIImage imageWithData:imageData];
//                NSMutableArray *mArr=[[NSMutableArray alloc]init];
//                NSMutableArray *mLabelArr=[[NSMutableArray alloc]init];
//                for (int i=0; i<array.count; i++) {
//                    NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:array[i][@"visitUrl"]]];
//                    NSLog(@"AAAAAAA图片地址位：%@",array[i][@"visitUrl"]);
//                    UIImage *result = [UIImage imageWithData:data];
//                    [ mArr addObject:result];
//                    NSString *labelData=array[i][@"description"];
//                    [mLabelArr addObject:labelData];
//                }
//                self.productArr=mArr;
//                self.productLabelArr=mLabelArr;
//                NSLog(@"AAAAAA存的图片数组：%@",self.productArr);
//                NSLog(@"AAAAAA存的文字数组：%@",self.productLabelArr);
//                
//                [_tableView reloadData];
//            }else{
//            }
//        }else
//        {
//        }
//    }];
//    
//}
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"---点击了第%ld张图片", (long)index);
    
    //    NSString *url=self.songJiaoArr[index][@"url"];
    //    NSString *photoID=self.songJiaoArr[index][@"afImg"];
    //    if(![photoID isEqualToString:@""])
    //    {
    //        url=[NSString stringWithFormat:@"%@/%@photoId=%@&width=%d",kBaseUrlStr_Test,DTGetImgList, self.songJiaoArr[index][@"afImg"],(int)self.view.frame.size.width];
    //    }else if ([url rangeOfString:@"#"].location!=NSNotFound) {
    //        NSArray *array=[url componentsSeparatedByString:@"#"];
    //        url = [NSString stringWithFormat:@"file://%@/app.html#%@",Bundle,array[1]];
    //        
    //        
    //    }else if ([url isEqualToString:@""])
    //    {
    //        return;
    //    }
    //    DTCustomWebViewController *web=[[DTCustomWebViewController alloc]initWithStartPage:url];
    //    [self.navigationController pushViewController:web animated:YES];
}

@end

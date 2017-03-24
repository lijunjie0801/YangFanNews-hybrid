//
//                       .::::.
//                     .::::::::.
//                    ::::::::::: 
//                ..:::::::::::'
//              '::::::::::::'
//                .::::::::::
//           '::::::::::::::..
//                ..::::::::::::.
//              ``::::::::::::::::  Hello Boy!!!
//               ::::``:::::::::'        .:::.
//              ::::'   ':::::'       .::::::::.
//            .::::'      ::::     .:::::::'::::.
//           .:::'       :::::  .:::::::::' ':::::.
//          .::'        :::::.:::::::::'      ':::::.
//         .::'         ::::::::::::::'         ``::::.
//     ...:::           ::::::::::::'              ``::.
//    ```` ':.          ':::::::::'                  ::::..
//                       '.:::::'                    ':'````..
//
//
#pragma mark -
#pragma mark -

/* 验证是否为iphone5  */
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

//mark saj begin
#define iPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)

#define iPhone4s ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)

#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

#define iPhone5s ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)

#define iPhone6plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)

#define PhoneType5(phone) ([phone isEqualToString:@"iPhone 5"] || [phone isEqualToString:@"iPhone 5c"] || [phone isEqualToString:@"iPhone 5s"] || iPhone5 || iPhone5s)
#define PhoneType6(phone) ([phone isEqualToString:@"iPhone 6"] || [phone isEqualToString:@"iPhone 6s"] || iPhone6)
#define PhoneType6P(phone) ([phone isEqualToString:@"iPhone 6 Plus"] || [phone isEqualToString:@"iPhone 6s Plus"] || iPhone6plus)
//mark saj end

//当前设备的屏幕宽度
#define SCREEN_WIDTH   [[UIScreen mainScreen] bounds].size.width

//当前设备的屏幕高度
#define SCREEN_HEIGHT   [[UIScreen mainScreen] bounds].size.height


/* 获取屏幕尺寸 用于兼容iphone5 */
#define WINDOWSCREEN_WIDTH      SCREEN_WIDTH
#define WINDOWSCREEN_HEIGHT     SCREEN_HEIGHT

/* 设备类型 */
//#define IPHONE_OR_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

//----------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------

//tab 按钮高度
#define TAB_BUTTON_HEIGHT 30.0

//footView 操作栏高度
#define FOOT_VIEW_HEIGHT 40.0

//rootView
//#define VIEWSCREEN_ROOT_WIDTH (IPHONE_OR_IPAD?SCREEN_WIDTH:VIEWCON_TABLEVIEW_LR_WIDTH)

//DetailView
//#define VIEWSCREEN_DETAIL_WIDTH (IPHONE_OR_IPAD?SCREEN_WIDTH:VIEWCON_DETAILVIEW_LR_WIDTH)

/* ios7尺寸 */
#define VIEWSCREEN_IOS7_Y ((IOS_VERSION_7==1)?64:0)

/* 获取显示屏幕的尺寸 去除电池条高度 */
#define VIEWSCREEN_WIDTH        SCREEN_WIDTH

#define VIEW_HEIGHT SCREEN_HEIGHT
#define VIEWSCREEN_HEIGHT       ((IOS_VERSION_7==1)?(VIEW_HEIGHT - 64):(VIEW_HEIGHT - 44))

//----------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------

/* 是不是IPhone4 */
#define iPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)

//16进制color 使用方法：HEXCOLOR(0XFFFFFF)
#define HEXCOLOR(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]

/* 安全释放变量 release + nil */
#define RELEASE_SAFELY(__POINTER) { [__POINTER release]; __POINTER = nil; }

/* 防止空变量 nil -> @"" */
#define STRING_NIL_TO_NONE(__POINTER) if (__POINTER == nil || [__POINTER isEqualToString:@"(null)"]){__POINTER = @"";}

/* 判定字符串是否为空 */
#define STRING_ISNIL(__POINTER) (__POINTER == nil || [__POINTER isEqualToString:@""])?YES:NO
#define STRING_ISNOTNIL(__POINTER) (__POINTER == nil || [__POINTER isEqualToString:@""])?NO:YES

/* 打印BOOL值 */
#define NSLOG_BOOL(_bool) { NSLog(@"_bool = %@",(_bool == YES)?@"YES":@"NO"); } 

///* 自定义NSLog */
//#ifdef DEBUG
//#define NSLog NSLog(@"[%s] [%s] [%d] ",strrchr(__FILE__,'/'), __FUNCTION__, __LINE__);NSLog
//#else
//#define NSLog(...)
//#endif

/* 弹出alert形式NSLog */
#ifdef DEBUG
#define ULog(fmt, ...)  { UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%s\n [Line %d] ", __PRETTY_FUNCTION__, __LINE__] message:[NSString stringWithFormat:fmt, ##__VA_ARGS__]  delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil]; [alert show]; }
#else
#define ULog(...)
#endif

/* 设备类型和方向 */
#define UI_USER_INTERFACE_IDIOM() ([[UIDevice currentDevice] respondsToSelector:@selector(userInterfaceIdiom)] ? [[UIDevice currentDevice] userInterfaceIdiom] : UIUserInterfaceIdiomPhone)

#define UIDeviceOrientationIsPortrait(orientation)  ((orientation) == UIDeviceOrientationPortrait || (orientation) == UIDeviceOrientationPortraitUpsideDown)
#define UIDeviceOrientationIsLandscape(orientation) ((orientation) == UIDeviceOrientationLandscapeLeft || (orientation) == UIDeviceOrientationLandscapeRight)

/* performSelector ARC警告问题
 
 如果没有返回结果，可以直接按如下方式调用：
 SuppressPerformSelectorLeakWarning([_target performSelector:_action withObject:self]);
 
 如果要返回结果，可以按如下方式调用:
 id result;SuppressPerformSelectorLeakWarning( result =[_target performSelector:_action withObject:self]);
 */
#define SuppressPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)
/*判断BOOL类型值 */
#define BOOLTYPE(IPHONESTR) (IPHONESTR == YES)? YES:NO

/* 判断字符串是否为空 如果为空 则置为@"" */
#define ISSTRINGCLASS(IPHONESTR) [[IPHONESTR class] isSubclassOfClass:[NSString class]] ? YES:NO

#define ISNILSTRING(IPHONESTR)  (ISSTRINGCLASS(IPHONESTR) == YES) ? ((IPHONESTR == nil || [IPHONESTR isEqualToString:@""]) ? ((IPHONESTR = @""), YES):NO):YES
#define ISNOTNILSTR(IPHONESTR) (ISNILSTRING(IPHONESTR) == YES) ? NO:YES

/* 判断记住密码 字符串 */
#define ISNILORNO(IPHONESTR) (IPHONESTR == nil || [IPHONESTR isEqualToString:@""] || [IPHONESTR isEqualToString:@"NO"] || [IPHONESTR isEqualToString:@"(null)"]) ? YES:NO

/* 非空 字典 */
#define ISNOTNILDIC(IPHONEDIC) ([IPHONEDIC isKindOfClass:[NSDictionary class]] && IPHONEDIC != nil && IPHONEDIC.allKeys.count != 0 && IPHONEDIC.allValues.count != 0)? YES:NO

/* 非空 数组 */
#define ISNOTNILARR(IPHONEARR) ([IPHONEARR isKindOfClass:[NSArray class]] && IPHONEARR != nil && IPHONEARR.count != 0)? YES:NO

/* 非空 字符串 */
#define ISNOTSTRING(IPHONESTR) (![IPHONESTR isEqualToString:@""] && IPHONESTR != nil)? YES:NO

/* 获取系统版本号 */
#define IOS_VERSION [[UIDevice currentDevice].systemVersion floatValue]

#define IOS_VERSION_5 (IOS_VERSION < 6.0)? 1:0
#define IOS_VERSION_6 (IOS_VERSION >= 6.0 && IOS_VERSION<7.0)? 1:0
#define IOS_VERSION_7 (IOS_VERSION >= 7.0)? 1:0
#define IOS_VERSION_8 (IOS_VERSION >= 8.0)? 1:0
/* IOS 7 CGRECT 方法 */
#define IsIOS7 ([[[[UIDevice currentDevice] systemVersion] substringToIndex:1] floatValue] >= 7.0)
#define CGRECT_NO_NAV(x,y,w,h) CGRectMake((x), (y+(IsIOS7?20:0)), (w), (h))
#define CGRECT_HAVE_NAV(x,y,w,h) CGRectMake((x), (y+(IsIOS7?64:0)), (w), (h))

/* 判断屏幕 */
#define IS_RETINA (SCREEN_HEIGHT == 480) ? 1:0

/* 系统版本号判定 是否为6.0以上版本 */
#define DEVICEVALUE6 ([[UIDevice currentDevice].systemVersion floatValue] >= 6.0)? 1:0

/* 5.0和6.0两种系统api兼容  ( (DEVICEVALUE6==1)? NSTextAlignmentCenter : UITextAlignmentCenter )*/
/* 文本类 居左、中、右 */
#ifdef DEVICEVALUE6
# define TEXT_ALIGN_LEFT NSTextAlignmentLeft
# define TEXT_ALIGN_CENTER NSTextAlignmentCenter
# define TEXT_ALIGN_RIGHT NSTextAlignmentRight
#else
# define TEXT_ALIGN_LEFT NSTextAlignmentLeft
# define TEXT_ALIGN_CENTER NSTextAlignmentCenter
# define TEXT_ALIGN_RIGHT UITextAlignmentRight
#endif

/* UILineBreakModeWordWrap  NSLineBreakByCharWrapping  */
#ifdef DEVICEVALUE6
# define LINE_BREAKMODE_WORDWRAP NSLineBreakByCharWrapping
#else
# define LINE_BREAKMODE_WORDWRAP UILineBreakModeWordWrap
#endif

/* NSLineBreakByCharWrapping  NSLineBreakByCharWrapping  */
#ifdef DEVICEVALUE6
# define LINE_BREAKMODE_CHARACTERWRAP NSLineBreakByCharWrapping
#else
# define LINE_BREAKMODE_CHARACTERWRAP NSLineBreakByCharWrapping
#endif

//区分模拟器和真机
#if TARGET_OS_IPHONE
//iPhone Device
#endif

#if TARGET_IPHONE_SIMULATOR
//iPhone Simulator
#endif

//ARC
#if __has_feature(objc_arc)
//compiling with ARC
#else
// compiling without ARC
#endif


// Time
#define TT_MINUTE 60
#define TT_HOUR   (60 * TT_MINUTE)
#define TT_DAY    (24 * TT_HOUR)
#define TT_5_DAYS (5 * TT_DAY)
#define TT_WEEK   (7 * TT_DAY)
#define TT_MONTH  (30.5 * TT_DAY)
#define TT_YEAR   (365 * TT_DAY)

/* 判定系统版本 */
#if __IPHONE_OS_VERSION_MAX_ALLOWED == __IPHONE_6_0

#else

#endif



//----------------------图片----------------------------

//读取本地图片
#define LOADIMAGE(file,ext) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:file ofType:ext]]

//定义UIImage对象

#define IMAGE_NAMED(A) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:A ofType:@"png"]]

//定义UIImage对象
#define IMAGENAMED(_pointer) [UIImage imageNamed:_pointer]

//----------------------图片----------------------------

/* 整体列表 */
#define TABLEVIEW_X 0
#define TABLEVIEW_Y 0
#define TABLEVIEW_WIDTH 320
#define TABLEVIEW_HEIGHT VIEWSCREEN_HEIGHT

/* 下载文件路径 */
#define DocumentsDirectory [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES) lastObject]
#define FileDocPath(file) [DocumentsDirectory stringByAppendingPathComponent:file]

#define FilePath(file,fileName) [FileDocPath(file) stringByAppendingPathComponent:fileName]

#define FILE_ATTACHMENT @"中韩人寿"

#define FILE_ATTACHMENT_DOWN @"中韩人寿/附件下载地址"

#define FILE_ATTACHMENT_UNZIP @"中韩人寿/附件解压地址"

//tabBar的高度
#define TABBAR_HEIGHT 49

/* 背景色灰色 */
#define COMM_BACKGROUND_COLOR       [UIColor colorWithRed:0.9451 green:0.9451 blue:0.9451 alpha:1]
/* tableView 的背景颜色 */
#define TABLEVIEW_BACKGROUND_COLOR [UIColor colorWithPatternImage:[UIImage imageNamed:@"Product_background"]]

#define PRODUCT_ORDER_COLOR [UIColor colorWithPatternImage:[UIImage imageNamed:@"Product_order_footView"]]

/* 用户信息 KEY */
#define USERNAME_KEY @"userName"

#define USERPASS_KEY @"password"

#define USERID_KEY @"userId"

#define USERISVALID_KEY @"isValid"

#define USERMOBILE_KEY @"mobile"

//#define AUTHCODE_KEY @"authCode"

/* 用户信息钥匙串 */
#define COM_USERNAME_KEYCHAIN @"com.game.username"
#define COM_USERPASS_KEYCHAIN @"com.game.userpass"
#define COM_REMEMBER_KEYCHAIN @"com.game.remember"

/* 用户登录信息 路径 */
#define USER_LOGIN_KAY     @"user_login_key"

/* 用户信息 路径 */
#define USER_PATH_KAY     @"user_path_key"

/* 数据字典 路径 */
#define DATA_PATH_KAY     @"data_path_key"

/* 微信数据 路径 */
#define WEIXIN_PATH_KEY   @"weixin_path_key"

/* 签章密码_路径 */
#define SIGN_PATH_KEY     @"sign_path_key"

/* 默认图片 */

#define TEXT_COLOR	 [UIColor colorWithRed:87.0/255.0 green:108.0/255.0 blue:137.0/255.0 alpha:1.0]

#define SHEET_FIRST_ITEM_WIDTH 130

/* UIDetail Height */
#define UIDETAIL_FRAME_HEIGHT 99999

/* 转发人 结构选择 右侧页面 */
//#define LEFT_VIEW_WIDTH (IPHONE_OR_IPAD?220:320)

/* 输入字数限制 */
#define NUM_CHARS_LIMT 140

/* 页面标题定义 */
#define LOGIN_TITLE @"登录"

#define TAB1_TITLE @"任务"
#define TAB2_TITLE @"个人中心"
#define TAB3_TITLE @"通讯录"
#define TAB4_TITLE @"更多"

#define IPAD_TAB1_TITLE @"待办"
#define IPAD_TAB2_TITLE @"申请"
#define IPAD_TAB3_TITLE @"查询"
#define IPAD_TAB4_TITLE @"通讯录"
#define IPAD_TAB5_TITLE @"文档库"
#define IPAD_TAB6_TITLE @"报表"
#define IPAD_TAB7_TITLE @"设置"

/* 中韩人寿 帆软 报表 */
#define DEFAULT_SERVERUEL @"http://10.0.2.80:9080/WebReport/ReportServer"
#define DEFAULT_REPORTPATH @"Form1.frm"

//#define DEFAULT_SERVERUEL @"http://www.finereporthelp.com:8889/app/ReportServer"
//#define DEFAULT_REPORTPATH @"app/sales/orders.frm"
//
//
//#define DEFAULT_SERVERUEL @"http://www.finereporthelp.com:8889/app/ReportServer"
//#define DEFAULT_REPORTPATH @"Demo服务器"

/*****************************************************************************************/
/*****************************************************************************************/
/*****************************************************************************************/
/*****************************************************************************************/
/* 公用尺寸设置 */
#define VIEWCON_UD_H 1004
#define VIEWCON_LR_H 748
#define VIEWSCREEN_IOS7_STATUS_Y   ((IOS_VERSION_7==1) ? 20:0)

/* 页面设置 */
/* UIDeviceOrientationPortrait UIDeviceOrientationPortraitUpsideDown */
#define VIEWCON_UD_X 101
#define VIEWCON_UD_Y VIEWSCREEN_IOS7_STATUS_Y
#define VIEWCON_UD_WIDTH 669 - 10
#define VIEWCON_UD_HEIGHT VIEWCON_UD_H

/* UIDeviceOrientationLandscapeLeft UIDeviceOrientationLandscapeRight */
#define VIEWCON_LR_X 101
#define VIEWCON_LR_Y VIEWSCREEN_IOS7_STATUS_Y
#define VIEWCON_LR_WIDTH 923 - 10
#define VIEWCON_LR_HEIGHT VIEWCON_LR_H

/* 列表页面宽度 */
/* UIDeviceOrientationPortrait UIDeviceOrientationPortraitUpsideDown */
#define VIEWCON_TABLEVIEW_UD_X 0
#define VIEWCON_TABLEVIEW_UD_Y 0
#define VIEWCON_TABLEVIEW_UD_WIDTH 220
#define VIEWCON_TABLEVIEW_UD_HEIGHT VIEWCON_UD_H

/* UIDeviceOrientationLandscapeLeft UIDeviceOrientationLandscapeRight */
#define VIEWCON_TABLEVIEW_LR_X 0
#define VIEWCON_TABLEVIEW_LR_Y 0
#define VIEWCON_TABLEVIEW_LR_WIDTH 320
#define VIEWCON_TABLEVIEW_LR_HEIGHT VIEWCON_LR_H

/* 详情页面 */
/* UIDeviceOrientationPortrait UIDeviceOrientationPortraitUpsideDown */
#define VIEWCON_DETAILVIEW_UD_X 220
#define VIEWCON_DETAILVIEW_UD_Y 0
#define VIEWCON_DETAILVIEW_UD_WIDTH 447
#define VIEWCON_DETAILVIEW_UD_HEIGHT VIEWCON_UD_H

/* UIDeviceOrientationLandscapeLeft UIDeviceOrientationLandscapeRight */
#define VIEWCON_DETAILVIEW_LR_X 320
#define VIEWCON_DETAILVIEW_LR_Y 0
#define VIEWCON_DETAILVIEW_LR_WIDTH 603
#define VIEWCON_DETAILVIEW_LR_HEIGHT VIEWCON_LR_H

/*****************************************************************************************/
/*****************************************************************************************/
/*****************************************************************************************/
/*****************************************************************************************/


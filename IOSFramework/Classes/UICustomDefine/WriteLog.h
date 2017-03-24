//
//  WriteLog.h
//  IOSFramework
//
//  Created by allianture on 13-5-13.
//  Copyright (c) 2013年 allianture. All rights reserved.
//

#import <Foundation/Foundation.h>



#define ERR_LOG 1 /* 应用程序无法正常完成操作，比如网络断开，内存分配失败等 */
#define WARN_LOG 2 /* 进入一个异常分支，但并不会引起程序错误 */
#define NOTICE_LOG 3 /* 日常运行提示信息，比如登录、退出日志 */
#define DEBUG_LOG 4 /* 调试信息，打印比较频繁，打印内容较多的日志 */

#define LOGERR(format,...) writeLog(ERR_LOG,__FUNCTION__,__LINE__,format,##__VA_ARGS__)
#define LOGWARN(format,...) writeLog(WARN_LOG,__FUNCTION__,__LINE__,format,##__VA_ARGS__)
#define LOGNOTICE(format,...) writeLog(NOTICE_LOG,__FUNCTION__,__LINE__,format,##__VA_ARGS__)
#define LOGDEBUG(format,...) writeLog(DEBUG_LOG,__FUNCTION__,__LINE__,format,##__VA_ARGS__)


@interface WriteLog : NSObject

void writeLog(int ulErrorLevel, const char *func, int lineNumber, NSString *format, ...);


@end





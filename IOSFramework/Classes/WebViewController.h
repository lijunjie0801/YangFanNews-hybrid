//
//  WebViewController.h
//  IOSFramework
//
//  Created by lijunjie on 2017/1/18.
//
//

#import <UIKit/UIKit.h>
#import "CDVViewController.h"
@interface WebViewController : CDVViewController
@property(nonatomic,strong)NSString *loadurl;
@property(nonatomic,strong)NSString *docid;
@property(nonatomic,strong)NSString *source;
@end

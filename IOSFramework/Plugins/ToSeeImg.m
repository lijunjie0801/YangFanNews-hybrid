//
//  ToSeeImg.m
//  IOSFramework
//
//  Created by lijunjie on 2017/2/7.
//
//

#import "ToSeeImg.h"
#import "ImageSeeViewController.h"
@implementation ToSeeImg
- (void)toSeeImg:(CDVInvokedUrlCommand*)command{
     NSString *skipID = [command.arguments lastObject];
    ImageSeeViewController *imgVC=[[ImageSeeViewController alloc]init];
    if ([skipID containsString:@"|"]) {
        NSArray *IDs = [skipID componentsSeparatedByString:@"|"];
        if (IDs) {
            imgVC.skipID = IDs[1];
            imgVC.skipTypeID = IDs[0];
        }
    }
    [self.viewController presentViewController:imgVC animated:YES completion:^{
        
    }];

    NSLog(@"haha");
}
@end

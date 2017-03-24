//
//  PhotoPicker.h
//  DecorateTogether
//
//  Created by xu on 15/11/12.
//  Copyright © 2015年 Aiken. All rights reserved.
//

#import "CDVPlugin.h"
#import <UIKit/UIKit.h>
#import <MobileCoreServices/MobileCoreServices.h>


@interface PhotoPicker : CDVPlugin<UIImagePickerControllerDelegate,UIActionSheetDelegate,UINavigationControllerDelegate>

@property (nonatomic,strong)CDVPluginResult * result;

@property (nonatomic,retain)NSString * visitUrl;

@property (nonatomic,retain)NSString * takeDic;

@property (nonatomic,retain)NSString * callbackID;

-(void)pick:(CDVInvokedUrlCommand*)command;
@end

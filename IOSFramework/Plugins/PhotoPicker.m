//
//  PhotoPicker.m
//  DecorateTogether
//
//  Created by xu on 15/11/12.
//  Copyright © 2015年 Aiken. All rights reserved.
//

#import "PhotoPicker.h"

@implementation PhotoPicker


-(void)pick:(CDVInvokedUrlCommand*)command
{
    UIActionSheet* actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:@"选择照片来源"
                                  delegate:self
                                  cancelButtonTitle:@"取消"
                                  destructiveButtonTitle:nil
                                  otherButtonTitles:@"照相机",@"相册",nil];
    [actionSheet showInView:self.webView];
    self.webView.scrollView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    [self.commandDelegate runInBackground:^{
        self.callbackID = command.callbackId;
    }];
    [self.webView endEditing:YES];
}
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0://照相机
        {
            UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
            imagePicker.delegate = self;
            imagePicker.allowsEditing = YES;
            imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
            [self.viewController presentViewController:imagePicker animated:YES completion:nil];
            //            [self.webView addSubview:imagePicker.view];
        }
            break;
        case 1://相册
        {
            UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
            imagePicker.delegate = self;
            imagePicker.allowsEditing = YES;
            imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            [self.viewController presentViewController:imagePicker animated:YES completion:nil];
        }
            break;
        default:
            break;
    }
}

#pragma mark -
#pragma UIImagePickerController Delegate
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    if ([[info objectForKey:UIImagePickerControllerMediaType] isEqualToString:(__bridge NSString *)kUTTypeImage]) {
        UIImage *img = [info objectForKey:UIImagePickerControllerEditedImage];
        [self performSelector:@selector(saveImage:)  withObject:img afterDelay:0.5];
    }
    else if ([[info objectForKey:UIImagePickerControllerMediaType] isEqualToString:(__bridge NSString *)kUTTypeMovie]) {
        
    }
    //    [self.webView reload];
    [picker dismissViewControllerAnimated:YES completion:nil];
    //    [picker pushViewController:self.viewController animated:YES];
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    //    [self.webView reload];
    [picker dismissViewControllerAnimated:YES completion:nil];
    //    [picker pushViewController:self.viewController animated:YES];
}

- (void)saveImage:(UIImage *)image {
    
    BOOL success;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *imageFilePath = [documentsDirectory stringByAppendingPathComponent:@"selfPhoto.jpg"];
    success = [fileManager fileExistsAtPath:imageFilePath];
    if(success) {
        success = [fileManager removeItemAtPath:imageFilePath error:&error];
    }
    //    UIImage *smallImage=[self scaleFromImage:image toSize:CGSizeMake(50, 50)];
    NSData *imageData = UIImageJPEGRepresentation(image, 0.1);
    UIImage *newImage = [UIImage imageWithData:imageData];
    //    NSData *data = [self imageData:newImage];
    //    UIImage *resultImage = [UIImage imageWithData:data];
    
    NSString *path_sandox = NSHomeDirectory();
    NSString *imagePath = [path_sandox stringByAppendingString:@"/Documents/flower.png"];
    [UIImagePNGRepresentation(newImage) writeToFile:imagePath atomically:YES];
    
    NSDictionary* adefaults = [[NSUserDefaults standardUserDefaults] dictionaryRepresentation];
    NSLog(@"取出的Defaults: %@", adefaults);
    
    NSDictionary *loginInformation = [adefaults objectForKey:@"loginInformation"];
    
    NSDictionary *userInfo = [[loginInformation objectForKey:@"responseObject"] objectForKey:@"userInfo"];
    
    NSString *customerId = [userInfo objectForKey:@"customerId"];
    
    //    NSString *idNo =[[NSUserDefaults standardUserDefaults]objectForKey:@"customerId"];
    //    NSLog(@"-------取出来的id为：：%@",idNo);
    NSDictionary *params = @{
                             @"channelType":@"1",
                             @"customerId": customerId,
                             @"requestObject": @{
                                     @"businessDataId":customerId,
                                     @"businessDataType":@"photo",
                                     }};
//    [[CY_NetAPIManager sharedManager]request_upLoadImgParams:newImage upLoadImgDic:params andBlock:^(id data, NSError *error) {
//        if (!error) {
//            if (data) {
//                _takeDic = data;
//                _visitUrl = [_takeDic valueForKey:@"visitUrl"];
//                if ([_visitUrl length]==0) {
//                    showAlert(data[@"resultMessage"]);
//                }
//                [self.commandDelegate runInBackground:^{
//                    CDVPluginResult *result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:_visitUrl];
//                    [self.commandDelegate sendPluginResult:result callbackId:self.callbackID];
//                }];
//                [self.webView reload];
//            }else {
//                showAlert(data[@"resultMessage"]);
//            }
//        }else
//        {
//            showAlert(data[@"resultMessage"]);
//        }
//    }];
    //     [self.webView reload];
}
//// 改变图像的尺寸，方便上传服务器
- (UIImage *) scaleFromImage: (UIImage *) image toSize: (CGSize) size
{
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}
//压缩图片
-(NSData *)imageData:(UIImage *)myimage
{
    NSData *data=UIImageJPEGRepresentation(myimage, 1.0);
    if (data.length>100*1024) {
        if (data.length>1024*1024) {//1M以及以上
            data=UIImageJPEGRepresentation(myimage, 0.1);
        }else if (data.length>512*1024) {//0.5M-1M
            data=UIImageJPEGRepresentation(myimage, 0.5);
        }else if (data.length>200*1024) {//0.25M-0.5M
            data=UIImageJPEGRepresentation(myimage, 0.9);
        }
    }
    return data;
}
@end

//
//  UINormalTextField.h
//  IOSFramework
//
//  Created by 林科 on 14-9-27.
//  Copyright (c) 2014年 allianture. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINormalTextField : UIView

@property (strong, nonatomic) UITextField *textField;

- (id)initWithFrame:(CGRect)frame backImage:(NSString *)image leftImage:(NSString *)leftImage Placeholder:(NSString *)placeholder PlaceholderColor:(UIColor *)placeholderColor TextColor:(UIColor *)textColor Tag:(NSInteger)tag Delegate:(id)delegate Font:(CGFloat)fontSize;


- (id)initWithUserInfoFrame:(CGRect)frame backImage:(NSString *)image leftTitle:(NSString *)leftTitle Placeholder:(NSString *)placeholder PlaceholderColor:(UIColor *)placeholderColor TextColor:(UIColor *)textColor Tag:(NSInteger)tag Delegate:(id)delegate Font:(CGFloat)fontSize;

- (id)initWithRegisterInfoFrame:(CGRect)frame backImage:(NSString *)image leftTitle:(NSString *)leftTitle Placeholder:(NSString *)placeholder PlaceholderColor:(UIColor *)placeholderColor TextColor:(UIColor *)textColor Tag:(NSInteger)tag Delegate:(id)delegate Font:(CGFloat)fontSize;
@end

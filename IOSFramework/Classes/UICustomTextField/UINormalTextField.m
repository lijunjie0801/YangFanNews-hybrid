//
//  UINormalTextField.m
//  IOSFramework
//
//  Created by 林科 on 14-9-27.
//  Copyright (c) 2014年 allianture. All rights reserved.
//

#import "UINormalTextField.h"
#import "UICustomDefine.h"
@implementation UINormalTextField

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
 
}
*/

- (id)initWithFrame:(CGRect)frame backImage:(NSString *)image leftImage:(NSString *)leftImage Placeholder:(NSString *)placeholder PlaceholderColor:(UIColor *)placeholderColor TextColor:(UIColor *)textColor Tag:(NSInteger)tag Delegate:(id)delegate Font:(CGFloat)fontSize
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        //背景图片
        UIImageView *phoneTextfieldBack = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, frame.size.width, frame.size.height)];
        phoneTextfieldBack.image = [UIImage imageNamed:image];
        [self addSubview:phoneTextfieldBack];
        
        if(ISNOTSTRING(leftImage))
        {
            //左侧图片
            UIImageView *phoneTextfieldLeft = [[UIImageView alloc] initWithFrame:CGRectMake(30.0, (frame.size.height - 20.0)/2.0, 20.0, 20.0)];
            phoneTextfieldLeft.image = [UIImage imageNamed:leftImage];
            [self addSubview:phoneTextfieldLeft];
        }
       
        
        //输入框
        _textField = [[UITextField alloc] initWithFrame:CGRectMake(0.0,0.0, frame.size.width  - 30.0, frame.size.height)];
        _textField.delegate = delegate;
//        _textField.secureTextEntry = YES;
        _textField.tag = tag;
        _textField.placeholder = placeholder;
        
        UIImageView *leftImageView = [[UIImageView alloc] init];
        leftImageView.frame = CGRectMake(0, 0, 10, 35);
        _textField.leftView = leftImageView;
        _textField.leftViewMode = UITextFieldViewModeAlways;
        
        _textField.textColor = textColor;
        _textField.backgroundColor = [UIColor clearColor];
        [_textField setValue:placeholderColor forKeyPath:@"placeholderLabel.textColor"];
        _textField.font = [UIFont systemFontOfSize:fontSize];
        _textField.textAlignment = NSTextAlignmentLeft;
        _textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        _textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _textField.returnKeyType = UIReturnKeyDone;
        [self addSubview:_textField];
        
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}


- (id)initWithUserInfoFrame:(CGRect)frame backImage:(NSString *)image leftTitle:(NSString *)leftTitle Placeholder:(NSString *)placeholder PlaceholderColor:(UIColor *)placeholderColor TextColor:(UIColor *)textColor Tag:(NSInteger)tag Delegate:(id)delegate Font:(CGFloat)fontSize
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        //背景图片
        UIImageView *phoneTextfieldBack = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, frame.size.width, frame.size.height)];
        phoneTextfieldBack.image = [UIImage imageNamed:image];
        [self addSubview:phoneTextfieldBack];
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(14, 0, 60, frame.size.height)];
        label.backgroundColor = [UIColor clearColor];
        label.textColor = HEXCOLOR(0X696969);
        label.text = leftTitle;
        label.font = [UIFont systemFontOfSize:fontSize];
        [self addSubview:label];
        
        UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(70, 4, 0.5, frame.size.height-8)];
        lineView.backgroundColor = COMM_BACKGROUND_COLOR;
        [self addSubview:lineView];
        
        //输入框
        _textField = [[UITextField alloc] initWithFrame:CGRectMake(70,0.0, frame.size.width  - 90.0, frame.size.height)];
        _textField.delegate = delegate;
        //        _textField.secureTextEntry = YES;
        _textField.tag = tag;
        _textField.placeholder = placeholder;
        
        UIImageView *leftImageView = [[UIImageView alloc] init];
        leftImageView.frame = CGRectMake(0, 0, 10, 35);
        _textField.leftView = leftImageView;
        _textField.leftViewMode = UITextFieldViewModeAlways;
        
        _textField.textColor = textColor;
        _textField.backgroundColor = [UIColor clearColor];
        [_textField setValue:placeholderColor forKeyPath:@"placeholderLabel.textColor"];
        _textField.font = [UIFont systemFontOfSize:fontSize];
        _textField.textAlignment = NSTextAlignmentLeft;
        _textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        _textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _textField.returnKeyType = UIReturnKeyDone;
        [self addSubview:_textField];
        
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (id)initWithRegisterInfoFrame:(CGRect)frame backImage:(NSString *)image leftTitle:(NSString *)leftTitle Placeholder:(NSString *)placeholder PlaceholderColor:(UIColor *)placeholderColor TextColor:(UIColor *)textColor Tag:(NSInteger)tag Delegate:(id)delegate Font:(CGFloat)fontSize
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        //背景图片
        UIImageView *phoneTextfieldBack = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, frame.size.width, frame.size.height)];
        phoneTextfieldBack.image = [UIImage imageNamed:image];
        [self addSubview:phoneTextfieldBack];
        
        
        //输入框
        _textField = [[UITextField alloc] initWithFrame:CGRectMake(0,0, frame.size.width, frame.size.height)];
        _textField.delegate = delegate;
        //        _textField.secureTextEntry = YES;
        _textField.tag = tag;
        _textField.placeholder = placeholder;
        
        UIImageView *leftImageView = [[UIImageView alloc] init];
        leftImageView.frame = CGRectMake(0, 0, 10, 35);
        _textField.leftView = leftImageView;
        _textField.leftViewMode = UITextFieldViewModeAlways;
        
        _textField.textColor = textColor;
        _textField.backgroundColor = [UIColor clearColor];
        [_textField setValue:placeholderColor forKeyPath:@"placeholderLabel.textColor"];
        _textField.font = [UIFont systemFontOfSize:fontSize];
        _textField.textAlignment = NSTextAlignmentLeft;
        _textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        _textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _textField.returnKeyType = UIReturnKeyDone;
        [self addSubview:_textField];
        
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}
@end

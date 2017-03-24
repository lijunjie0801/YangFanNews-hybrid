//
//  UICustomTextField.h
//  GUOHUALIFE
//
//  Created by allianture on 12-12-2.
//  Copyright (c) 2012年 zte. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICustomTextField : UITextField
{
    
}
@property (nonatomic, retain) NSString *index;
@property (nonatomic, retain) UIImageView *rightImageView;

//初始化基本样式
- (id)initWithFrame:(CGRect)frame Textcolor:(UIColor *)textColor;

- (void)setEnabledWithString:(NSString *)enable;

//重置placeholder 字体颜色
-(void)setPlaceholder:(NSString *)placeholder;

@end

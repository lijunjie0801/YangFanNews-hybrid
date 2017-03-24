//
//  UICustomTextField.m
//  GUOHUALIFE
//
//  Created by allianture on 12-12-2.
//  Copyright (c) 2012年 zte. All rights reserved.
//

#import "UICustomTextField.h"

@implementation UICustomTextField

- (id)initWithFrame:(CGRect)frame Textcolor:(UIColor *)textColor
{
    if (self = [super initWithFrame:frame])
    {
        /* 垂直居中 */
        self.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;  
        
        /* 右侧显示 */
        self.textAlignment = NSTextAlignmentCenter;
        
        /* 右边显示的'X'清除按钮 */
        self.clearButtonMode = UITextFieldViewModeWhileEditing;
        
        self.font = [UIFont systemFontOfSize:12.0];
        
        if (self.leftView == nil)
        {
            UIImageView *leftImageView = [[UIImageView alloc] init];
            leftImageView.frame = CGRectMake(0, 0, 10, 35);
            self.leftView = leftImageView;
            self.leftViewMode = UITextFieldViewModeAlways;
        }
        
        if (self.rightImageView == nil)
        {
            self.rightImageView = [[UIImageView alloc]init];
            self.rightImageView.frame = CGRectMake(self.frame.size.width - 15, (self.frame.size.height - 10)/2.0, 10, 10);
            [self addSubview:self.rightImageView];
        }
        /* 自动纠错 */
        self.autocorrectionType = UITextAutocorrectionTypeYes;
//        [self addPreviousNextDone:self previousAction:nil nextAction:nil doneAction:nil];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)setEnabledWithString:(NSString *)enable
{
    if ([enable isEqualToString:@"YES"])
    {
        UIImage *image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Input_star" ofType:@"png"]];
        self.rightImageView.image = image;
        
        [super setEnabled:YES];
    }
    else
    {
        [super setEnabled:NO];
    }
}


-(void)setPlaceholder:(NSString *)placeholder
{
    [super setPlaceholder:placeholder];
    
    UIColor *color = nil;
    if (self.enabled == YES)
    {
        color = self.textColor;
    }
    else
    {
        color = HEXCOLOR(0X535353);
    }
    [self setValue:color forKeyPath:@"_placeholderLabel.textColor"];
}

@end

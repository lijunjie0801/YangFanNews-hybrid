//
//  LoginViewControllers.h
//  IOSFramework
//
//  Created by xu on 16/4/13.
//
//

#import <UIKit/UIKit.h>
#import "UINormalTextField.h"
//#import "CY_FileManager.h"

@interface MYLoginViewControllers : UIViewController<UITextFieldDelegate>
{
    NSUserDefaults *defaults;
   // LoginModel *loginModel;
    
    NSMutableDictionary *loginDic;

}
@property (nonatomic,strong) NSString *flag;

@end

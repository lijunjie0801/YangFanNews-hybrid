//
//  HomeViewCell.h
//  IOSFramework
//
//  Created by 王刚 on 16/3/25.
//
//

#import <UIKit/UIKit.h>
#import "HomeViewMd.h"
@interface HomeViewCell : UITableViewCell
@property (nonatomic,strong) HomeViewMd *MdOne;
@property (nonatomic,strong) HomeViewMd *MdTwo;
@property (nonatomic,strong)NSMutableArray *productArr;
@property(nonatomic,strong)UIImageView *imgView;
-(void)configImgDataArray:(NSMutableArray *)array:(NSMutableArray *)arrayLabel;
@end


//
//  HomeViewCell.m
//  IOSFramework
//
//  Created by 王刚 on 16/3/25.
//
//

#import "HomeViewCell.h"

@implementation HomeViewCell



-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    NSLog(@"====%@====",self.productArr);
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        if (self.productArr.count==0) {
            
        }
        for (int i = 0; i <4; i++) {
            
            CGFloat spear = 3;
            UIView *leftView = [[UIView alloc]init];
            [self.contentView addSubview:leftView];
            leftView.backgroundColor=[UIColor whiteColor];
            CGFloat width=(kScreen_Width - spear*3)/2;
            [leftView autoSetDimensionsToSize:CGSizeMake((kScreen_Width - spear*3)/2, 205)];
            if (i<2) {
                [leftView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:3*(i+1)+width*i];
                [leftView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:5];
            }else{
                [leftView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:3*(i+1-2)+width*(i-2)];
                [leftView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:218];
            }
            
            
            //           NSString *imgStr=[NSString stringWithFormat:@"非车配图-%d",i+1];
            UIImageView *imageView = [[UIImageView alloc]init];
            //            self.imgView=imageView;
            imageView.tag = 100+i;
            //imageView.image = [UIImage imageNamed:imgStr];
            //            imageView.image=self.productArr[i];
            [leftView addSubview:imageView];
            [imageView autoSetDimensionsToSize:CGSizeMake(0, 150)];
            [imageView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0];
            [imageView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:0];
            [imageView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:0];
            
            
            //            NSArray *arr=@[@"A",@"C",@"B",@"D"];
            UILabel *priceLabel = [[UILabel alloc]init];
            //            priceLabel.text = [NSString stringWithFormat:@"旅程无忧（%@）",arr[i]];
            priceLabel.tag = 200+i;
            priceLabel.textAlignment=UITextAlignmentCenter;
            priceLabel.font = [UIFont systemFontOfSize:14];
            priceLabel.adjustsFontSizeToFitWidth = YES;
            [leftView addSubview:priceLabel];
            [priceLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:3];
            [priceLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:3];
            [priceLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:imageView withOffset:5];
            
            
            UIButton *byeBtn = [[UIButton alloc]init];
            [byeBtn setTitle:@"敬请期待" forState:UIControlStateNormal];
            byeBtn.titleLabel.font = [UIFont systemFontOfSize:15];
            [byeBtn setBackgroundColor:[UIColor colorWithHexString:@"ed6d2a"]];
            [leftView addSubview:byeBtn];
            [byeBtn autoSetDimensionsToSize:CGSizeMake(0, 25)];
            [byeBtn autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:3];
            [byeBtn autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:3];
            byeBtn.tag=i;
            [byeBtn addTarget:self action:@selector(photographButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
            [byeBtn autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:priceLabel withOffset:5];
            
        }
        
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)configImgDataArray:(NSMutableArray *)array:(NSMutableArray *)arrayLabel
{
    self.productArr=array;
    if ([array count]!=0){
        for (int i=0; i<[array count]; i++) {
            UIImageView *imgV = (UIImageView *)[self viewWithTag:100+i];
            imgV.image = array[i];
        }
    }
    if ([arrayLabel count]!=0) {
        for (int i=0; i<[array count]; i++) {
            UILabel *labelV = (UILabel *)[self viewWithTag:200+i];
            labelV.text = arrayLabel[i];
        }
    }
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
}
- (void)photographButtonClicked:(UIButton *)sender
{
    NSLog(@"%ld",(long)sender.tag);
    NSLog(@"%@",self.productArr[sender.tag]);
}


@end

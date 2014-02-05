//
//  TipsCell.h
//  CarDealJN
//
//  Created by Luke McDonald on 1/29/14.
//  Copyright (c) 2014 JonathanMarCox. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TipsCell : UITableViewCell

@property (strong, nonatomic) UILabel *mCellTtleLabel;
@property (strong, nonatomic) CALayer *mImageLayer;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;

-(void)setCellTitle:(NSString*)title;
-(void)setIcon:(UIImage*)image;

@end

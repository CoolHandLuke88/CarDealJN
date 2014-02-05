//
//  TipsCell.m
//  CarDealJN
//
//  Created by Luke McDonald on 1/29/14.
//  Copyright (c) 2014 JonathanMarCox. All rights reserved.
//

#import "TipsCell.h"

@implementation TipsCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        // Initialization code
//        self.selectionStyle = UITableViewCellSelectionStyleNone;
//        //add the image layer
//        self.contentView.backgroundColor = [UIColor blackColor];
//        _mImageLayer =[CALayer layer];
//        _mImageLayer.cornerRadius = 16.0;
//        //mImageLayer.backgroundColor = [UIColor greenColor].CGColor;
//        //  mImageLayer.contents = (id)[UIImage imageNamed:@"2.png"].CGImage;
//        [self.contentView.layer addSublayer:_mImageLayer];
//        _mImageLayer.borderWidth=4.0;
//        _mImageLayer.borderColor = [UIColor whiteColor].CGColor;
//        
//        //the title label
//        _mCellTtleLabel = [[UILabel alloc] initWithFrame:CGRectMake(44.0, 10.0, self.contentView.bounds.size.width - 44.0, 21.0)];
//        [self.contentView addSubview:_mCellTtleLabel];
//        _mCellTtleLabel.backgroundColor= [UIColor clearColor];
//        _mCellTtleLabel.textColor = [UIColor whiteColor];
//        _mCellTtleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:14.0];
    }
    return self;
}

/*
-(void)layoutSubviews
{
    [super layoutSubviews];
    float imageY = 4.0;
    float heightOfImageLayer  = self.bounds.size.height - imageY*2.0;
    heightOfImageLayer = floorf(heightOfImageLayer);
    _mImageLayer.cornerRadius = heightOfImageLayer/2.0f;
    _mImageLayer.frame = CGRectMake(4.0, imageY, heightOfImageLayer, heightOfImageLayer);
    _mCellTtleLabel.frame = CGRectMake(heightOfImageLayer+10.0, floorf(heightOfImageLayer/2.0 - (21/2.0f))+4.0, self.contentView.bounds.size.width-heightOfImageLayer+10.0, 21.0);
    
}

-(void)setCellTitle:(NSString*)title
{
    _mCellTtleLabel.text = title;
}

-(void)setIcon:(UIImage*)image
{
    [CATransaction begin];
    [CATransaction setAnimationDuration:0];
    _mImageLayer.contents = (id)image.CGImage;
    [CATransaction commit];
}

-(void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    
}
*/

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    
    _mImageLayer.borderColor = selected ? [UIColor orangeColor].CGColor : [UIColor whiteColor].CGColor;
    _mCellTtleLabel.textColor = selected ? [UIColor orangeColor] : [UIColor whiteColor];
}

@end

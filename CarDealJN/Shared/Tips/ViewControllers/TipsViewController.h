//
//  TipsViewController.h
//  CarDealJN
//
//  Created by Luke McDonald on 1/29/14.
//  Copyright (c) 2014 JonathanMarCox. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TipsCell.h"
#import "BBTableView.h"

@interface TipsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSArray *tipsArray;
@property (weak, nonatomic) IBOutlet BBTableView *tipsTableView;

@end

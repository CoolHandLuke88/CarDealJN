//
//  InfoViewController.h
//  CarDealJN
//
//  Created by jonathan Marr-Cox on 1/29/14.
//  Copyright (c) 2014 JonathanMarCox. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InfoViewController : UIViewController
<MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *infoMapView;
@end

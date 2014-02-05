//
//  AppDelegate.h
//  CarDealJN
//
//  Created by Luke McDonald on 1/29/14.
//  Copyright (c) 2014 JonathanMarCox. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
+ (AppDelegate *)appDelegate;
- (void)addLoadingScreenWithParentViewController:(UIViewController *)parentViewController;
- (void)removeLoadingScreenWithParentViewController:(UIViewController *)parentViewController;
@end

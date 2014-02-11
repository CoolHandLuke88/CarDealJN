//
//  AppDelegate.h
//  CarDealJN
//
//  Created by jonathan Marr-Cox on 1/29/14.
//  Copyright (c) 2014 JonathanMarCox. All rights reserved.
// see url for meteor and ios implementation..
// http://stackoverflow.com/questions/12969528/can-a-native-ios-client-connect-to-a-meteor-js-server

#import <UIKit/UIKit.h>
#import "MeteorClient.h"
#import "ObjectiveDDP.h"

extern NSString *const LoginSuccessNotification;


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
+ (AppDelegate *)appDelegate;
- (void)addLoadingScreenWithParentViewController:(UIViewController *)parentViewController;
- (void)removeLoadingScreenWithParentViewController:(UIViewController *)parentViewController;
- (void)showLogin;

@property (strong, nonatomic) MeteorClient *meteorClient;
@end

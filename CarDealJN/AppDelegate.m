//
//  AppDelegate.m
//  CarDealJN
//
//  Created by jonathan Marr-Cox on 1/29/14.
//  Copyright (c) 2014 JonathanMarCox. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "LoginViewController.h"

NSString *const LoginSuccessNotification = @"LoginSuccessNotification";


@interface AppDelegate ()
@property (strong, nonatomic) LoadingScreenViewController *loadingScreenViewController;
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    _loadingScreenViewController = [self.window.rootViewController.storyboard instantiateViewControllerWithIdentifier:@"LoadingScreenViewController"];
    _loadingScreenViewController.view.alpha = 0.0f;
    
    self.meteorClient = [[MeteorClient alloc] init];
    [self.meteorClient addSubscription:@"things"];
    [self.meteorClient addSubscription:@"lists"];
    
     ObjectiveDDP *ddp = [[ObjectiveDDP alloc] initWithURLString:@"wss://ddptester.meteor.com/websocket" delegate:self.meteorClient];
    
    // local testing
    //ObjectiveDDP *ddp = [[ObjectiveDDP alloc] initWithURLString:@"ws://localhost:3000/websocket" delegate:self.meteorClient];
    
    self.meteorClient.ddp = ddp;
    [self.meteorClient.ddp connectWebSocket];
    
    LoginViewController *loginController = [self.window.rootViewController.storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    loginController.meteor = self.meteorClient;
    [self presentLogin:loginController];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reportConnection) name:MeteorClientDidConnectNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reportDisconnection) name:MeteorClientDidDisconnectNotification object:nil];
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    
    [self.meteorClient.ddp connectWebSocket];

}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - Meteor Related Methods

- (void)reportConnection {
    NSLog(@"================> connected to server!");
}

- (void)reportDisconnection {
    NSLog(@"================> disconnected from server!");
}


#pragma mark - Custom Methods

+ (AppDelegate *)appDelegate
{
    return (AppDelegate *)[UIApplication sharedApplication].delegate;
}

- (void)presentLogin:(LoginViewController *)loginViewController
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.window.rootViewController presentViewController:loginViewController animated:YES completion:nil];

    });
}


- (void)showLogin
{
       LoginViewController *loginController = [self.window.rootViewController.storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.window.rootViewController presentViewController:loginController animated:YES completion:nil];
        
    });
}
#pragma mark - Loading Screen

- (void)addLoadingScreenWithParentViewController:(UIViewController *)parentViewController
{
    // LoadingScreenViewController

    [parentViewController.view addSubview:_loadingScreenViewController.view];
    
    [UIView animateWithDuration:0.3f animations:^{
        _loadingScreenViewController.view.alpha = 1.0f;
    }];
}

- (void)removeLoadingScreenWithParentViewController:(UIViewController *)parentViewController
{
    [UIView animateWithDuration:0.3f animations:^{
        _loadingScreenViewController.view.alpha = 0.0f;
    } completion:^(BOOL finished) {
        [_loadingScreenViewController.view removeFromSuperview];
    }];
}

@end

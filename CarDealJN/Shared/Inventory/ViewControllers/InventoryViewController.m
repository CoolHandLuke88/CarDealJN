//
//  InventoryViewController.m
//  CarDealJN
//
//  Created by Luke McDonald on 1/29/14.
//  Copyright (c) 2014 JonathanMarCox. All rights reserved.
//

#import "InventoryViewController.h"

@interface InventoryViewController ()

@end

@implementation InventoryViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    // NOTE
    // another url for all intents and purposes
    // for this class demonstration..
    // http://www.prestige4u.com/used-inventory/
    
    [[AppDelegate appDelegate] addLoadingScreenWithParentViewController:self];
    
    NSString *urlString = @"http://www.enterprisecarsales.com/list/just-in-inventory-1?campaignid=elantra";
    
  
    NSURL *url = [NSURL URLWithString:urlString];
    
  
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
  
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
  
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error)
     {
         if ([data length] > 0 && error == nil)
         {
             [self.inventoryWebView loadRequest:request];
         }
         else if (error != nil)
         {
             NSLog(@"Error: %@", error);
         }
         
         dispatch_async(dispatch_get_main_queue(), ^{
             [[AppDelegate appDelegate] removeLoadingScreenWithParentViewController:self]; 
         });
     }];
}



@end

//
//  TipsViewController.m
//  CarDealJN
//
//  Created byjonathan Marr-Cox on 1/29/14.
//  Copyright (c) 2014 JonathanMarCox. All rights reserved.
//

#import "TipsViewController.h"

@interface TipsViewController ()

@end

@implementation TipsViewController

#pragma mark - Initialization

- (void)setup
{
    // NOTES
    // URL FOR TIPS
    // http://editorial.autos.msn.com/10-tips-for-regret-free-car-buying?page=2
    _tipsArray = @[@"Tip 1. Browse with no intention of buying",
                   @"Tip 2. Find out what the dealer paid for vehicle",
                   @"Tip 3. Get an online price quote",
                   @"Tip 4. Get your paperwork in order",
                   @"Tip 5. Forget about leasing",
                   @"Tip 6. Don’t talk financing or trade-ins until you’ve settled on a price",
                   @"Tip 7. Don’t fail the test drive",
                   @"Tip 8. Take a close look at the fees",
                   @"Tip 9. Don’t buy into pointless dealership services",
                   @"Tip 10. Be ready to walk away"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder])
    {
        // initialization ...
        
        [self setup];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self enableInfiniteScrolling:nil];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.tipsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"TipsCell";
    TipsCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    if ([_tipsArray count] > 0)
    {
        cell.tipLabel.text = _tipsArray[indexPath.row];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - IBActions

- (IBAction)switchDirections:(id)sender
{
    [self.tipsTableView setContentAlignment:[sender selectedSegmentIndex] ? eBBTableViewContentAlignmentRight : eBBTableViewContentAlignmentLeft];
    [self.tipsTableView reloadData];
}

- (IBAction)enableInfiniteScrolling:(id)sender
{
    [self.tipsTableView setContentAlignment:1 ? eBBTableViewContentAlignmentRight : eBBTableViewContentAlignmentLeft];
    [self.tipsTableView setEnableInfiniteScrolling:YES];
    [self.tipsTableView reloadData];
}


@end

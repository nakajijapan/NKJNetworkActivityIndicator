//
//  NKJViewController.m
//  NKJNetworkIndicator
//
//  Created by nakajijapan on 05/31/2015.
//  Copyright (c) 2014 nakajijapan. All rights reserved.
//

#import "NKJViewController.h"
#import "NKJTableViewCell.h"
#import "NKJNetworkActivityIndicator.h"
#import "NKJDetailViewController.h"


@interface NKJViewController ()

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@end

@implementation NKJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NKJTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.titleLabel.text = [NSString stringWithFormat:@"Indicator %2zd", indexPath.row];
    return cell;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ([[segue identifier] isEqualToString:@"detail"]) {
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];

        NKJDetailViewController *viewController = [segue destinationViewController];
        viewController.identifier = indexPath.row;

    }
}

@end

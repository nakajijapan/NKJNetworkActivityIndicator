//
//  NKJDetailViewController.m
//  NKJNetworkIndicator
//
//  Created by nakajijapan on 5/31/15.
//  Copyright (c) 2015 nakajijapan. All rights reserved.
//

#import "NKJDetailViewController.h"
#import "NKJNetworkActivityIndicator.h"

@interface NKJDetailViewController ()

@end

@implementation NKJDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(networkIndicatorDidStop:) name:kNKJNetworkActivityIndicatorDidStop object:nil];

    [self.indicator startAnimating];
    

    if ([[NKJNetworkActivityIndicator sharedIndicator] connectingActivityWithName:NSStringFromClass([self class]) identifier:self.identifier]) {
        return;
    }

    [[NKJNetworkActivityIndicator sharedIndicator] startActivityWithName:NSStringFromClass([self class])
                                                              identifier:self.identifier];


    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        sleep(5);
        
        [[NKJNetworkActivityIndicator sharedIndicator] stopActivityWithName:NSStringFromClass([self class])
                                                                 identifier:self.identifier];

    });
    

}

- (void)viewWillDisappear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kNKJNetworkActivityIndicatorDidStop object:nil];
}

- (void)networkIndicatorDidStop:(NSNotification *)notification
{
    NSDictionary *userInfo = [notification userInfo];
    NSLog(@"userInfo : %@", userInfo);
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.indicator stopAnimating];
    });
}

@end

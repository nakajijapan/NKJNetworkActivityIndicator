//
//  NKJDetailViewController.h
//  NKJNetworkIndicator
//
//  Created by nakajijapan on 5/31/15.
//  Copyright (c) 2015 nakajijapan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NKJDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicator;
@property (nonatomic) NSInteger identifier;

@end

//
//  NKJNetworkActivityIndicator.h
//  Pods
//
//  Created by nakajijapan on 5/31/15.
//
//

#import <Foundation/Foundation.h>

static NSString * const kNKJNetworkActivityIndicatorDidStop = @"NKJNetworkActivityIndicator";


@interface NKJNetworkActivityIndicator : NSObject
+ (instancetype)sharedIndicator;
- (void)startActivityWithName:(NSString *)name identifier:(NSInteger)identifier;
- (BOOL)connectingActivityWithName:(NSString *)name identifier:(NSInteger)identifier;
- (void)stopActivityWithName:(NSString *)name identifier:(NSInteger)identifier;
@end

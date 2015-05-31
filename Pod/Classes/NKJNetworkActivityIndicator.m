//
//  NKJNetworkActivityIndicator.m
//  Pods
//
//  Created by nakajijapan on 5/31/15.
//
//

#import "NKJNetworkActivityIndicator.h"
#import <UIKit/UIKit.h>

@interface NKJNetworkActivityIndicator()
@property(nonatomic) NSMutableArray *activities;
@end

@implementation NKJNetworkActivityIndicator

static NKJNetworkActivityIndicator *sharedIndicator = nil;

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.activities = @[].mutableCopy;
    }
    return self;
}

#pragma mark - Public Methods

+ (instancetype)sharedIndicator
{
    static NKJNetworkActivityIndicator *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (void)startActivityWithName:(NSString *)name identifier:(NSInteger)identifier
{
    for (int counter = 0; counter < self.activities.count; counter++) {
        
        if ([self.activities[counter][@"name"] isEqualToString:name] && [self.activities[counter][@"id"] integerValue] == identifier) {
            return;
        }
    }

    [self.activities addObject:@{@"name": name, @"id": [NSNumber numberWithInteger:identifier]}];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

- (BOOL)connectingActivityWithName:(NSString *)name identifier:(NSInteger)identifier
{
    for (int counter = 0; counter < self.activities.count; counter++) {
        
        if ([self.activities[counter][@"name"] isEqualToString:name] && [self.activities[counter][@"id"] integerValue] == identifier) {
            return YES;
        }
    }
    return NO;
}

- (void)stopActivityWithName:(NSString *)name identifier:(NSInteger)identifier
{
    for (int counter = 0; counter < self.activities.count; counter++) {
        if ([self.activities[counter][@"name"] isEqualToString:name] && [self.activities[counter][@"id"] integerValue] == identifier) {
            
            NSDictionary *userInfo = [NSDictionary dictionaryWithDictionary:self.activities[counter]];
            [self.activities removeObjectAtIndex:counter];
            [[NSNotificationCenter defaultCenter] postNotificationName:kNKJNetworkActivityIndicatorDidStop object:self userInfo:userInfo];
            
            if (self.activities.count < 1) {
                [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
            }
            
            return;
        }
    }
}


@end

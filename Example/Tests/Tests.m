//
//  NKJNetworkIndicatorTests.m
//  NKJNetworkIndicatorTests
//
//  Created by nakajijapan on 05/31/2015.
//  Copyright (c) 2015 nakajijapan. All rights reserved.
//

@import XCTest;
#import "NKJNetworkActivityIndicator.h"
#import <UIKit/UIKit.h>

@interface Tests : XCTestCase

@end

@implementation Tests

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
    
    [[NKJNetworkActivityIndicator sharedIndicator] stopActivityWithName:NSStringFromClass([self class])
                                                             identifier:2];
    [[NKJNetworkActivityIndicator sharedIndicator] stopActivityWithName:NSStringFromClass([self class])
                                                             identifier:1];

}


- (void)testShouldStopActivityWhenExecutingOnceActivity
{
    [[NKJNetworkActivityIndicator sharedIndicator] startActivityWithName:NSStringFromClass([self class])
                                                            identifier:1];
    [[NKJNetworkActivityIndicator sharedIndicator] stopActivityWithName:NSStringFromClass([self class])
                                                            identifier:1];
    XCTAssertTrue([UIApplication sharedApplication].networkActivityIndicatorVisible == NO);
    XCTAssertTrue(![[NKJNetworkActivityIndicator sharedIndicator]
                    connectingActivityWithName:NSStringFromClass([self class]) identifier:1]);


}

- (void)testShouldAnimatingActivityWhenExecutingOnceActivity
{
    [[NKJNetworkActivityIndicator sharedIndicator] startActivityWithName:NSStringFromClass([self class])
                                                              identifier:1];
    XCTAssertEqual([UIApplication sharedApplication].networkActivityIndicatorVisible, YES);
    XCTAssertTrue([[NKJNetworkActivityIndicator sharedIndicator]
                   connectingActivityWithName:NSStringFromClass([self class]) identifier:1]);

}


- (void)testShouldStopActivityWhenExecutingTowActivity
{
    [[NKJNetworkActivityIndicator sharedIndicator] startActivityWithName:NSStringFromClass([self class])
                                                              identifier:1];
    [[NKJNetworkActivityIndicator sharedIndicator] startActivityWithName:NSStringFromClass([self class])
                                                              identifier:2];

    [[NKJNetworkActivityIndicator sharedIndicator] stopActivityWithName:NSStringFromClass([self class])
                                                             identifier:2];
    [[NKJNetworkActivityIndicator sharedIndicator] stopActivityWithName:NSStringFromClass([self class])
                                                             identifier:1];
    XCTAssertTrue([UIApplication sharedApplication].networkActivityIndicatorVisible == NO);
    XCTAssertTrue(![[NKJNetworkActivityIndicator sharedIndicator]
                    connectingActivityWithName:NSStringFromClass([self class]) identifier:1]);
    XCTAssertTrue(![[NKJNetworkActivityIndicator sharedIndicator]
                    connectingActivityWithName:NSStringFromClass([self class]) identifier:2]);

}

- (void)testShouldAnimatingActivityWhenExecutingTwoActivity
{
    [[NKJNetworkActivityIndicator sharedIndicator] startActivityWithName:NSStringFromClass([self class])
                                                              identifier:1];
    [[NKJNetworkActivityIndicator sharedIndicator] startActivityWithName:NSStringFromClass([self class])
                                                              identifier:2];
    [[NKJNetworkActivityIndicator sharedIndicator] stopActivityWithName:NSStringFromClass([self class])
                                                             identifier:1];

    XCTAssertTrue([UIApplication sharedApplication].networkActivityIndicatorVisible == YES);
    XCTAssertTrue(![[NKJNetworkActivityIndicator sharedIndicator]
                    connectingActivityWithName:NSStringFromClass([self class]) identifier:1]);
    XCTAssertTrue([[NKJNetworkActivityIndicator sharedIndicator]
                    connectingActivityWithName:NSStringFromClass([self class]) identifier:2]);


}

- (void)testShouldStopActivityWhenDuplicatedActivity
{
    [[NKJNetworkActivityIndicator sharedIndicator] startActivityWithName:@"DuplicatedActivity"
                                                              identifier:1];
    [[NKJNetworkActivityIndicator sharedIndicator] startActivityWithName:@"DuplicatedActivity"
                                                              identifier:1];
    [[NKJNetworkActivityIndicator sharedIndicator] stopActivityWithName:@"DuplicatedActivity"
                                                             identifier:1];
    
    XCTAssertTrue([UIApplication sharedApplication].networkActivityIndicatorVisible == NO);
    XCTAssertTrue(![[NKJNetworkActivityIndicator sharedIndicator]
                   connectingActivityWithName:NSStringFromClass([self class]) identifier:1]);
    
}

@end

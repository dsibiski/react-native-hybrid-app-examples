//
//  PassingDataViewController.m
//  RNEmbeddedAppExample
//
//  Created by Dave Sibiski on 9/2/15.
//  Copyright (c) 2015 Facebook. All rights reserved.
//

#import "PassingDataViewController.h"
#import "AppDelegate.h"
#import "RCTRootView.h"

@interface PassingDataViewController ()

@end

@implementation PassingDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Passing Data";
    
    // We need a reference to the AppDelegate since that is where we stored our `RCTBridge`.
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    // Here we create a `RCTRootView` that initializes with the `RCTBridge` that we already pre-loaded.
    RCTRootView *rootView = [[RCTRootView alloc] initWithBridge:delegate.bridge moduleName:@"PassingData"];
    
    // We want this view to take up the entire screen.
    rootView.frame = [UIScreen mainScreen].bounds;
    
    // Here is where we pass down our data that will be a `prop` in the `PassingData` component.
    rootView.initialProperties = [self data];
    
    // Each `ViewController` comes with it's own "base" view, here we just want to add our `RCTRootView`
    // to that "base" view so that it is visible on the screen.
    [self.view addSubview:rootView];
}

// Just some random data. It is an `NSDictionary` with an `NSArray` that has the key `data`. In our React
// component it can be accessed as `this.props.data`.
- (NSDictionary *)data {
    return @{
        @"data": @[
            @"Here",
            @"is",
            @"an",
            @"example",
            @"of",
            @"passing",
            @"data",
            @"into",
            @"a",
            @"React",
            @"View",
            @"that",
            @"is",
            @"embedded",
            @"in",
            @"a",
            @"Native",
            @"View",
        ]
    };
}

@end
